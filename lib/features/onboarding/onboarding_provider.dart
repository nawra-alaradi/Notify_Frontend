import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:notify/core/constants/app_enums.dart';
import 'package:notify/core/errors/exceptions.dart';
import 'package:notify/core/providers/shared_providers.dart';
import 'package:notify/features/onboarding/onboarding_service.dart';

final onboardingProvider =
    AsyncNotifierProvider<OnboardingNotifier, OnboardingStatus>(
      () => OnboardingNotifier(),
    );

class OnboardingNotifier extends AsyncNotifier<OnboardingStatus> {
  @override
  Future<OnboardingStatus> build() async {
    final prefs = await ref.watch(sharedPreferencesProvider.future);
    final dataSource = OnboardingLocalDataSource(sharedPreferences: prefs);
    try {
      final result = await dataSource.getOnboardingStatus();
      // only runs in debug mode and doesn't pollute release builds
      assert(() {
        debugPrint("onboarding status: $result");
        return true;
      }());
      return result;
    } on EmptyCacheException {
      return OnboardingStatus.undetermined;
    }
  }

  Future<void> updateOnboardingStatus() async {
    final prefs = await ref.read(sharedPreferencesProvider.future);
    final dataSource = OnboardingLocalDataSource(sharedPreferences: prefs);
    await dataSource.setOnboardingStatus(status: OnboardingStatus.completed);
    state = AsyncData(OnboardingStatus.completed);
  }
}
