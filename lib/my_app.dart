import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quiz_app/src/routing/app_router.dart';

class MyApp extends ConsumerWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final appRouter = ref.watch(appRouterProvider);
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Quiz App',
      routerConfig: appRouter,
    );
  }
}
