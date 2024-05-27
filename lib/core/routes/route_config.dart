import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_demo_project/core/routes/route_path.dart';
import 'package:flutter_demo_project/features/post/presentation/screens/post_detail_screen.dart';
import 'package:flutter_demo_project/main/defer_init.dart';

class RouteConfig {
  final GoRouter goRouter; // This instance will store route state
  static RouteConfig? _instance;

  factory RouteConfig() {
    _instance ??= RouteConfig._();
    return _instance!;
  }

  RouteConfig._() : goRouter = _router;

  static GoRouter get _router => GoRouter(
        routes: [
          GoRoute(
            path: RoutePath.intialRoute,
            builder: (context, state) => const DeferScreen(),
          ),
          GoRoute(
            path: RoutePath.postDetail,
            builder: PostDetailScreen.routeBuilder,
          ),
        ],
        errorBuilder: (context, state) => const Scaffold(
          body: Text('data'),
        ),
      );
}
