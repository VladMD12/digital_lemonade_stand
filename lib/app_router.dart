import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import 'routes.dart';
import 'screens/home_screen.dart';
import 'screens/order_screen.dart';

/// Shared GoRouter instance that wires up the home and order routes.
final appRouterProvider = Provider<GoRouter>((ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: RoutesPath.home,
        name: 'home',
        builder: (context, state) => const HomeScreen(),
      ),
      GoRoute(
        path: RoutesPath.order,
        name: 'order',
        builder: (context, state) => const OrderScreen(),
      ),
    ],
  );
});
