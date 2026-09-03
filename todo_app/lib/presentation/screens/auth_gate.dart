import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../providers/auth_provider.dart';
import '../widgets/app_loading_screen.dart';
import 'login_screen.dart';
import 'todo_home_screen.dart';

class AuthGate extends ConsumerWidget {
  const AuthGate({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final authAsync = ref.watch(authStateProvider);

    return authAsync.when(
      loading: () => const AppLoadingScreen(),
      error: (error, stack) =>
          Scaffold(body: Center(child: Text('Auth error: $error'))),
      data: (user) {
        if (user == null) return const LoginScreen();
        return const TodoHomeScreen();
      },
    );
  }
}
