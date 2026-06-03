import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/theme/app_theme.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';
import '../../../data/remote/models/sos_models.dart';
import '../../../domain/providers/sos_provider.dart';

class GoldenHourBundleScreen extends ConsumerWidget {
  final String incidentId;
  
  const GoldenHourBundleScreen({super.key, required this.incidentId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bundleAsync = ref.watch(emergencyBundleProvider(incidentId));

    return Scaffold(
      appBar: AppBar(
        title: const Text('Emergency Status'),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: bundleAsync.when(
        data: (bundle) {
          if (bundle == null) return const Center(child: Text('No bundle data found'));
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppSpacing.md),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                _buildRiskRing(bundle.goldenHourRisk),
                const SizedBox(height: AppSpacing.xl),
                Text('Action Plan', style: AppTextStyles.heading2),
                const SizedBox(height: AppSpacing.md),
                _buildActionPlan(bundle.actionPlan),
                const SizedBox(height: AppSpacing.xl),
                Text('Nearby Medical Services', style: AppTextStyles.heading2),
                const SizedBox(height: AppSpacing.md),
                _buildServices(bundle.medicalServices, Icons.local_hospital),
                const SizedBox(height: AppSpacing.xl),
                Text('Nearby Safety Services', style: AppTextStyles.heading2),
                const SizedBox(height: AppSpacing.md),
                _buildServices(bundle.safetyServices, Icons.local_police),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (err, stack) => Center(child: Text('Error: $err')),
      ),
    );
  }

  Widget _buildRiskRing(double risk) {
    return Center(
      child: Stack(
        alignment: Alignment.center,
        children: [
          SizedBox(
            width: 150,
            height: 150,
            child: CircularProgressIndicator(
              value: risk,
              strokeWidth: 12,
              backgroundColor: ColorTokens.bgElevated,
              valueColor: AlwaysStoppedAnimation<Color>(
                risk > 0.8 ? ColorTokens.severityCritical : ColorTokens.severityHigh,
              ),
            ),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('${(risk * 100).toInt()}%', style: AppTextStyles.displayMedium),
              Text('Risk Factor', style: AppTextStyles.caption),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionPlan(List<Map<String, dynamic>> actions) {
    return Column(
      children: actions.map((actionMap) {
        final actionText = actionMap['action'] as String? ?? '';
        return Padding(
          padding: const EdgeInsets.only(bottom: AppSpacing.sm),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(Icons.check_circle, color: ColorTokens.accentPrimary, size: 20),
              const SizedBox(width: AppSpacing.sm),
              Expanded(child: Text(actionText, style: AppTextStyles.bodyMedium)),
            ],
          ),
        );
      }).toList(),
    );
  }

  Widget _buildServices(List<NearbyService> services, IconData icon) {
    if (services.isEmpty) return const Text('No services found nearby.');
    return Column(
      children: services.map((service) => Card(
        margin: const EdgeInsets.only(bottom: AppSpacing.sm),
        child: ListTile(
          leading: Icon(icon, color: ColorTokens.accentPrimary),
          title: Text(service.name, style: AppTextStyles.bodyLarge),
          subtitle: Text('${service.distanceKm.toStringAsFixed(1)} km away • ${service.explainableTrust}', style: AppTextStyles.bodySmall),
        ),
      )).toList(),
    );
  }
}
