import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../core/router/app_router.dart';
import '../../../domain/providers/auth_provider.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({super.key});

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _phoneController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authState = ref.watch(authNotifierProvider);
    final isTablet = MediaQuery.sizeOf(context).width > 600;

    ref.listen<AuthState>(authNotifierProvider, (previous, next) {
      if (next.error != null && previous?.error != next.error) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(next.error!), backgroundColor: const Color(0xFFFF2D2D)),
        );
      }
      if (next.isAuthenticated) {
        context.go(Routes.sosTrigger);
      }
    });

    return Scaffold(
      backgroundColor: const Color(0xFF0A0C10),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(horizontal: isTablet ? 80 : 24, vertical: 32),
            child: ConstrainedBox(
              constraints: const BoxConstraints(maxWidth: 460),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ── Logo ─────────────────────────────────────────────────
                  Container(
                    width: 80, height: 80,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: const Color(0xFF1E2330),
                      boxShadow: [BoxShadow(color: const Color(0xFFFF2D2D).withValues(alpha: 0.35), blurRadius: 28, spreadRadius: 6)],
                    ),
                    alignment: Alignment.center,
                    child: const Icon(Icons.emergency, color: Color(0xFFFF2D2D), size: 44),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'RoadSoS',
                    style: TextStyle(fontFamily: 'Outfit', fontSize: 36, fontWeight: FontWeight.w800, color: Color(0xFFEEF0F5), letterSpacing: 1.5),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 4),
                  const Text(
                    'Emergency Response, Fast.',
                    style: TextStyle(color: Color(0xFF8A90A0), fontSize: 13),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 48),

                  // ── Phone ─────────────────────────────────────────────────
                  TextFormField(
                    controller: _phoneController,
                    keyboardType: TextInputType.phone,
                    inputFormatters: [FilteringTextInputFormatter.allow(RegExp(r'[+0-9 ]'))],
                    style: const TextStyle(color: Color(0xFFEEF0F5)),
                    decoration: _deco('Phone Number', Icons.phone),
                  ),
                  const SizedBox(height: 14),

                  // ── Password ──────────────────────────────────────────────
                  TextFormField(
                    controller: _passwordController,
                    obscureText: _obscurePassword,
                    style: const TextStyle(color: Color(0xFFEEF0F5)),
                    decoration: _deco('Password', Icons.lock).copyWith(
                      suffixIcon: IconButton(
                        icon: Icon(_obscurePassword ? Icons.visibility_off : Icons.visibility, color: const Color(0xFF8A90A0)),
                        onPressed: () => setState(() => _obscurePassword = !_obscurePassword),
                      ),
                    ),
                    onFieldSubmitted: (_) => _login(),
                  ),
                  const SizedBox(height: 28),

                  // ── Login Button ──────────────────────────────────────────
                  FilledButton(
                    style: FilledButton.styleFrom(
                      backgroundColor: const Color(0xFFFF2D2D),
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(14)),
                    ),
                    onPressed: authState.isLoading ? null : _login,
                    child: authState.isLoading
                        ? const SizedBox(width: 22, height: 22, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2.5))
                        : const Text('Login', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700)),
                  ),
                  const SizedBox(height: 16),

                  // ── Register Link ─────────────────────────────────────────
                  TextButton(
                    onPressed: () => context.go(Routes.register),
                    child: const Text.rich(
                      TextSpan(
                        text: "Don't have an account? ",
                        style: TextStyle(color: Color(0xFF8A90A0)),
                        children: [
                          TextSpan(text: 'Create one', style: TextStyle(color: Color(0xFFFF2D2D), fontWeight: FontWeight.w700)),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _login() {
    ref.read(authNotifierProvider.notifier).login(
      _phoneController.text.replaceAll(' ', ''),
      _passwordController.text,
    );
  }

  InputDecoration _deco(String label, IconData icon) => InputDecoration(
    labelText: label,
    prefixIcon: Icon(icon, color: const Color(0xFF8A90A0), size: 20),
    labelStyle: const TextStyle(color: Color(0xFF8A90A0)),
    filled: true,
    fillColor: const Color(0xFF1A1E2A),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: BorderSide.none),
    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(12), borderSide: const BorderSide(color: Color(0xFFFF2D2D), width: 1.5)),
  );
}
