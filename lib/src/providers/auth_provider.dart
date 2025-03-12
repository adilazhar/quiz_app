import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'auth_provider.g.dart';

@Riverpod(keepAlive: true)
List<AuthProvider> authProvider(Ref ref) {
  return [EmailAuthProvider()];
}
