import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/theme/color_tokens.dart';
import '../../../core/router/app_router.dart';
import '../../../data/remote/models/auth_models.dart';
import '../../../domain/providers/auth_provider.dart';

class RegisterScreen extends ConsumerStatefulWidget {
  const RegisterScreen({super.key});

  @override
  ConsumerState<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends ConsumerState<RegisterScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _passwordCtrl = TextEditingController();
  final _confirmPasswordCtrl = TextEditingController();
  final _medicalCtrl = TextEditingController();
  final _allergiesCtrl = TextEditingController();

  String? _bloodGroup;
  bool _obscurePassword = true;
  bool _obscureConfirm = true;
  final List<_ContactEntry> _contacts = [];

  static const _bloodGroups = ['A+', 'A-', 'B+', 'B-', 'O+', 'O-', 'AB+', 'AB-'];

  @override
  void dispose() {
    _nameCtrl.dispose();
    _phoneCtrl.dispose();
    _emailCtrl.dispose();
    _passwordCtrl.dispose();
    _confirmPasswordCtrl.dispose();
    _medicalCtrl.dispose();
    _allergiesCtrl.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    if (!_formKey.currentState!.validate()) return;
    final user = UserCreate(
      name: _nameCtrl.text.trim(),
      phone: _phoneCtrl.text.replaceAll(' ', ''),
      email: _emailCtrl.text.trim().isEmpty ? null : _emailCtrl.text.trim(),
      password: _passwordCtrl.text,
      bloodGroup: _bloodGroup,
      medicalConditions: _medicalCtrl.text.trim().isEmpty ? null : _medicalCtrl.text.trim(),
      allergies: _allergiesCtrl.text.trim().isEmpty ? null : _allergiesCtrl.text.trim(),
      emergencyContacts: _contacts
          .map((c) => EmergencyContact(
                name: c.nameCtrl.text.trim(),
                phone: c.phoneCtrl.text.replaceAll(' ', ''),
                relation: c.relationCtrl.text.trim().isEmpty ? null : c.relationCtrl.text.trim(),
                notifyOnSos: c.notifyOnSos,
              ))
          .where((c) => c.name.isNotEmpty && c.phone.isNotEmpty)
          .toList(),
    );

    final success = await ref.read(authNotifierProvider.notifier).register(user);
    if (success && mounted) context.go(Routes.sosTrigger);
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isTablet = MediaQuery.sizeOf(context).width > 600;
    final hPad = isTablet ? 48.0 : 24.0;

    ref.listen<AuthState>(authNotifierProvider, (prev, next) {
      if (next.error != null && prev?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: ColorTokens.severityCritical),
        );
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: hPad, vertical: 32),
          child: isTablet
              ? Center(child: SizedBox(width: 560, child: _buildForm(authState)))
              : _buildForm(authState),
        ),
      ),
    );
  }

  Widget _buildForm(AuthState authState) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // Header
          const Icon(Icons.emergency, color: Color(0xFFFF2D2D), size: 48),
          const SizedBox(height: 12),
          const Text(
            'Create Account',
            style: TextStyle(
              fontFamily: 'Outfit',
              fontSize: 28,
              fontWeight: FontWeight.w700,
              color: Color(0xFFEEF0F5),
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 4),
          const Text(
            'Your medical profile keeps you safe in emergencies',
            style: TextStyle(fontSize: 13, color: Color(0xFF8A90A0)),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),

          // ── Basic Info ─────────────────────────────────────────────────────
          _sectionHeader('Basic Info'),
          const SizedBox(height: 12),
          _field(controller: _nameCtrl, label: 'Full Name', icon: Icons.person, validator: (v) => (v == null || v.trim().isEmpty) ? 'Name is required' : null),
          const SizedBox(height: 12),
          _field(
            controller: _phoneCtrl,
            label: 'Phone Number (with country code)',
            icon: Icons.phone,
            keyboardType: TextInputType.phone,
            inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[+0-9 ]'))],
            validator: (v) {
              if (v == null || v.replaceAll(' ', '').length < 10) return 'Enter a valid phone number';
              return null;
            },
          ),
          const SizedBox(height: 12),
          _field(controller: _emailCtrl, label: 'Email (optional)', icon: Icons.email, keyboardType: TextInputType.emailAddress),
          const SizedBox(height: 12),
          _field(
            controller: _passwordCtrl,
            label: 'Password',
            icon: Icons.lock,
            obscureText: _obscurePassword,
            suffix: IconButton(
              icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF8A90A0)),
              onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
            ),
            validator: (v) => (v == null || v.length < 8) ? 'Password must be at least 8 characters' : null,
          ),
          const SizedBox(height: 12),
          _field(
            controller: _confirmPasswordCtrl,
            label: 'Confirm Password',
            icon: Icons.lock_outline,
            obscureText: _obscureConfirm,
            suffix: IconButton(
              icon: Icon(_obscureConfirm ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF8A90A0)),
              onPressed: () => setState(() => _obscureConfirm = !_obscureConfirm),
            ),
            validator: (v) => v != _passwordCtrl.text ? 'Passwords do not match' : null,
          ),

          const SizedBox(height: 28),

          // ── Medical Info ────────────────────────────────────────────────────
          _sectionHeader('Medical Info (optional, encrypted)'),
          const SizedBox(height: 4),
          const Text(
            'Shared with responders only during an active SOS',
            style: TextStyle(fontSize: 12, color: Color(0xFF8A90A0)),
          ),
          const SizedBox(height: 12),
          // Blood group dropdown
          DropdownButtonFormField<String>(
            value: _bloodGroup,
            dropdownColor: const Color(0xFF1A1E2A),
            style: const TextStyle(color: Color(0xFFEEF0F5)),
            decoration: _inputDecoration('Blood Group', Icons.bloodtype),
            hint: const Text('Select blood group', style: TextStyle(color: Color(0xFF8A90A0))),
            items: _bloodGroups
                .map((g) => DropdownMenuItem(value: g, child: Text(g)))
                .toList(),
            onChanged: (v) => setState(() => _bloodGroup = v),
          ),
          const SizedBox(height: 12),
          _field(controller: _medicalCtrl, label: 'Medical Conditions', icon: Icons.medical_services, maxLines: 2),
          const SizedBox(height: 12),
          _field(controller: _allergiesCtrl, label: 'Allergies', icon: Icons.warning_amber, maxLines: 2),

          const SizedBox(height: 28),

          // ── Emergency Contacts ──────────────────────────────────────────────
          _sectionHeader('Emergency Contacts'),
          const SizedBox(height: 12),
          ..._contacts.asMap().entries.map((e) => _ContactCard(
                entry: e.value,
                index: e.key,
                onRemove: () => setState(() => _contacts.removeAt(e.key)),
              )),
          OutlinedButton.icon(
            style: OutlinedButton.styleFrom(
              foregroundColor: const Color(0xFFFF2D2D),
              side: const BorderSide(color: Color(0xFFFF2D2D)),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            ),
            icon: const Icon(Icons.add),
            label: const Text('Add Emergency Contact'),
            onPressed: () => setState(() => _contacts.add(_ContactEntry())),
          ),

          const SizedBox(height: 36),

          // ── Submit ──────────────────────────────────────────────────────────
          FilledButton(
            style: FilledButton.styleFrom(
              backgroundColor: const Color(0xFFFF2D2D),
              padding: const EdgeInsets.symmetric(vertical: 16),
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
            ),
            onPressed: authState.isLoading ? null : _submit,
            child: authState.isLoading
                ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                : const Text('Create Account', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
          ),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () => context.go(Routes.login),
            child: const Text('Already have an account? Log In', style: TextStyle(color: Color(0xFF8A90A0))),
          ),
        ],
      ),
    );
  }

  Widget _sectionHeader(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontFamily: 'Outfit',
        fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Color(0xFFFF2D2D),
        letterSpacing: 0.5,
      ),
    );
  }

  InputDecoration _inputDecoration(String label, IconData icon) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon, color: const Color(0xFF8A90A0), size: 20),
      labelStyle: const TextStyle(color: Color(0xFF8A90A0)),
      filled: true,
      fillColor: const Color(0xFF1A1E2A),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide.none,
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF2D2D), width: 1.5),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(color: Color(0xFFFF2D2D)),
      ),
    );
  }

  Widget _field({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType? keyboardType,
    List<TextInputFormatter>? inputFormatters,
    bool obscureText = false,
    Widget? suffix,
    String? Function(String?)? validator,
    int maxLines = 1,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      inputFormatters: inputFormatters,
      obscureText: obscureText,
      maxLines: maxLines,
      style: const TextStyle(color: Color(0xFFEEF0F5)),
      decoration: _inputDecoration(label, icon).copyWith(suffixIcon: suffix),
      validator: validator,
    );
  }
}

// ── Emergency contact data holder ────────────────────────────────────────────

class _ContactEntry {
  final nameCtrl = TextEditingController();
  final phoneCtrl = TextEditingController();
  final relationCtrl = TextEditingController();
  bool notifyOnSos = true;
}

class _ContactCard extends StatefulWidget {
  final _ContactEntry entry;
  final int index;
  final VoidCallback onRemove;

  const _ContactCard({required this.entry, required this.index, required this.onRemove});

  @override
  State<_ContactCard> createState() => _ContactCardState();
}

class _ContactCardState extends State<_ContactCard> {
  @override
  Widget build(BuildContext context) {
    return Card(
      color: const Color(0xFF1A1E2A),
      margin: const EdgeInsets.only(bottom: 12),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Contact ${widget.index + 1}',
                  style: const TextStyle(color: Color(0xFFEEF0F5), fontWeight: FontWeight.w600),
                ),
                const Spacer(),
                IconButton(
                  icon: const Icon(Icons.close, color: Color(0xFF8A90A0), size: 18),
                  onPressed: widget.onRemove,
                ),
              ],
            ),
            const SizedBox(height: 8),
            _miniField(widget.entry.nameCtrl, 'Name', Icons.person),
            const SizedBox(height: 8),
            _miniField(widget.entry.phoneCtrl, 'Phone', Icons.phone, type: TextInputType.phone),
            const SizedBox(height: 8),
            _miniField(widget.entry.relationCtrl, 'Relation (e.g. Spouse)', Icons.family_restroom),
            const SizedBox(height: 8),
            Row(
              children: [
                const Text('Notify on SOS', style: TextStyle(color: Color(0xFF8A90A0), fontSize: 13)),
                const Spacer(),
                Switch.adaptive(
                  value: widget.entry.notifyOnSos,
                  activeThumbColor: const Color(0xFFFF2D2D),
                  onChanged: (v) => setState(() => widget.entry.notifyOnSos = v),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _miniField(TextEditingController ctrl, String label, IconData icon, {TextInputType? type}) {
    return TextFormField(
      controller: ctrl,
      keyboardType: type,
      style: const TextStyle(color: Color(0xFFEEF0F5), fontSize: 14),
      decoration: InputDecoration(
        labelText: label,
        labelStyle: const TextStyle(color: Color(0xFF8A90A0), fontSize: 13),
        prefixIcon: Icon(icon, color: const Color(0xFF8A90A0), size: 18),
        filled: true,
        fillColor: const Color(0xFF0F1219),
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
        isDense: true,
      ),
    );
  }
}
