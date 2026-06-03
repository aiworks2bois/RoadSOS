import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/models/auth_models.dart';
import 'core_providers.dart';

class AuthState {
  final bool isLoading;
  final String? error;
  final TokenResponse? userSession;
  final bool isAuthenticated;

  const AuthState({
    this.isLoading = false,
    this.error,
    this.userSession,
    this.isAuthenticated = false,
  });

  AuthState copyWith({
    bool? isLoading,
    String? error,
    TokenResponse? userSession,
    bool? isAuthenticated,
    bool clearError = false,
  }) {
    return AuthState(
      isLoading: isLoading ?? this.isLoading,
      error: clearError ? null : (error ?? this.error),
      userSession: userSession ?? this.userSession,
      isAuthenticated: isAuthenticated ?? this.isAuthenticated,
    );
  }
}

class AuthNotifier extends Notifier<AuthState> {
  @override
  AuthState build() {
    _checkInitialAuth();
    return const AuthState();
  }

  Future<void> _checkInitialAuth() async {
    final repo = ref.read(authRepositoryProvider);
    final isAuth = await repo.isAuthenticated();
    // In a real app we'd load the full user profile if cached. 
    // MVP: Just track the bool token presence.
    state = state.copyWith(isAuthenticated: isAuth);
  }

  Future<bool> login(String phone, String password) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final repo = ref.read(authRepositoryProvider);
      final response = await repo.login(phone, password);
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        userSession: response,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<bool> register(UserCreate user) async {
    state = state.copyWith(isLoading: true, clearError: true);
    try {
      final repo = ref.read(authRepositoryProvider);
      final response = await repo.register(user);
      state = state.copyWith(
        isLoading: false,
        isAuthenticated: true,
        userSession: response,
      );
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }

  Future<void> logout() async {
    final repo = ref.read(authRepositoryProvider);
    await repo.logout();
    state = const AuthState();
  }
}

final authNotifierProvider = NotifierProvider<AuthNotifier, AuthState>(() {
  return AuthNotifier();
});
