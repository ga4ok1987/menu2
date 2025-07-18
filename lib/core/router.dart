import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import '../presentation/pages/main_page.dart';
import 'constants/routes.dart';

final router = GoRouter(
  routes: [
    GoRoute(
      path: Routes.root,
      builder: (BuildContext context, GoRouterState state) {
      return MainPage();}
    ),
  ],
);
