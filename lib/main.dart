import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:window_size/window_size.dart';

import 'theme.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  const Size minimumWindowSize = Size(800, 600);

  if (!kIsWeb && defaultTargetPlatform == TargetPlatform.macOS) {
    setWindowMinSize(minimumWindowSize);
  }

  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  static final GoRouter _router = GoRouter(
    routes: [
      GoRoute(
        path: '/',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'order',
            name: 'order',
            builder: (context, state) => const OrderScreen(),
          ),
        ],
      ),
    ],
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: buildTheme(),
      routerConfig: _router,
    );
  }
}
