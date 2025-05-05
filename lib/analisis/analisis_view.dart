import 'package:eclub/color_theme.dart';
import 'package:eclub/shared/menu_button.dart';
import 'package:eclub/shared/svg_icon.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class AnalisisView extends StatelessWidget {
  const AnalisisView({super.key});

  Widget _buildSvgButton({
    required String nameSvg,
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
              SvgIcon(
                nameSvg: nameSvg,
                color: svgColor,
                size: 40,
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
        actions: const [
          MenuButton(color: onSurfaceColor),
          SizedBox(width: 20),
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
              child: const SvgIcon(
                nameSvg: 'plot_cake.svg',
                color: secondaryColor,
                size: 65,
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
                  nameSvg: 'credit_card.svg',
                  label: 'Ingresos',
                ),
                _buildSvgButton(
                  svgColor: secondaryColor,
                  nameSvg: 'wallet.svg',
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
