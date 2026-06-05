import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../data/remote/models/auth_models.dart';
import '../../../data/remote/models/user_models.dart';
import '../../../domain/providers/auth_provider.dart';
import '../../../domain/providers/user_provider.dart';
import '../../../domain/providers/volunteer_provider.dart';

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _nameCtrl;
  late final TextEditingController _emailCtrl;
  late final TextEditingController _medicalCtrl;
  late final TextEditingController _allergiesCtrl;
  String? _bloodGroup;
  bool _isEditing = false;
  bool _isSaving = false;
  List<EmergencyContact> _contacts = [];

  static const _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  void initState() {
    super.initState();
    _nameCtrl = TextEditingController();
    _emailCtrl = TextEditingController();
    _medicalCtrl = TextEditingController();
    _allergiesCtrl = TextEditingController();
  }

  void _populateFromProfile(UserOut profile) {
    _nameCtrl.text = profile.name;
    _emailCtrl.text = profile.email ?? '';
    _medicalCtrl.text = profile.medicalConditions ?? '';
    _allergiesCtrl.text = profile.allergies ?? '';
    _bloodGroup = profile.bloodGroup;
    _contacts = List.from(profile.emergencyContacts ?? []);
  }

  Future<void> _save() async {
    if (!_formKey.currentState!.validate()) return;
    setState(() => _isSaving = true);
    final update = UserUpdate(
      name: _nameCtrl.text.trim(),
      email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
      bloodGroup: _bloodGroup,
      medicalConditions: _medicalCtrl.text.trim().isEmpty ? null : _medicalCtrl.text.trim(),
      allergies: _allergiesCtrl.text.trim().isEmpty ? null : _allergiesCtrl.text.trim(),
      emergencyContacts: _contacts,
    );
    final success = await ref.read(userProfileProvider.notifier).saveProfile(update);
    setState(() {
      _isSaving = false;
      if (success) _isEditing = false;
    });
    if (mounted && !success) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Failed to save profile'), backgroundColor: Colors.red),
      );
    }
  }

  @override
  void dispose() {
    _nameCtrl.dispose();
    _emailCtrl.dispose();
    _medicalCtrl.dispose();
    _allergiesCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final profileAsync = ref.watch(userProfileProvider);
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    final hPad = isTablet ? 48.0 : 20.0;

    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      appBar: AppBar(
        title: const Text('Profile & Settings', style: TextStyle(fontFamily: 'Outfit', fontWeight: FontWeight.w700)),
        backgroundColor: const Color(0xFF0A0C10),
        elevation: 0,
        actions: [
          if (!_isEditing)
            TextButton.icon(
              icon: const Icon(Icons.edit, size: 18),
              label: const Text('Edit'),
              style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF2D2D)),
              onPressed: () => setState(() => _isEditing = true),
            )
          else ...[
            TextButton(
              child: const Text('Cancel', style: TextStyle(color: Color(0xFF8A90A0))),
              onPressed: () => setState(() => _isEditing = false),
            ),
            TextButton(
              child: _isSaving
                  ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(strokeWidth: 2, color: Color(0xFFFF2D2D)))
                  : const Text('Save', style: TextStyle(color: Color(0xFFFF2D2D), fontWeight: FontWeight.w700)),
              onPressed: _isSaving ? null : _save,
            ),
          ],
        ],
      ),
      body: profileAsync.when(
        loading: () => const Center(child: CircularProgressIndicator(color: Color(0xFFFF2D2D))),
        error: (err, _) => Center(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Icon(Icons.cloud_off, color: Color(0xFF8A90A0), size: 48),
            const SizedBox(height: 16),
            Text('Failed to load profile\n$err', textAlign: TextAlign.center, style: const TextStyle(color: Color(0xFF8A90A0))),
            const SizedBox(height: 16),
            FilledButton(
              style: FilledButton.styleFrom(backgroundColor: const Color(0xFFFF2D2D)),
              onPressed: () => ref.read(userProfileProvider.notifier).load(),
              child: const Text('Retry'),
            ),
          ]),
        ),
        data: (profile) {
          if (profile == null) {
            // No data yet, trigger load
            WidgetsBinding.instance.addPostFrameCallback((_) {
              ref.read(userProfileProvider.notifier).load();
            });
            return const Center(child: CircularProgressIndicator(color: Color(0xFFFF2D2D)));
          }
          // Populate fields only when not editing (avoid overwriting user input)
          if (!_isEditing) _populateFromProfile(profile);

          final content = Form(
            key: _formKey,
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 24),
              children: [
                // ── Avatar & Role Badge ─────────────────────────────────────
                _AvatarSection(name: profile.name, role: profile.role),
                const SizedBox(height: 28),

                // ── Personal Info ───────────────────────────────────────────
                _section('Personal Info', [
                  _profileField(_nameCtrl, 'Full Name', Icons.person, enabled: _isEditing, required: true),
                  _profileField(_emailCtrl, 'Email', Icons.email, enabled: _isEditing, keyboardType: TextInputType.emailAddress),
                  _readOnlyField('Phone', profile.phone, Icons.phone),
                ]),
                const SizedBox(height: 20),

                // ── Medical Info ────────────────────────────────────────────
                _section('Medical Info', [
                   if (_isEditing)
                     DropdownButtonFormField<String>(
                       value: _bloodGroup,
                       dropdownColor: const Color(0xFF1A1E2A),
                       style: const TextStyle(color: Color(0xFFEEF0F5)),
                       decoration: _deco('Blood Group', Icons.bloodtype),
                       hint: const Text('Select', style: TextStyle(color: Color(0xFF8A90A0))),
                       items: _bloodGroups.map((g) => DropdownMenuItem(value: g, child: Text(g))).toList(),
                       onChanged: (v) => setState(() => _bloodGroup = v),
                     )
                   else
                     _readOnlyField('Blood Group', profile.bloodGroup ?? '—', Icons.bloodtype),
                  _profileField(_medicalCtrl, 'Medical Conditions', Icons.medical_services, enabled: _isEditing, maxLines: 2),
                  _profileField(_allergiesCtrl, 'Allergies', Icons.warning_amber, enabled: _isEditing, maxLines: 2),
                ]),
                const SizedBox(height: 20),

                // ── Emergency Contacts ──────────────────────────────────────
                _EmergencyContactsSection(
                  contacts: _isEditing ? _contacts : (profile.emergencyContacts ?? []),
                  isEditing: _isEditing,
                  onChanged: (updated) => setState(() => _contacts = updated),
                ),
                const SizedBox(height: 20),

                // ── Volunteer Mode ──────────────────────────────────────────
                _VolunteerToggle(currentRole: profile.role, profile: profile),
                const SizedBox(height: 32),

                // ── Logout ──────────────────────────────────────────────────
                OutlinedButton.icon(
                  style: OutlinedButton.styleFrom(
                    foregroundColor: Colors.redAccent,
                    side: const BorderSide(color: Colors.redAccent),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  ),
                  icon: const Icon(Icons.logout),
                  label: const Text('Logout', style: TextStyle(fontWeight: FontWeight.w600)),
                  onPressed: () async {
                    await ref.read(authNotifierProvider.notifier).logout();
                    if (!context.mounted) return;
                    context.go(Routes.login);
                  },
                ),
                const SizedBox(height: 24),
              ],
            ),
          );

          return isTablet
              ? Center(child: SizedBox(width: 640, child: content))
              : content;
        },
      ),
    );
  }

  Widget _section(String title, List<Widget> children) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontFamily: 'Outfit', fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFF2D2D), letterSpacing: 0.5)),
        const SizedBox(height: 10),
        ...children.map((w) => Padding(padding: const EdgeInsets.only(bottom: 10), child: w)),
      ],
    );
  }

  Widget _profileField(TextEditingController ctrl, String label, IconData icon, {bool enabled = false, TextInputType? keyboardType, bool required = false, int maxLines = 1}) {
    return TextFormField(
      controller: ctrl,
      enabled: enabled,
      keyboardType: keyboardType,
      maxLines: maxLines,
      style: const TextStyle(color: Color(0xFFEEF0F5)),
      decoration: _deco(label, icon),
      validator: required ? (v) => (v == null || v.trim().isEmpty) ? '$label is required' : null : null,
    );
  }

  Widget _readOnlyField(String label, String value, IconData icon) {
    return TextFormField(
      initialValue: value,
      enabled: false,
      style: const TextStyle(color: Color(0xFF8A90A0)),
      decoration: _deco(label, icon),
    );
  }

  InputDecoration _deco(String label, IconData icon) => InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: const Color(0xFF8A90A0), size: 20),
    labelStyle: const TextStyle(color: Color(0xFF8A90A0)),
    filled: true,
    fillColor: const Color(0xFF1A1E2A),
    disabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFF2A3040))),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFF2D2D), width: 1.5)),
  );
}

// ── Avatar Section ────────────────────────────────────────────────────────────

class _AvatarSection extends StatelessWidget {
  final String name;
  final String role;
  const _AvatarSection({required this.name, required this.role});

  @override
  Widget build(BuildContext context) {
    final initials = name.trim().split(' ').map((p) => p.isNotEmpty ? p[0].toUpperCase() : '').take(2).join();
    final roleColor = switch (role) {
      'volunteer' => const Color(0xFF00C853),
      'dispatcher' || 'admin' => const Color(0xFF2979FF),
      _ => const Color(0xFFFF2D2D),
    };
    return Center(
      child: Column(
        children: [
          Container(
            width: 80, height: 80,
            decoration: BoxDecoration(shape: BoxShape.circle, color: roleColor.withValues(alpha: 0.15), border: Border.all(color: roleColor, width: 2)),
            alignment: Alignment.center,
            child: Text(initials, style: TextStyle(fontSize: 28, fontWeight: FontWeight.w700, color: roleColor)),
          ),
          const SizedBox(height: 10),
          Text(name, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w700, color: Color(0xFFEEF0F5), fontFamily: 'Outfit')),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
            decoration: BoxDecoration(color: roleColor.withValues(alpha: 0.15), borderRadius: BorderRadius.circular(20)),
            child: Text(role.toUpperCase(), style: TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: roleColor, letterSpacing: 1)),
          ),
        ],
      ),
    );
  }
}

// ── Emergency Contacts Section ────────────────────────────────────────────────

class _EmergencyContactsSection extends StatelessWidget {
  final List<EmergencyContact> contacts;
  final bool isEditing;
  final void Function(List<EmergencyContact>) onChanged;

  const _EmergencyContactsSection({required this.contacts, required this.isEditing, required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(children: [
          const Text('Emergency Contacts', style: TextStyle(fontFamily: 'Outfit', fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFFFF2D2D))),
          const Spacer(),
          if (isEditing)
            TextButton.icon(
              icon: const Icon(Icons.add, size: 16),
              label: const Text('Add'),
              style: TextButton.styleFrom(foregroundColor: const Color(0xFFFF2D2D), padding: EdgeInsets.zero),
              onPressed: () {
                final updated = List<EmergencyContact>.from(contacts)
                  ..add(const EmergencyContact(name: '', phone: ''));
                onChanged(updated);
              },
            ),
        ]),
        const SizedBox(height: 8),
        if (contacts.isEmpty)
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 8),
            child: Text('No emergency contacts added', style: TextStyle(color: Color(0xFF8A90A0), fontSize: 13)),
          ),
        ...contacts.asMap().entries.map((e) => _ContactTile(
              contact: e.value,
              index: e.key,
              isEditing: isEditing,
              onUpdate: (updated) {
                final list = List<EmergencyContact>.from(contacts);
                list[e.key] = updated;
                onChanged(list);
              },
              onRemove: () {
                final list = List<EmergencyContact>.from(contacts)..removeAt(e.key);
                onChanged(list);
              },
            )),
      ],
    );
  }
}

class _ContactTile extends StatelessWidget {
  final EmergencyContact contact;
  final int index;
  final bool isEditing;
  final void Function(EmergencyContact) onUpdate;
  final VoidCallback onRemove;

  const _ContactTile({required this.contact, required this.index, required this.isEditing, required this.onUpdate, required this.onRemove});

  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1E2A),
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: const Color(0xFFFF2D2D).withValues(alpha: 0.1),
          child: Text((index + 1).toString(), style: const TextStyle(color: Color(0xFFFF2D2D), fontWeight: FontWeight.w700)),
        ),
        title: Text(contact.name.isEmpty ? 'New Contact' : contact.name, style: const TextStyle(color: Color(0xFFEEF0F5), fontWeight: FontWeight.w600)),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(contact.phone.isEmpty ? '—' : contact.phone, style: const TextStyle(color: Color(0xFF8A90A0))),
            if (contact.relation != null) Text(contact.relation!, style: const TextStyle(color: Color(0xFF8A90A0), fontSize: 12)),
          ],
        ),
        trailing: isEditing ? IconButton(icon: const Icon(Icons.close, color: Color(0xFF8A90A0), size: 18), onPressed: onRemove) : null,
      ),
    );
  }
}

// ── Volunteer Toggle ──────────────────────────────────────────────────────────

class _VolunteerToggle extends ConsumerWidget {
  final String currentRole;
  final UserOut profile;

  const _VolunteerToggle({required this.currentRole, required this.profile});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final volunteerState = ref.watch(volunteerNotifierProvider);
    final isVolunteer = currentRole == 'volunteer' || currentRole == 'admin';

    return Card(
      color: const Color(0xFF1A1E2A),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isVolunteer ? const Color(0xFF00C853).withValues(alpha: 0.15) : const Color(0xFF8A90A0).withValues(alpha: 0.15),
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.volunteer_activism, color: isVolunteer ? const Color(0xFF00C853) : const Color(0xFF8A90A0), size: 20),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Volunteer Mode', style: TextStyle(color: Color(0xFFEEF0F5), fontWeight: FontWeight.w600)),
                Text(isVolunteer ? 'You can receive dispatch alerts' : 'Enable to respond to nearby emergencies', style: const TextStyle(color: Color(0xFF8A90A0), fontSize: 12)),
              ]),
            ),
            Switch.adaptive(
              value: isVolunteer,
              activeThumbColor: const Color(0xFF00C853),
              onChanged: volunteerState.isLoading ? null : (val) async {
                if (val) {
                  // Register as volunteer
                  await ref.read(volunteerNotifierProvider.notifier).register(
                    name: profile.name,
                    phone: profile.phone,
                  );
                } else {
                  await ref.read(volunteerNotifierProvider.notifier).setAvailability(false);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
