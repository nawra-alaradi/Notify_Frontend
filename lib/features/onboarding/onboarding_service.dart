import 'package:dartz/dartz.dart';
import 'package:notify/core/constants/app_constants.dart';
import 'package:notify/core/constants/app_enums.dart';
import 'package:notify/core/errors/exceptions.dart';
import 'package:shared_preferences/shared_preferences.dart';

class OnboardingLocalDataSource {
  final SharedPreferences sharedPreferences;
  const OnboardingLocalDataSource({required this.sharedPreferences});

  Future<OnboardingStatus> getOnboardingStatus() {
    final cachedStatus = sharedPreferences.getString(kOnboardingKey);
    if (cachedStatus != null) {
      final onboardingEnum = cachedStatus == kUndetermined
          ? OnboardingStatus.undetermined
          : OnboardingStatus.completed;
      return Future.value(onboardingEnum);
    } else {
      throw EmptyCacheException(message: "Onboarding status has no value");
    }
  }

  Future<Unit> setOnboardingStatus({required OnboardingStatus status}) {
    sharedPreferences.setString(
      kOnboardingKey,
      status == OnboardingStatus.completed ? kCompleted : kUndetermined,
    );
    return Future.value(unit);
  }
}
