import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/core/di/di.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/view/login_page.dart';
import 'package:flutter_clean_arch/domain/auth/pages/register/view/register_page.dart';
import 'package:flutter_clean_arch/domain/journal/journal_detail/view/journal_detail_page.dart';
import 'package:flutter_clean_arch/domain/journal/journal_list/view/journal_list_page.dart';
import 'package:flutter_clean_arch/kickoff/view/kickoff_page.dart';
import 'package:go_router/go_router.dart';

final navigatorKey = locator.get<GlobalKey<NavigatorState>>();
final appNavigator = locator.get<AppNavigator>();

class AppNavigator {

  void go({
    BuildContext? context,
    required String location,
  }) {
    final ctx = context ?? navigatorKey.currentContext!;
    ctx.push(location);
  }

  void replace({
    BuildContext? context,
    required String location,
  }) {
    final ctx = context ?? navigatorKey.currentContext!;
    ctx.replace(location);
  }

  void pop({
    BuildContext? context,
  }) {
    final ctx = context ?? navigatorKey.currentContext!;
    ctx.pop();
  }

}

final GoRouter appRouter = GoRouter(
  navigatorKey: navigatorKey,
  routes: <GoRoute>[
    GoRoute(
      path: '/',
      name: 'root',
      builder: (ctx, state) => const KickOffPage(),
    ),
    GoRoute(
      path: '/login',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/register',
      builder: (BuildContext context, GoRouterState state) {
        return const RegisterPage();
      },
    ),
    GoRoute(
      path: '/journal',
      builder: (BuildContext context, GoRouterState state) {
        return JournalListPage();
      },
      routes: [
        GoRoute(
          path: ':id',
          builder: (BuildContext context, GoRouterState state) {
            final id = state.params['id'] ?? '';
            return JournalDetailPage(
              id: id,
            );
          },
        ),
      ],
    ),
  ],
);
