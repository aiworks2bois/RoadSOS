import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import '../../../core/config/app_config.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/providers/core_providers.dart';
import '../../../domain/providers/sos_provider.dart';

class ActiveIncidentScreen extends ConsumerStatefulWidget {
  final String incidentId;
  const ActiveIncidentScreen({super.key, required this.incidentId});

  @override
  ConsumerState<ActiveIncidentScreen> createState() => _ActiveIncidentScreenState();
}

class _ActiveIncidentScreenState extends ConsumerState<ActiveIncidentScreen> {
  WebSocketChannel? _channel;
  Timer? _heartbeatTimer;
  Timer? _locationTimer;

  String _status = 'active';
  String? _note;
  final List<_WsEvent> _feed = [];
  bool _mciWarning = false;
  bool _isCancelling = false;

  @override
  void initState() {
    super.initState();
    _connectWebSocket();
    _startLocationUpdates();
  }

  Future<void> _connectWebSocket() async {
    final tokenStore = ref.read(tokenStoreProvider);
    final token = await tokenStore.getAccessToken();
    final wsBase = AppConfig.current.wsBaseUrl;
    final uri = Uri.parse('$wsBase/sos/ws/${widget.incidentId}?token=$token');

    try {
      _channel = WebSocketChannel.connect(uri);
      _channel!.stream.listen(
        _onWsMessage,
        onDone: _onWsDone,
        onError: (_) => _scheduleReconnect(),
      );
      // Heartbeat: send empty frame every 25s to keep alive
      _heartbeatTimer = Timer.periodic(const Duration(seconds: 25), (_) {
        _channel?.sink.add('ping');
      });
    } catch (_) {
      _scheduleReconnect();
    }
  }

  void _onWsMessage(dynamic raw) {
    try {
      final data = jsonDecode(raw as String) as Map<String, dynamic>;
      final type = data['type'] as String? ?? '';
      setState(() {
        switch (type) {
          case 'status_updated':
            _status = data['status'] as String? ?? _status;
            _note = data['note'] as String?;
            _feed.insert(0, _WsEvent(type: 'status', text: 'Status → ${_status.toUpperCase()}', subtitle: _note, time: DateTime.now()));
          case 'responder_updated':
            final vStatus = data['status'] as String? ?? '';
            _feed.insert(0, _WsEvent(type: 'volunteer', text: vStatus == 'accepted' ? '🚑 Volunteer accepted — on the way!' : 'Volunteer declined. Searching for another...', time: DateTime.now()));
          case 'location_updated':
            // Silently track; no feed item needed
            break;
          case 'mci_provisional':
            _mciWarning = true;
            _feed.insert(0, _WsEvent(type: 'mci', text: data['message'] as String? ?? 'Multiple casualties detected nearby', time: DateTime.now()));
        }
      });
    } catch (_) {}
  }

  void _onWsDone() {
    _scheduleReconnect();
  }

  Timer? _reconnectTimer;
  void _scheduleReconnect() {
    _reconnectTimer?.cancel();
    _reconnectTimer = Timer(const Duration(seconds: 5), _connectWebSocket);
  }

  void _startLocationUpdates() {
    _locationTimer = Timer.periodic(const Duration(seconds: 3), (_) async {
      try {
        final locService = ref.read(locationServiceProvider);
        final pos = await locService.getCurrentPosition();
        final sosRepo = ref.read(sosRepositoryProvider);
        await sosRepo.updateLiveLocation(widget.incidentId, pos.latitude, pos.longitude);
      } catch (_) {}
    });
  }

  Future<void> _cancelSos() async {
    setState(() => _isCancelling = true);
    // TODO: call PATCH /sos/incidents/{id}/status with status: cancelled
    await Future.delayed(const Duration(milliseconds: 800));
    ref.read(sosNotifierProvider.notifier).clearSos();
    if (mounted) context.go(Routes.sosTrigger);
  }

  @override
  void dispose() {
    _heartbeatTimer?.cancel();
    _locationTimer?.cancel();
    _reconnectTimer?.cancel();
    _channel?.sink.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width > 600;
    final hPad = isTablet ? 48.0 : 20.0;

    final statusColor = switch (_status) {
      'acknowledged' => const Color(0xFF00C853),
      'resolved' => const Color(0xFF2979FF),
      'cancelled' => const Color(0xFF8A90A0),
      _ => const Color(0xFFFF2D2D),
    };

    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      appBar: AppBar(
        title: const Text('Active SOS', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        leading: const SizedBox(), // No back navigation during active incident
      ),
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 20),
          children: [

            // ── MCI Warning ─────────────────────────────────────────────────
            if (_mciWarning)
              Container(
                margin: const EdgeInsets.only(bottom: 16),
                padding: const EdgeInsets.all(14),
                decoration: BoxDecoration(
                  color: const Color(0xFFFF6B00).withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: const Color(0xFFFF6B00), width: 1.5),
                ),
                child: const Row(
                  children: [
                    Icon(Icons.warning_amber_rounded, color: Color(0xFFFF6B00), size: 24),
                    SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        'Multiple casualties detected nearby.\nDO NOT MOVE unless in immediate danger. Wait for unified dispatch.',
                        style: TextStyle(color: Color(0xFFFF6B00), fontWeight: FontWeight.w600, fontSize: 13, height: 1.5),
                      ),
                    ),
                  ],
                ),
              ),

            // ── Status Card ──────────────────────────────────────────────────
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: const Color(0xFF1A1E2A),
                borderRadius: BorderRadius.circular(16),
                border: Border.all(color: statusColor.withValues(alpha: 0.4)),
              ),
              child: Column(children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                      const Text('Status', style: TextStyle(color: Color(0xFF8A90A0), fontSize: 12, letterSpacing: 0.5)),
                      const SizedBox(height: 4),
                      Row(children: [
                        Container(width: 8, height: 8, decoration: BoxDecoration(shape: BoxShape.circle, color: statusColor)),
                        const SizedBox(width: 8),
                        Text(_status.toUpperCase(), style: TextStyle(color: statusColor, fontWeight: FontWeight.w800, fontSize: 18, letterSpacing: 1, fontFamily: 'Outfit')),
                      ]),
                    ]),
                    // Pulsing emergency icon
                    _PulsingIcon(color: statusColor),
                  ],
                ),
                if (_note != null) ...[
                  const SizedBox(height: 10),
                  Text(_note!, style: const TextStyle(color: Color(0xFFEEF0F5), fontSize: 14)),
                ],
                const SizedBox(height: 12),
                const Divider(color: Color(0xFF2A3040)),
                const SizedBox(height: 8),
                Row(children: [
                  const Icon(Icons.tag, color: Color(0xFF8A90A0), size: 14),
                  const SizedBox(width: 4),
                  Expanded(
                    child: Text('Incident ID: ${widget.incidentId}', style: const TextStyle(color: Color(0xFF8A90A0), fontSize: 11), overflow: TextOverflow.ellipsis),
                  ),
                ]),
              ]),
            ),

            const SizedBox(height: 20),

            // ── Live Feed ────────────────────────────────────────────────────
            const Text('Live Updates', style: TextStyle(fontFamily: 'Outfit', fontSize: 15, fontWeight: FontWeight.w600, color: Color(0xFFEEF0F5))),
            const SizedBox(height: 12),

            if (_feed.isEmpty)
              const _EmptyFeed()
            else
              ...(_feed.take(10).map((e) => _FeedTile(event: e))),

            const SizedBox(height: 28),

            // ── Emergency Bundle Button ──────────────────────────────────────
            FilledButton.icon(
              style: FilledButton.styleFrom(
                backgroundColor: const Color(0xFF1A3A6A),
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
              ),
              icon: const Icon(Icons.local_hospital),
              label: const Text('View Rescue Bundle', style: TextStyle(fontWeight: FontWeight.w700)),
              onPressed: () => context.go(Routes.bundlePath(widget.incidentId)),
            ),

            const SizedBox(height: 12),

            // ── Cancel SOS ───────────────────────────────────────────────────
            if (_status == 'active')
              OutlinedButton.icon(
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF8A90A0),
                  side: const BorderSide(color: Color(0xFF2A3040)),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                ),
                icon: _isCancelling
                    ? const SizedBox(width: 16, height: 16, child: CircularProgressIndicator(strokeWidth: 2))
                    : const Icon(Icons.cancel_outlined),
                label: const Text('Cancel SOS — I\'m safe'),
                onPressed: _isCancelling ? null : _cancelSos,
              ),

            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }
}

// ── WebSocket Event Model ─────────────────────────────────────────────────────

class _WsEvent {
  final String type; // 'status' | 'volunteer' | 'mci'
  final String text;
  final String? subtitle;
  final DateTime time;

  _WsEvent({required this.type, required this.text, this.subtitle, required this.time});
}

// ── Empty Feed ────────────────────────────────────────────────────────────────

class _EmptyFeed extends StatelessWidget {
  const _EmptyFeed();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(24),
      decoration: BoxDecoration(color: const Color(0xFF1A1E2A), borderRadius: BorderRadius.circular(12)),
      child: const Column(
        children: [
          CircularProgressIndicator(color: Color(0xFFFF2D2D), strokeWidth: 2.5),
          SizedBox(height: 14),
          Text('Connecting to rescue network...', style: TextStyle(color: Color(0xFF8A90A0), fontSize: 13)),
          SizedBox(height: 4),
          Text('Notifying nearby volunteers and services', style: TextStyle(color: Color(0xFF8A90A0), fontSize: 12)),
        ],
      ),
    );
  }
}

// ── Feed Tile ─────────────────────────────────────────────────────────────────

class _FeedTile extends StatelessWidget {
  final _WsEvent event;
  const _FeedTile({required this.event});

  @override
  Widget build(BuildContext context) {
    final (icon, color) = switch (event.type) {
      'volunteer' => (Icons.person_pin_circle, const Color(0xFF00C853)),
      'mci'       => (Icons.warning_amber, const Color(0xFFFF6B00)),
      _           => (Icons.info_outline, const Color(0xFF2979FF)),
    };

    final timeStr = '${event.time.hour.toString().padLeft(2, '0')}:${event.time.minute.toString().padLeft(2, '0')}';

    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.symmetric(horizontal: 14, vertical: 12),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1E2A),
        borderRadius: BorderRadius.circular(12),
        border: Border(left: BorderSide(color: color, width: 3)),
      ),
      child: Row(
        children: [
          Icon(icon, color: color, size: 20),
          const SizedBox(width: 10),
          Expanded(
            child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text(event.text, style: const TextStyle(color: Color(0xFFEEF0F5), fontWeight: FontWeight.w600, fontSize: 13)),
              if (event.subtitle != null) ...[
                const SizedBox(height: 2),
                Text(event.subtitle!, style: const TextStyle(color: Color(0xFF8A90A0), fontSize: 12)),
              ],
            ]),
          ),
          Text(timeStr, style: const TextStyle(color: Color(0xFF8A90A0), fontSize: 11)),
        ],
      ),
    );
  }
}

// ── Pulsing Icon ──────────────────────────────────────────────────────────────

class _PulsingIcon extends StatefulWidget {
  final Color color;
  const _PulsingIcon({required this.color});

  @override
  State<_PulsingIcon> createState() => _PulsingIconState();
}

class _PulsingIconState extends State<_PulsingIcon> with SingleTickerProviderStateMixin {
  late final AnimationController _ctrl;
  late final Animation<double> _anim;

  @override
  void initState() {
    super.initState();
    _ctrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 900))..repeat(reverse: true);
    _anim = Tween<double>(begin: 0.5, end: 1.0).animate(CurvedAnimation(parent: _ctrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _ctrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: _anim,
      child: Icon(Icons.emergency, color: widget.color, size: 36),
    );
  }
}
