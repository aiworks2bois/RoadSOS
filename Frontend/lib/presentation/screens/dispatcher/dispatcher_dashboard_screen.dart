import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/remote/models/volunteer_models.dart';
import '../../../domain/providers/volunteer_provider.dart';

class DispatcherDashboardScreen extends ConsumerWidget {
  const DispatcherDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
        child: CustomScrollView(
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
            incidentsAsync.when(
              data: (incidents) {
                if (incidents.isEmpty) {
                  return SliverFillRemaining(
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
                  );
                }
                return SliverPadding(
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
                );
              },
              loading: () => const SliverFillRemaining(
                child: Center(child: CircularProgressIndicator()),
              ),
              error: (e, _) => SliverFillRemaining(
                child: Center(
                  child: Text('Error: $e', style: AppTextStyles.bodySmall),
                ),
              ),
            ),
          ],
        ),
      ),
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
