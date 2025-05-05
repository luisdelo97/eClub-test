import 'package:eclub/analisis/analisis_view.dart';
import 'package:eclub/bottom_app_bar.dart';
import 'package:eclub/chart.dart';
import 'package:eclub/gastos/gastos_view.dart';
import 'package:eclub/home/home_view.dart';
import 'package:eclub/movimientos/movimientos_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const surfaceColor = Color(0xFFF7F0ED);
const primaryColor = Color(0xFFDF0A5D);
const secondaryColor = Color(0xFFFF6720);
const terciaryColor = Color(0xFFFF9E1B);
const onSurfaceColor = Color(0xFF888787);
const onBackgroundColor = Color(0xFFCACACA);
const restaurantColor = Color(0xFFDAB0F8);
const shoppingColor = Color(0xFFA9B6FC);

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
              builder: (context, state) => const _NavigateView(),
              routes: [
                GoRoute(
                  path: ':id',
                  name: 'transferir_id',
                  builder: (context, state) {
                    final id = state.pathParameters['id'];
                    return _NavigateView(index: int.parse(id!));
                  },
                )
              ],
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
              builder: (context, state) => const _NavigateView(),
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
  final int? index;
  const _NavigateView({this.index});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Transferir',
          style: TextStyle(color: Colors.white),
        ),
      ),
      backgroundColor: surfaceColor,
      body: DoughnutChart(
        index: index,
        centerTitle: 'Julio',
        centerSubtitle: 374500,
      ),
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
          print("Botón QR presionado (desde MainWrapper)");
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('Acción QR')),
          );
        },
      ),
    );
  }
}
