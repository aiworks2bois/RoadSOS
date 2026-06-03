import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../data/remote/models/volunteer_models.dart';
import '../../../domain/providers/volunteer_provider.dart';

// Provides incident detail scoped to this screen
final _incidentDetailProvider =
    FutureProvider.autoDispose.family<DashboardIncident?, String>((ref, id) async {
  final incidents = await ref.watch(activeIncidentsProvider.future);
  try {
    return incidents.firstWhere((i) => i.id == id);
  } catch (_) {
    return null;
  }
});

class DispatcherIncidentScreen extends ConsumerWidget {
  final String incidentId;
  const DispatcherIncidentScreen({super.key, required this.incidentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final incidentAsync = ref.watch(_incidentDetailProvider(incidentId));

    return Scaffold(
      backgroundColor: ColorTokens.bgSurface,
      appBar: AppBar(
        backgroundColor: ColorTokens.bgSurface,
        elevation: 0,
        title: const Text('Incident Detail'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: incidentAsync.when(
        data: (incident) {
          if (incident == null) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.search_off, size: 64, color: Colors.grey),
                  const SizedBox(height: 16),
                  Text('Incident not found', style: AppTextStyles.heading3),
                  const SizedBox(height: 8),
                  Text(
                    'It may have been resolved or is no longer active.',
                    style: AppTextStyles.bodySmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton(
                    onPressed: () => context.pop(),
                    child: const Text('Go Back'),
                  ),
                ],
              ),
            );
          }
          return _IncidentDetailBody(incident: incident);
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (e, _) => Center(child: Text('Error: $e')),
      ),
    );
  }
}

class _IncidentDetailBody extends StatelessWidget {
  final DashboardIncident incident;
  const _IncidentDetailBody({required this.incident});

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
    return SingleChildScrollView(
      padding: const EdgeInsets.all(AppSpacing.md),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Severity header
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: _severityColor().withValues(alpha: 0.1),
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: _severityColor().withValues(alpha: 0.4)),
            ),
            child: Row(
              children: [
                Icon(Icons.warning_amber_rounded, color: _severityColor(), size: 36),
                const SizedBox(width: AppSpacing.md),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      incident.priority.replaceFirst('_', ' '),
                      style: AppTextStyles.heading2.copyWith(color: _severityColor()),
                    ),
                    Text(
                      incident.status.toUpperCase(),
                      style: AppTextStyles.labelSmall,
                    ),
                  ],
                ),
                if (incident.isMci) ...[
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 6),
                    decoration: BoxDecoration(
                      color: ColorTokens.severityCritical,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: const Text(
                      'MCI',
                      style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 13),
                    ),
                  ),
                ],
              ],
            ),
          ),

          const SizedBox(height: AppSpacing.lg),

          // Info rows
          _InfoRow(Icons.fingerprint, 'Incident ID', incident.id),
          _InfoRow(Icons.person, 'User ID', incident.userId),
          _InfoRow(Icons.location_on, 'Location',
              '${incident.lat.toStringAsFixed(5)}, ${incident.lng.toStringAsFixed(5)}'),
          _InfoRow(Icons.access_time, 'Created At', incident.createdAt),
          _InfoRow(Icons.notifications_active, 'Notifications Sent',
              '${incident.notificationsSent}'),
          if (incident.feedbackRating != null)
            _InfoRow(Icons.star_half, 'Feedback Rating',
                incident.feedbackRating!.toStringAsFixed(1)),

          const SizedBox(height: AppSpacing.lg),

          // Description
          Text('Description', style: AppTextStyles.heading3),
          const SizedBox(height: AppSpacing.sm),
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(AppSpacing.md),
            decoration: BoxDecoration(
              color: ColorTokens.bgElevated,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Text(
              incident.descriptionPreview ?? 'No description provided.',
              style: AppTextStyles.bodyMedium,
            ),
          ),

          const SizedBox(height: AppSpacing.xl),

          // Quick actions
          Text('Actions', style: AppTextStyles.heading3),
          const SizedBox(height: AppSpacing.sm),
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.map_outlined),
                  label: const Text('View Map'),
                  onPressed: () {
                    // Navigate to services map centred on incident
                  },
                ),
              ),
              const SizedBox(width: AppSpacing.md),
              Expanded(
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.people_alt_outlined),
                  label: const Text('Assign Volunteer'),
                  style: ElevatedButton.styleFrom(backgroundColor: ColorTokens.accentPrimary),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Manual assignment coming in v1.2')),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final IconData icon;
  final String label;
  final String value;
  const _InfoRow(this.icon, this.label, this.value);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppSpacing.sm),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Icon(icon, size: 18, color: ColorTokens.textSecondary),
          const SizedBox(width: AppSpacing.sm),
          Text('$label: ', style: AppTextStyles.labelSmall),
          Expanded(
            child: Text(value, style: AppTextStyles.bodySmall, overflow: TextOverflow.ellipsis),
          ),
        ],
      ),
    );
  }
}
