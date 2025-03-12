import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/providers/auth_provider.dart';

class CustomSigninScreen extends ConsumerWidget {
  const CustomSigninScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProviderProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Signin'),
      ),
      body: SignInScreen(
        providers: authProviders,
        // actions: [AuthStateChangeAction<UserCreated>()], //* Do Something When The User Is First registered/
      ),
    );
  }
}
