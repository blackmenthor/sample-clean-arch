import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/domain/auth/pages/login/login_page.dart';
import 'package:flutter_clean_arch/domain/journal/journal_list/view/journal_list_page.dart';
import 'package:flutter_clean_arch/kickoff/view/kickoff_page.dart';
import 'package:go_router/go_router.dart';

final GoRouter appRouter = GoRouter(
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
        return const LoginPage();
      },
    ),
    GoRoute(
      path: '/journal',
      builder: (BuildContext context, GoRouterState state) {
        return const JournalListPage();
      },
      // routes: [
      //   GoRoute(
      //     path: ':id',
      //     builder: (BuildContext context, GoRouterState state) {
      //       final id = state.params['id'] ?? '';
      //       return JournalDetailPage(
      //         id: id,
      //       );
      //     },
      //   ),
      // ],
    ),
  ],
);
