import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/remote/models/volunteer_models.dart';
import '../../../domain/providers/volunteer_provider.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';

class DispatcherDashboardScreen extends ConsumerStatefulWidget {
  const DispatcherDashboardScreen({super.key});

  @override
  ConsumerState<DispatcherDashboardScreen> createState() => _DispatcherDashboardScreenState();
}

class _DispatcherDashboardScreenState extends ConsumerState<DispatcherDashboardScreen> {
  bool _isMapView = false;
  @override
  Widget build(BuildContext context) {
    final metricsAsync = ref.watch(dashboardMetricsProvider);
    final incidentsAsync = ref.watch(activeIncidentsProvider);

    return Scaffold(
      backgroundColor: ColorTokens.bgSurface,
      appBar: AppBar(
        backgroundColor: ColorTokens.bgSurface,
        elevation: 0,
        title: const Text('Dispatcher Dashboard'),
        actions: [
          IconButton(
            icon: Icon(_isMapView ? Icons.list : Icons.map),
            tooltip: _isMapView ? 'List View' : 'Map View',
            onPressed: () {
              setState(() {
                _isMapView = !_isMapView;
              });
            },
          ),
          IconButton(
            icon: const Icon(Icons.refresh),
            tooltip: 'Refresh',
            onPressed: () {
              ref.invalidate(dashboardMetricsProvider);
              ref.invalidate(activeIncidentsProvider);
            },
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async {
          ref.invalidate(dashboardMetricsProvider);
          ref.invalidate(activeIncidentsProvider);
        },
        child: incidentsAsync.when(
          data: (incidents) {
            if (_isMapView) {
              return _DispatcherMapView(incidents: incidents);
            }
            return _buildListView(metricsAsync, incidents);
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (e, _) => Center(child: Text('Error: $e', style: AppTextStyles.bodySmall)),
        ),
      ),
    );
  }

  Widget _buildListView(AsyncValue<DashboardMetrics> metricsAsync, List<DashboardIncident> incidents) {
    return CustomScrollView(
      slivers: [
        // Metrics strip
        SliverToBoxAdapter(
          child: metricsAsync.when(
            data: (m) => _MetricsStrip(metrics: m),
            loading: () => const SizedBox(
              height: 90,
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (e, _) => Padding(
              padding: const EdgeInsets.all(AppSpacing.md),
              child: Text('Metrics unavailable: $e', style: AppTextStyles.bodySmall),
            ),
          ),
        ),

        // Section title
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(AppSpacing.md, AppSpacing.md, AppSpacing.md, 4),
            child: Text('Active Incidents', style: AppTextStyles.heading2),
          ),
        ),

        // Incident list
        if (incidents.isEmpty)
          SliverFillRemaining(
            child: Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.task_alt, size: 72, color: ColorTokens.severityLow),
                  const SizedBox(height: AppSpacing.md),
                  Text('All clear — no active incidents', style: AppTextStyles.heading3),
                ],
              ),
            ),
          )
        else
          SliverPadding(
            padding: const EdgeInsets.all(AppSpacing.md),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (ctx, i) => Padding(
                  padding: const EdgeInsets.only(bottom: AppSpacing.sm),
                  child: _DispatcherIncidentCard(incident: incidents[i]),
                ),
                childCount: incidents.length,
              ),
            ),
          ),
      ],
    );
  }
}

// ── Dispatcher Map View ───────────────────────────────────────────────────────

class _DispatcherMapView extends StatelessWidget {
  final List<DashboardIncident> incidents;
  const _DispatcherMapView({required this.incidents});

  Color _severityColor(String priority) {
    switch (priority) {
      case 'P1_CRITICAL':
        return ColorTokens.severityCritical;
      case 'P2_HIGH':
        return ColorTokens.severityHigh;
      case 'P3_MEDIUM':
        return ColorTokens.severityMedium;
      default:
        return ColorTokens.severityLow;
    }
  }

  @override
  Widget build(BuildContext context) {
    if (incidents.isEmpty) {
      return const Center(
        child: Text('No active incidents to map', style: TextStyle(color: ColorTokens.textSecondary)),
      );
    }

    // Calculate bounds to show all incidents
    final latLngs = incidents
        .map((i) => LatLng(i.lat, i.lng))
        .toList();

    LatLng initialCenter = const LatLng(0, 0);
    if (latLngs.isNotEmpty) {
      initialCenter = LatLng(
        latLngs.map((l) => l.latitude).reduce((a, b) => a + b) / latLngs.length,
        latLngs.map((l) => l.longitude).reduce((a, b) => a + b) / latLngs.length,
      );
    }

    return FlutterMap(
      options: MapOptions(
        initialCenter: initialCenter,
        initialZoom: 12.0,
      ),
      children: [
        TileLayer(
          urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
          userAgentPackageName: 'com.roadsos.app',
        ),
        MarkerLayer(
          markers: incidents.map((incident) {
            final color = _severityColor(incident.priority);
            return Marker(
              point: LatLng(incident.lat, incident.lng),
              width: 50,
              height: 50,
              child: GestureDetector(
                onTap: () => context.push(Routes.dispatcherIncidentPath(incident.id)),
                child: Container(
                  decoration: BoxDecoration(
                    color: color.withValues(alpha: 0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2),
                  ),
                  child: Center(
                    child: Icon(
                      incident.isMci ? Icons.warning_amber_rounded : Icons.emergency,
                      color: color,
                      size: incident.isMci ? 28 : 22,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }
}

// ── Metrics Strip ─────────────────────────────────────────────────────────────

class _MetricsStrip extends StatelessWidget {
  final DashboardMetrics metrics;
  const _MetricsStrip({required this.metrics});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: ColorTokens.bgElevated,
      padding: const EdgeInsets.symmetric(vertical: AppSpacing.md, horizontal: AppSpacing.sm),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          _MetricTile(label: 'Active', value: '${metrics.activeIncidents}', color: ColorTokens.severityHigh),
          _MetricTile(label: 'Escalated', value: '${metrics.escalatedIncidents}', color: ColorTokens.severityCritical),
          _MetricTile(label: 'Resolved', value: '${metrics.resolvedIncidents}', color: ColorTokens.severityLow),
          _MetricTile(
            label: 'Avg Res.',
            value: metrics.avgResolutionSeconds != null
                ? '${(metrics.avgResolutionSeconds! / 60).toStringAsFixed(1)}m'
                : '—',
            color: ColorTokens.accentPrimary,
          ),
        ],
      ),
    );
  }
}

class _MetricTile extends StatelessWidget {
  final String label;
  final String value;
  final Color color;
  const _MetricTile({required this.label, required this.value, required this.color});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(value, style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: color)),
        const SizedBox(height: 2),
        Text(label, style: AppTextStyles.caption),
      ],
    );
  }
}

// ── Dispatcher Incident Card ──────────────────────────────────────────────────

class _DispatcherIncidentCard extends StatelessWidget {
  final DashboardIncident incident;
  const _DispatcherIncidentCard({required this.incident});

  Color _severityColor() {
    switch (incident.priority) {
      case 'P1_CRITICAL':
        return ColorTokens.severityCritical;
      case 'P2_HIGH':
        return ColorTokens.severityHigh;
      case 'P3_MEDIUM':
        return ColorTokens.severityMedium;
      default:
        return ColorTokens.severityLow;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: _severityColor().withValues(alpha: 0.5), width: 1.2),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push(Routes.dispatcherIncidentPath(incident.id)),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Row(
            children: [
              // Severity indicator
              Container(
                width: 6,
                height: 56,
                decoration: BoxDecoration(
                  color: _severityColor(),
                  borderRadius: BorderRadius.circular(3),
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Text(
                          incident.priority.replaceFirst('_', ' '),
                          style: AppTextStyles.labelSmall.copyWith(color: _severityColor()),
                        ),
                        if (incident.isMci) ...[
                          const SizedBox(width: 8),
                          const Text('MCI', style: TextStyle(fontSize: 10, color: ColorTokens.severityCritical, fontWeight: FontWeight.bold)),
                        ],
                        const Spacer(),
                        _StatusChip(status: incident.status),
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      incident.descriptionPreview ?? 'No description',
                      style: AppTextStyles.bodySmall,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${incident.notificationsSent} notifications sent',
                      style: AppTextStyles.caption,
                    ),
                  ],
                ),
              ),
              const Icon(Icons.chevron_right, color: ColorTokens.textSecondary),
            ],
          ),
        ),
      ),
    );
  }
}

class _StatusChip extends StatelessWidget {
  final String status;
  const _StatusChip({required this.status});

  Color _color() {
    switch (status) {
      case 'active':
        return ColorTokens.severityHigh;
      case 'acknowledged':
        return ColorTokens.accentPrimary;
      case 'escalated':
        return ColorTokens.severityCritical;
      default:
        return Colors.grey;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
      decoration: BoxDecoration(
        color: _color().withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(
        status.toUpperCase(),
        style: TextStyle(fontSize: 10, color: _color(), fontWeight: FontWeight.bold),
      ),
    );
  }
}
