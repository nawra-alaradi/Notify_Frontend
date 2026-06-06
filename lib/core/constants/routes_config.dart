import 'package:flutter/cupertino.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:notify/core/constants/app_enums.dart';
import 'package:notify/core/widgets/splash_screen.dart';
import 'package:notify/features/Authentication/presentation/screens/login_screen.dart';
import 'package:notify/features/authentication/presentation/screens/account_edit_screen.dart';
import 'package:notify/features/authentication/presentation/screens/registration_screen.dart';
import 'package:notify/features/note/presentation/screens/notes_screen.dart';
import 'package:notify/features/onboarding/onboarding_provider.dart';
import 'package:notify/features/onboarding/presentation/screens/onboarding_main.dart';
import 'package:notify/features/theme/presentation/screens/settings_screen.dart';

// //routes that do not require authentication
// final _publicRoutes = ['/login', '/splash', '/onboarding'];
//
// final GoRouter routerConfig = GoRouter(
//   routes: <RouteBase>[
//     GoRoute(path: '/', builder: (context, state) => const SettingsScreen()),
//     GoRoute(
//       path: '/onboarding',
//       builder: (context, state) => const OnboardingMain(),
//     ),
//
//     // GoRoute(
//     //   path: '/settings',
//     //   builder: (context, state) => const SettingsScreen(),
//     // ),
//     GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
//     GoRoute(path: '/notes', builder: (context, state) => const NotesScreen()),
//   ],
// );

// core/constants/routes_config.dart

final routerProvider = Provider<GoRouter>((ref) {
  final routerNotifier = _RouterNotifier(ref);

  return GoRouter(
    initialLocation: '/splash',
    refreshListenable: routerNotifier,
    redirect: (context, state) {
      final onboardingAsync = ref.read(onboardingProvider);
      final currentLocation = state.matchedLocation;

      // still loading — stay on splash
      if (onboardingAsync.isLoading) {
        return currentLocation == '/splash' ? null : '/splash';
      }

      final onboardingStatus = onboardingAsync.asData?.value;

      // onboarding not done — send to onboarding
      if (onboardingStatus != OnboardingStatus.completed) {
        return currentLocation == '/onboarding' ? null : '/onboarding';
      }

      // onboarding done but trying to go to onboarding/splash — redirect to login
      if (currentLocation == '/onboarding' || currentLocation == '/splash') {
        return '/login';
      }

      return null; // allow navigation
    },
    routes: [
      GoRoute(
        path: '/splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/onboarding',
        builder: (context, state) => const OnboardingMain(),
      ),
      GoRoute(path: '/login', builder: (context, state) => const LoginScreen()),
      GoRoute(path: '/notes', builder: (context, state) => const NotesScreen()),
      GoRoute(
        path: '/settings',
        builder: (context, state) => const SettingsScreen(),
      ),
      GoRoute(
        path: '/registration',
        builder: (context, state) => const RegistrationScreen(),
      ),
      GoRoute(
        path: '/account',
        builder: (context, state) => const AccountEditScreen(),
      ),
    ],
  );
});

// tells GoRouter to re-run redirect when onboarding state changes
class _RouterNotifier extends ChangeNotifier {
  _RouterNotifier(Ref ref) {
    ref.listen(onboardingProvider, (previous, next) {
      notifyListeners();
    });
  }
}
