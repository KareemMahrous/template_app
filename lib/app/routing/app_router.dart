import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../core/utils/utils.dart';
import '../../di_container.dart';
import 'routes.dart';

final navigatorKey = GlobalKey<NavigatorState>();
final token = preferences.getString(SharedKeys.accessToken);

final GoRouter allRoutes = GoRouter(
  initialLocation: (token == null) ? Routes.login : Routes.layout,

  navigatorKey: navigatorKey,
  routes: [
    // GoRoute(
    //   path: Routes.login.withSlash,
    //   name: Routes.login,
    //   builder: (context, state) => const LoginScreen(),
    // ),
    // GoRoute(
    //   path: "/",
    //   name: Routes.layout,
    //   builder: (context, state) => const LayoutScreen(),
    // ),
  ],
);
