import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:quiz_app/home_screen.dart';
import 'package:quiz_app/src/features/auth/presentation/custom_profile_screen.dart';
import 'package:quiz_app/src/features/auth/presentation/custom_signin_screen.dart';
import 'package:quiz_app/src/providers/firebase_auth.dart';
import 'package:quiz_app/src/routing/go_router_refresh_stream.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'app_router.g.dart';

enum Routes {
  singin,
  profile,
  home,
}

@Riverpod(keepAlive: true)
GoRouter appRouter(Ref ref) {
  final firebaseAuth = ref.watch(firebaseAuthProvider);
  return GoRouter(
    initialLocation: '/signin',
    redirect: (context, state) {
      final isLoggedIn = firebaseAuth.currentUser != null;
      if (isLoggedIn) {
        if (state.uri.path == '/signin') {
          return '/home';
        }
      } else if (state.uri.path != '/signin') {
        return '/signin';
      }
      return null;
    },
    refreshListenable: GoRouterRefreshStream(firebaseAuth.authStateChanges()),
    routes: [
      GoRoute(
        name: Routes.singin.name,
        path: '/signin',
        builder: (context, state) => const CustomSigninScreen(),
      ),
      GoRoute(
        name: Routes.home.name,
        path: '/home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            name: Routes.profile.name,
            path: 'profile',
            builder: (context, state) => const CustomProfileScreen(),
          ),
        ],
      ),
    ],
  );
}
