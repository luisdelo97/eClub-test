import 'package:eclub/analisis/analisis_view.dart';
import 'package:eclub/color_theme.dart';
import 'package:eclub/shared/bottom_app_bar.dart';
import 'package:eclub/gastos/gastos_view.dart';
import 'package:eclub/shared/menu_button.dart';
import 'package:eclub/home/home_view.dart';
import 'package:eclub/movimientos/movimientos_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: '/',
  routes: [
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) => MainWrapper(
        childView: navigationShell,
      ),
      branches: <StatefulShellBranch>[
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              name: 'home',
              builder: (context, state) => const HomeView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/transferir',
              name: 'transferir',
              builder: (context, state) => const _NavigateView(
                title: 'Transferir',
              ),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/analisis',
              name: 'analisis',
              builder: (context, state) => const AnalisisView(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/cuenta',
              name: 'cuenta',
              builder: (context, state) => const _NavigateView(title: 'Cuenta'),
            ),
          ],
        ),
      ],
    ),
    GoRoute(
      path: '/gastos',
      name: 'gastos',
      builder: (context, state) => const GastosView(),
      routes: [
        GoRoute(
          path: ':gastoIdx',
          name: 'gastoIdx',
          builder: (context, state) {
            final gastosIndex = state.pathParameters['gastoIdx'];
            return GastosView(index: int.parse(gastosIndex!));
          },
          routes: [
            GoRoute(
              path: ':movIdx',
              name: 'movIdx',
              builder: (context, state) {
                final movIdx = state.pathParameters['movIdx'];
                final gastosIndex = state.pathParameters['gastoIdx'];
                return MovimientosView(
                  movIdx: int.parse(movIdx!),
                  gastoIdx: int.parse(gastosIndex!),
                );
              },
            )
          ],
        ),
      ],
    ),
  ],
);

class _NavigateView extends StatelessWidget {
  final String title;
  const _NavigateView({required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        title: Text(title),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: onSurfaceColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: surfaceColor,
        actions: const [
          MenuButton(color: onSurfaceColor),
          SizedBox(width: 20),
        ],
      ),
      body: const SizedBox.shrink(),
    );
  }
}

class MainWrapper extends StatelessWidget {
  final StatefulNavigationShell childView;

  const MainWrapper({super.key, required this.childView});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: childView,
      backgroundColor: surfaceColor,
      bottomNavigationBar: BottomNavWithQR(
        currentIndex: childView.currentIndex,
        onTap: (index) => childView.goBranch(index),
        onQRPressed: () {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              title: const Text('QR Code Scanner'),
              content: const Text('QR Code Scanner is not implemented yet.'),
              actions: [
                TextButton(
                  onPressed: () => Navigator.of(context).pop(),
                  child: const Text('Close'),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
