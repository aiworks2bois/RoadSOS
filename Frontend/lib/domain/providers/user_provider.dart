import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../data/remote/models/auth_models.dart';
import '../../data/remote/models/user_models.dart';
import 'core_providers.dart';

class UserProfileNotifier extends AsyncNotifier<UserOut?> {
  @override
  Future<UserOut?> build() async {
    return null; // Starts empty; loaded after login via load()
  }

  Future<void> load() async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => ref.read(userRepositoryProvider).getMe(),
    );
  }

  Future<bool> saveProfile(UserUpdate update) async {
    try {
      final updated = await ref.read(userRepositoryProvider).updateMe(update);
      state = AsyncData(updated);
      return true;
    } catch (e) {
      return false;
    }
  }

  void clear() {
    state = const AsyncData(null);
  }
}

final userProfileProvider =
    AsyncNotifierProvider<UserProfileNotifier, UserOut?>(() {
  return UserProfileNotifier();
});
