import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/features/report/presentation/controller/report_controller.dart';
import 'package:quiz_app/src/providers/auth_provider.dart';

class CustomProfileScreen extends ConsumerWidget {
  const CustomProfileScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authProviders = ref.watch(authProviderProvider);
    final reportController = ref.watch(reportControllerProvider);

    final total = reportController.when(
      data: (report) => report.total,
      loading: () => 0,
      error: (e, _) => 0,
    );
    return Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
        ),
        body: ProfileScreen(
          providers: authProviders,
          children: [
            Text(
              'Quizzes Completed: $total',
              style: TextStyle(fontSize: 30),
            )
          ],
        ));
  }
}
