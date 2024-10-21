import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:tugas_list_kuliner/Pages/DetailPage.dart';
import 'package:tugas_list_kuliner/Pages/HomePage.dart';

void main() {
  runApp(const MainApp());
}

final GoRouter _router = GoRouter(
  routes: [
    GoRoute(
      path: '/',
      name: 'home',
      builder: (context, state) => HomePage(),
    ),
    GoRoute(
      path: '/detail',
      name: 'detail',
      builder: (context, state) {
        final item = state.extra as Map<String, dynamic>;
        return DetailPage(item: item);
      },
    ),
  ],
);

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router,
    );
  }
}
