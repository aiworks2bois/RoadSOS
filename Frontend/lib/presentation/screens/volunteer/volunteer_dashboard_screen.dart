import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/remote/models/volunteer_models.dart';
import '../../../domain/providers/volunteer_provider.dart';

class VolunteerDashboardScreen extends ConsumerWidget {
  const VolunteerDashboardScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incidentsAsync = ref.watch(activeIncidentsProvider);
    final volunteerState = ref.watch(volunteerNotifierProvider);
    final isAvailable = volunteerState.lastToggleResult ?? true;

    return Scaffold(
      backgroundColor: ColorTokens.bgSurface,
      appBar: AppBar(
        backgroundColor: ColorTokens.bgSurface,
        elevation: 0,
        title: const Text('Volunteer Dashboard'),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppSpacing.md),
            child: Row(
              children: [
                Text(
                  isAvailable ? 'Available' : 'Off Duty',
                  style: AppTextStyles.labelMedium.copyWith(
                    color: isAvailable ? ColorTokens.severityLow : ColorTokens.textSecondary,
                  ),
                ),
                const SizedBox(width: 8),
                Switch(
                  value: isAvailable,
                  thumbColor: WidgetStatePropertyAll(
                    isAvailable ? ColorTokens.severityLow : Colors.grey,
                  ),
                  onChanged: volunteerState.isLoading
                      ? null
                      : (v) => ref.read(volunteerNotifierProvider.notifier).toggleAvailability(v),
                ),
              ],
            ),
          ),
        ],
      ),
      body: RefreshIndicator(
        onRefresh: () async => ref.refresh(activeIncidentsProvider),
        child: incidentsAsync.when(
          data: (incidents) {
            if (incidents.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.check_circle_outline, size: 72, color: ColorTokens.severityLow),
                    const SizedBox(height: AppSpacing.md),
                    Text('No active incidents nearby', style: AppTextStyles.heading3),
                    const SizedBox(height: AppSpacing.sm),
                    Text('You\'re all caught up!', style: AppTextStyles.bodyMedium),
                  ],
                ),
              );
            }
            return ListView.separated(
              padding: const EdgeInsets.all(AppSpacing.md),
              itemCount: incidents.length,
              separatorBuilder: (_, __) => const SizedBox(height: AppSpacing.sm),
              itemBuilder: (context, index) {
                final incident = incidents[index];
                return _IncidentCard(incident: incident);
              },
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, _) => Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(Icons.wifi_off, size: 56, color: Colors.grey),
                const SizedBox(height: AppSpacing.md),
                Text('Could not load incidents', style: AppTextStyles.heading3),
                const SizedBox(height: AppSpacing.sm),
                Text(err.toString(), style: AppTextStyles.bodySmall, textAlign: TextAlign.center),
                const SizedBox(height: AppSpacing.md),
                ElevatedButton(
                  onPressed: () => ref.refresh(activeIncidentsProvider),
                  child: const Text('Retry'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _IncidentCard extends StatelessWidget {
  final DashboardIncident incident;
  const _IncidentCard({required this.incident});

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

  String _ageLabel() {
    final secs = incident.ageSeconds;
    if (secs < 60) return '${secs}s ago';
    if (secs < 3600) return '${secs ~/ 60}m ago';
    return '${secs ~/ 3600}h ago';
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
        side: BorderSide(color: _severityColor().withValues(alpha: 0.6), width: 1.5),
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => context.push(Routes.volunteerRespondPath(incident.id)),
        child: Padding(
          padding: const EdgeInsets.all(AppSpacing.md),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                    decoration: BoxDecoration(
                      color: _severityColor().withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      incident.priority.replaceFirst('_', ' '),
                      style: AppTextStyles.labelSmall.copyWith(color: _severityColor()),
                    ),
                  ),
                  if (incident.isMci) ...[
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: ColorTokens.severityCritical.withValues(alpha: 0.15),
                        borderRadius: BorderRadius.circular(6),
                      ),
                      child: const Text('MCI', style: TextStyle(fontSize: 11, color: ColorTokens.severityCritical, fontWeight: FontWeight.bold)),
                    ),
                  ],
                  const Spacer(),
                  Text(_ageLabel(), style: AppTextStyles.caption),
                ],
              ),
              const SizedBox(height: AppSpacing.sm),
              Text(
                incident.descriptionPreview ?? 'No description',
                style: AppTextStyles.bodyMedium,
                maxLines: 2,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: AppSpacing.sm),
              Row(
                children: [
                  Icon(Icons.location_on, size: 14, color: ColorTokens.textSecondary),
                  const SizedBox(width: 4),
                  Text(
                    '${incident.lat.toStringAsFixed(4)}, ${incident.lng.toStringAsFixed(4)}',
                    style: AppTextStyles.caption,
                  ),
                  const Spacer(),
                  const Icon(Icons.arrow_forward_ios, size: 14, color: ColorTokens.textSecondary),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
