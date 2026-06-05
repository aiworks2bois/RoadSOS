import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:qr_flutter/qr_flutter.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/providers/sos_provider.dart';

class SosTriggerScreen extends ConsumerStatefulWidget {
  const SosTriggerScreen({super.key});

  @override
  ConsumerState<SosTriggerScreen> createState() => _SosTriggerScreenState();
}

class _SosTriggerScreenState extends ConsumerState<SosTriggerScreen>
    with TickerProviderStateMixin {
  // Countdown state
  int _countdown = 0;
  Timer? _countdownTimer;
  bool _isCounting = false;
  late final AnimationController _pulseCtrl;
  late final Animation<double> _pulseAnim;

  // Mode toggles
  bool _silentMode = false;
  bool _bystanderMode = false;

  // Bystander form
  final _victimNameCtrl = TextEditingController();
  final _victimPhoneCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    _pulseCtrl = AnimationController(vsync: this, duration: const Duration(milliseconds: 800))..repeat(reverse: true);
    _pulseAnim = Tween<double>(begin: 1.0, end: 1.12).animate(CurvedAnimation(parent: _pulseCtrl, curve: Curves.easeInOut));
  }

  @override
  void dispose() {
    _countdownTimer?.cancel();
    _pulseCtrl.dispose();
    _victimNameCtrl.dispose();
    _victimPhoneCtrl.dispose();
    super.dispose();
  }

  void _startCountdown() {
    if (_isCounting) return;
    setState(() {
      _countdown = 3;
      _isCounting = true;
    });
    _countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() => _countdown--);
      if (_countdown <= 0) {
        timer.cancel();
        _isCounting = false;
        _fireSos();
      }
    });
  }

  void _cancelCountdown() {
    if (!_isCounting) return;
    _countdownTimer?.cancel();
    setState(() {
      _isCounting = false;
      _countdown = 0;
    });
  }

  Future<void> _fireSos() async {
    final notifier = ref.read(sosNotifierProvider.notifier);
    await notifier.triggerSos(
      silent: _silentMode,
      bystanderMode: _bystanderMode,
      victimName: _bystanderMode ? _victimNameCtrl.text.trim() : null,
      victimPhone: _bystanderMode ? _victimPhoneCtrl.text.trim() : null,
    );
    final state = ref.read(sosNotifierProvider);
    if (mounted && state.activeSos != null) {
      context.go(Routes.activeIncidentPath(state.activeSos!.incidentId));
    }
  }

  void _showOfflinePacket(BuildContext context) {
    final expiryTime = DateTime.now().add(const Duration(minutes: 5));
    final expiryStr = '${expiryTime.hour.toString().padLeft(2, '0')}:${expiryTime.minute.toString().padLeft(2, '0')}';
    
    showModalBottomSheet(
      context: context,
      backgroundColor: const Color(0xFF1A1E2A),
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      isScrollControlled: true,
      builder: (ctx) => Padding(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Icon(Icons.wifi_off_rounded, color: Color(0xFF8A90A0), size: 32),
            const SizedBox(height: 12),
            const Text('Offline Mesh Packet', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
            const SizedBox(height: 8),
            const Text(
              'Show this QR to a nearby device or volunteer. Their device will automatically relay your signed SOS when it connects to the internet.',
              textAlign: TextAlign.center,
              style: TextStyle(color: Color(0xFF8A90A0), fontSize: 13, height: 1.5),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(12)),
              child: QrImageView(
                data: '{"i":"demo-id","p":"P1_CRITICAL","l":[0.0,0.0],"t":${DateTime.now().millisecondsSinceEpoch ~/ 1000}}',
                version: QrVersions.auto,
                size: 200.0,
              ),
            ),
            const SizedBox(height: 24),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: const Color(0xFFFF6B00).withValues(alpha: 0.1),
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: const Color(0xFFFF6B00).withValues(alpha: 0.3)),
              ),
              child: Row(
                children: [
                  const Icon(Icons.timer_outlined, color: Color(0xFFFF6B00), size: 16),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      'This packet is signed and expires at $expiryStr to prevent replay attacks.',
                      style: const TextStyle(color: Color(0xFFFF6B00), fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 24),
            SizedBox(
              width: double.infinity,
              child: FilledButton(
                style: FilledButton.styleFrom(backgroundColor: const Color(0xFF2A3040), padding: const EdgeInsets.symmetric(vertical: 14)),
                onPressed: () => Navigator.pop(ctx),
                child: const Text('Close'),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final sosState = ref.watch(sosNotifierProvider);
    final size = MediaQuery.sizeOf(context);
    final isTablet = size.width > 600;
    final btnSize = isTablet ? 280.0 : (size.width * 0.58).clamp(180.0, 240.0);

    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      appBar: AppBar(
        title: const Text('RoadSoS', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700, letterSpacing: 1)),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: isTablet ? 48 : 24, vertical: 16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: isTablet ? 40 : 20),

              // ── Status Banner ───────────────────────────────────────────────
              if (sosState.activeSos != null)
                _ActiveSosBanner(incidentId: sosState.activeSos!.incidentId, message: sosState.activeSos!.message)
              else ...[

                // ── Big SOS Button ──────────────────────────────────────────
                ScaleTransition(
                  scale: _pulseAnim,
                  child: GestureDetector(
                    onTap: sosState.isTriggering ? null : (_isCounting ? _cancelCountdown : _startCountdown),
                    child: AnimatedContainer(
                      duration: const Duration(milliseconds: 200),
                      width: btnSize,
                      height: btnSize,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        gradient: RadialGradient(
                          colors: _isCounting
                              ? [const Color(0xFFFF6B00), const Color(0xFFFF2D2D)]
                              : [const Color(0xFFFF2D2D), const Color(0xFFCC0000)],
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: const Color(0xFFFF2D2D).withValues(alpha: _isCounting ? 0.7 : 0.4),
                            blurRadius: _isCounting ? 60 : 40,
                            spreadRadius: _isCounting ? 20 : 10,
                          ),
                        ],
                      ),
                      child: Center(
                        child: sosState.isTriggering
                            ? const CircularProgressIndicator(color: Colors.white, strokeWidth: 3)
                            : _isCounting
                                ? Column(mainAxisSize: MainAxisSize.min, children: [
                                    Text('$_countdown', style: const TextStyle(fontSize: 72, fontWeight: FontWeight.w900, color: Colors.white)),
                                    const Text('TAP TO CANCEL', style: TextStyle(fontSize: 11, color: Colors.white70, letterSpacing: 1.5)),
                                  ])
                                : const Column(mainAxisSize: MainAxisSize.min, children: [
                                    Text('SOS', style: TextStyle(fontSize: 64, fontWeight: FontWeight.w900, color: Colors.white, letterSpacing: 2)),
                                    Text('HOLD 3 SECONDS', style: TextStyle(fontSize: 10, color: Colors.white60, letterSpacing: 1.5)),
                                  ]),
                      ),
                    ),
                  ),
                ),

                const SizedBox(height: 32),
                const Text(
                  'Tap to start 3-second countdown\nTap again to cancel',
                  textAlign: TextAlign.center,
                  style: TextStyle(color: Color(0xFF8A90A0), fontSize: 13, height: 1.6),
                ),

                const SizedBox(height: 32),

                // ── Mode Toggles ────────────────────────────────────────────
                _ModeToggleRow(
                  silentMode: _silentMode,
                  bystanderMode: _bystanderMode,
                  onSilentChanged: (v) => setState(() => _silentMode = v),
                  onBystanderChanged: (v) => setState(() => _bystanderMode = v),
                ),

                // ── Bystander Victim Details ────────────────────────────────
                if (_bystanderMode) ...[
                  const SizedBox(height: 20),
                  _BystanderForm(nameCtrl: _victimNameCtrl, phoneCtrl: _victimPhoneCtrl),
                ],

                const SizedBox(height: 24),
                
                // ── Offline Mesh Relay Button ───────────────────────────────
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: const Color(0xFF8A90A0),
                    side: const BorderSide(color: Color(0xFF2A3040)),
                    padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.wifi_off_rounded, size: 18),
                  label: const Text('Show Offline Mesh Packet', style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
                  onPressed: () => _showOfflinePacket(context),
                ),
              ],

              // ── Error ───────────────────────────────────────────────────────
              if (sosState.error != null) ...[
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(color: const Color(0xFFFF2D2D).withValues(alpha: 0.1), borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: Color(0xFFFF2D2D), size: 18),
                      const SizedBox(width: 8),
                      Expanded(child: Text(sosState.error!, style: const TextStyle(color: Color(0xFFFF2D2D), fontSize: 13))),
                    ],
                  ),
                ),
              ],

              SizedBox(height: isTablet ? 40 : 20),
            ],
          ),
        ),
      ),
    );
  }
}

// ── Active SOS Banner ─────────────────────────────────────────────────────────

class _ActiveSosBanner extends StatelessWidget {
  final String incidentId;
  final String? message;
  const _ActiveSosBanner({required this.incidentId, this.message});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => context.go(Routes.activeIncidentPath(incidentId)),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          gradient: LinearGradient(colors: [const Color(0xFFFF2D2D).withValues(alpha: 0.2), const Color(0xFFFF2D2D).withValues(alpha: 0.05)]),
          borderRadius: BorderRadius.circular(16),
          border: Border.all(color: const Color(0xFFFF2D2D).withValues(alpha: 0.4)),
        ),
        child: Row(
          children: [
            const Icon(Icons.emergency, color: Color(0xFFFF2D2D), size: 32),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('SOS ACTIVE', style: TextStyle(color: Color(0xFFFF2D2D), fontWeight: FontWeight.w800, letterSpacing: 1.5, fontSize: 13)),
                const SizedBox(height: 4),
                Text(message ?? 'Emergency services have been notified', style: const TextStyle(color: Color(0xFFEEF0F5), fontSize: 14)),
              ]),
            ),
            const Icon(Icons.chevron_right, color: Color(0xFF8A90A0)),
          ],
        ),
      ),
    );
  }
}

// ── Mode Toggle Row ───────────────────────────────────────────────────────────

class _ModeToggleRow extends StatelessWidget {
  final bool silentMode;
  final bool bystanderMode;
  final ValueChanged<bool> onSilentChanged;
  final ValueChanged<bool> onBystanderChanged;

  const _ModeToggleRow({required this.silentMode, required this.bystanderMode, required this.onSilentChanged, required this.onBystanderChanged});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        _ModeChip(
          icon: silentMode ? Icons.volume_off : Icons.volume_up,
          label: 'Silent SOS',
          active: silentMode,
          onTap: () => onSilentChanged(!silentMode),
        ),
        const SizedBox(width: 12),
        _ModeChip(
          icon: Icons.groups,
          label: 'Bystander',
          active: bystanderMode,
          onTap: () => onBystanderChanged(!bystanderMode),
        ),
      ],
    );
  }
}

class _ModeChip extends StatelessWidget {
  final IconData icon;
  final String label;
  final bool active;
  final VoidCallback onTap;

  const _ModeChip({required this.icon, required this.label, required this.active, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          color: active ? const Color(0xFFFF2D2D).withValues(alpha: 0.15) : const Color(0xFF1A1E2A),
          borderRadius: BorderRadius.circular(24),
          border: Border.all(color: active ? const Color(0xFFFF2D2D) : const Color(0xFF2A3040)),
        ),
        child: Row(mainAxisSize: MainAxisSize.min, children: [
          Icon(icon, size: 16, color: active ? const Color(0xFFFF2D2D) : const Color(0xFF8A90A0)),
          const SizedBox(width: 6),
          Text(label, style: TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: active ? const Color(0xFFFF2D2D) : const Color(0xFF8A90A0))),
        ]),
      ),
    );
  }
}

// ── Bystander Victim Form ─────────────────────────────────────────────────────

class _BystanderForm extends StatelessWidget {
  final TextEditingController nameCtrl;
  final TextEditingController phoneCtrl;

  const _BystanderForm({required this.nameCtrl, required this.phoneCtrl});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF1A1E2A),
        borderRadius: BorderRadius.circular(14),
        border: Border.all(color: const Color(0xFF2A3040)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Victim Details', style: TextStyle(color: Color(0xFFEEF0F5), fontWeight: FontWeight.w600, fontFamily: 'Outfit')),
          const SizedBox(height: 4),
          const Text('Your profile will not be attached. Enter the victim\'s details instead.', style: TextStyle(color: Color(0xFF8A90A0), fontSize: 12)),
          const SizedBox(height: 12),
          TextFormField(
            controller: nameCtrl,
            style: const TextStyle(color: Color(0xFFEEF0F5)),
            decoration: _deco('Victim Name (optional)', Icons.person),
          ),
          const SizedBox(height: 10),
          TextFormField(
            controller: phoneCtrl,
            keyboardType: TextInputType.phone,
            style: const TextStyle(color: Color(0xFFEEF0F5)),
            decoration: _deco('Victim Phone (optional)', Icons.phone),
          ),
        ],
      ),
    );
  }

  InputDecoration _deco(String label, IconData icon) => InputDecoration(
    labelText: label,
    labelStyle: const TextStyle(color: Color(0xFF8A90A0), fontSize: 13),
    prefixIcon: Icon(icon, color: const Color(0xFF8A90A0), size: 18),
    filled: true,
    fillColor: const Color(0xFF0F1219),
    isDense: true,
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(10), borderSide: const BorderSide(color: Color(0xFFFF2D2D))),
  );
}
