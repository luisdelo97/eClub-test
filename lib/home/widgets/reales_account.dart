import 'package:eclub/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:eclub/shared/svg_icon.dart';

class RealesAccount extends StatelessWidget {
  const RealesAccount({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 10,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Cuenta en Reales',
            style: TextStyle(fontSize: 14),
          ),
          Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Rs. 2.000',
                  style: TextStyle(fontSize: 25),
                ),
                SvgIcon(
                  nameSvg: 'expand.svg',
                  color: primaryColor,
                  size: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
