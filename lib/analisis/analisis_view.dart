import 'package:eclub/router.dart';
import 'package:flutter/material.dart';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:go_router/go_router.dart';

class AnalisisView extends StatelessWidget {
  const AnalisisView({super.key});

  Widget _buildSvgButton({
    required String svgPath,
    required String label,
    required Color svgColor,
    VoidCallback? onTap,
  }) {
    return Material(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8),
      child: InkWell(
        onTap: onTap,
        splashColor: primaryColor.withAlpha((0.2 * 255).toInt()),
        child: Container(
          width: 130,
          height: 130,
          padding: const EdgeInsets.all(20),
          child: Column(
            spacing: 6,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                svgPath,
                colorFilter: ColorFilter.mode(
                  svgColor,
                  BlendMode.srcIn,
                ),
                width: 40,
                height: 40,
              ),
              Text(
                label,
                style: const TextStyle(color: primaryColor, fontSize: 16),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: surfaceColor,
      appBar: AppBar(
        title: const Text('Analisis'),
        titleTextStyle: const TextStyle(
          fontSize: 18,
          color: onSurfaceColor,
          fontWeight: FontWeight.bold,
        ),
        centerTitle: true,
        backgroundColor: surfaceColor,
        actions: [
          Material(
            color: Colors.transparent,
            child: InkWell(
              onTap: () {},
              child: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(6),
                  border: Border.all(),
                ),
                child: SvgPicture.asset(
                  'assets/vectors/menu.svg',
                  colorFilter: const ColorFilter.mode(
                    onSurfaceColor,
                    BlendMode.srcIn,
                  ),
                  width: 24,
                  height: 24,
                ),
              ),
            ),
          ),
          const SizedBox(width: 20),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 40),
        child: Column(
          spacing: 26,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              padding: const EdgeInsets.all(22),
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              child: SvgPicture.asset(
                'assets/vectors/plot_cake.svg',
                colorFilter: const ColorFilter.mode(
                  secondaryColor,
                  BlendMode.srcIn,
                ),
                width: 65,
                height: 65,
              ),
            ),
            const Text(
              '¿Que deseas revisar?',
              style: TextStyle(fontSize: 25, color: primaryColor),
            ),
            Row(
              spacing: 16,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildSvgButton(
                  svgColor: secondaryColor,
                  svgPath: 'assets/vectors/credit_card.svg',
                  label: 'Ingresos',
                ),
                _buildSvgButton(
                  svgColor: secondaryColor,
                  svgPath: 'assets/vectors/wallet.svg',
                  label: 'Gastos',
                  onTap: () {
                    context.pushNamed('gastos');
                  },
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
