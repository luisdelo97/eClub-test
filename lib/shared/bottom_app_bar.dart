import 'package:eclub/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:eclub/shared/svg_icon.dart';

class BottomNavWithQR extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;
  final VoidCallback onQRPressed;

  const BottomNavWithQR({
    super.key,
    required this.currentIndex,
    required this.onTap,
    required this.onQRPressed,
  });

  Widget _buildNavItem({
    required String nameSvg,
    required String label,
    required int itemIndex,
    required BuildContext context,
  }) {
    final bool isSelected = currentIndex == itemIndex;
    final Color color = isSelected ? onSurfaceColor : onBackgroundColor;
    final FontWeight fontWeight =
        isSelected ? FontWeight.bold : FontWeight.normal;

    return InkWell(
      onTap: () => onTap(itemIndex),
      customBorder: const CircleBorder(),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgIcon(
            nameSvg: nameSvg,
            color: color,
            size: 30,
          ),
          const SizedBox(height: 4),
          Text(
            label,
            style: TextStyle(
              color: color,
              fontSize: 12,
              fontWeight: fontWeight,
            ),
            overflow: TextOverflow.ellipsis,
            maxLines: 1,
          ),
        ],
      ),
    );
  }

  Widget _buildQRButton(BuildContext context) {
    return InkWell(
      onTap: onQRPressed,
      customBorder: const CircleBorder(),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: const BoxDecoration(
          color: primaryColor,
          shape: BoxShape.circle,
        ),
        child: const SvgIcon(
          nameSvg: 'qr.svg',
          color: Colors.white,
          size: 40,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool showQRButton = currentIndex == 0;

    return Container(
      height: 80,
      padding: const EdgeInsets.only(bottom: 8),
      decoration: const BoxDecoration(
        color: surfaceColor,
        boxShadow: [
          BoxShadow(
            color: Color(0xFFF8DBCF),
            spreadRadius: 10,
            blurRadius: 20,
            offset: Offset(0, -10),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildNavItem(
            nameSvg: 'home.svg',
            label: 'Inicio',
            itemIndex: 0,
            context: context,
          ),
          _buildNavItem(
            nameSvg: 'double_arrow.svg',
            label: 'Transferir',
            itemIndex: 1,
            context: context,
          ),
          if (showQRButton) _buildQRButton(context),
          _buildNavItem(
            nameSvg: 'plot_cake.svg',
            label: 'Análisis',
            itemIndex: 2,
            context: context,
          ),
          _buildNavItem(
            nameSvg: 'user.svg',
            label: 'Cuenta',
            itemIndex: 3,
            context: context,
          ),
        ],
      ),
    );
  }
}
