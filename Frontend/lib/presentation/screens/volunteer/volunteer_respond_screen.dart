import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/theme/text_styles.dart';
import '../../../core/theme/app_theme.dart';
import '../../../domain/providers/volunteer_provider.dart';

class VolunteerRespondScreen extends ConsumerStatefulWidget {
  final String incidentId;
  const VolunteerRespondScreen({super.key, required this.incidentId});

  @override
  ConsumerState<VolunteerRespondScreen> createState() => _VolunteerRespondScreenState();
}

class _VolunteerRespondScreenState extends ConsumerState<VolunteerRespondScreen> {
  final _noteController = TextEditingController();
  bool _responded = false;

  @override
  void dispose() {
    _noteController.dispose();
    super.dispose();
  }

  Future<void> _respond(String action) async {
    final result = await ref.read(volunteerNotifierProvider.notifier).respond(
          widget.incidentId,
          action: action,
          note: _noteController.text.trim().isNotEmpty ? _noteController.text.trim() : null,
        );
    if (result != null && mounted) {
      setState(() => _responded = true);
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(action == 'accept' ? '✅ You are responding!' : 'Response declined.'),
          backgroundColor: action == 'accept' ? ColorTokens.severityLow : Colors.grey,
        ),
      );
      if (action == 'accept') {
        // Stay on screen so volunteer has context. Could navigate to live map.
      } else {
        context.pop();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final volunteerState = ref.watch(volunteerNotifierProvider);

    return Scaffold(
      backgroundColor: ColorTokens.bgSurface,
      appBar: AppBar(
        backgroundColor: ColorTokens.bgSurface,
        elevation: 0,
        title: const Text('Respond to Incident'),
        leading: BackButton(onPressed: () => context.pop()),
      ),
      body: Padding(
        padding: const EdgeInsets.all(AppSpacing.lg),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Incident context
            _InfoRow(Icons.badge, 'Incident ID', widget.incidentId),
            const SizedBox(height: AppSpacing.md),

            // Note input
            Text('Add a note (optional)', style: AppTextStyles.labelMedium),
            const SizedBox(height: AppSpacing.sm),
            TextField(
              controller: _noteController,
              maxLines: 3,
              decoration: const InputDecoration(
                hintText: 'e.g. Approaching from north, ETA 5 min',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),

            if (_responded)
              _ConfirmedBanner()
            else if (volunteerState.error != null)
              _ErrorBanner(message: volunteerState.error!)
            else ...[
              // Accept
              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  icon: const Icon(Icons.check_circle, color: Colors.white),
                  label: volunteerState.isLoading
                      ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white))
                      : const Text('Accept & Respond', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 16)),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: ColorTokens.severityLow,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  onPressed: volunteerState.isLoading ? null : () => _respond('accept'),
                ),
              ),
              const SizedBox(height: AppSpacing.md),

              // Decline
              SizedBox(
                width: double.infinity,
                child: OutlinedButton.icon(
                  icon: const Icon(Icons.cancel_outlined),
                  label: const Text('Decline', style: TextStyle(fontSize: 16)),
                  style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                    side: const BorderSide(color: Colors.grey),
                  ),
                  onPressed: volunteerState.isLoading ? null : () => _respond('decline'),
                ),
              ),
            ],
          ],
        ),
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
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(icon, size: 20, color: ColorTokens.textSecondary),
        const SizedBox(width: 8),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(label, style: AppTextStyles.caption),
              Text(value, style: AppTextStyles.bodyMedium),
            ],
          ),
        ),
      ],
    );
  }
}

class _ConfirmedBanner extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.lg),
      decoration: BoxDecoration(
        color: ColorTokens.severityLow.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorTokens.severityLow),
      ),
      child: Row(
        children: [
          const Icon(Icons.check_circle, color: ColorTokens.severityLow, size: 36),
          const SizedBox(width: AppSpacing.md),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Response Sent!', style: AppTextStyles.heading3),
                Text('Head to the incident location and await further instructions.', style: AppTextStyles.bodySmall),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _ErrorBanner extends StatelessWidget {
  final String message;
  const _ErrorBanner({required this.message});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppSpacing.md),
      decoration: BoxDecoration(
        color: ColorTokens.severityCritical.withValues(alpha: 0.1),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: ColorTokens.severityCritical),
      ),
      child: Row(
        children: [
          const Icon(Icons.error_outline, color: ColorTokens.severityCritical),
          const SizedBox(width: 8),
          Expanded(child: Text(message, style: AppTextStyles.bodySmall)),
        ],
      ),
    );
  }
}
