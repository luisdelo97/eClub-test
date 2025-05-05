import 'package:eclub/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Rs. 2.000',
                  style: TextStyle(fontSize: 25),
                ),
                SvgPicture.asset(
                  'assets/vectors/expand.svg',
                  colorFilter: const ColorFilter.mode(
                    primaryColor,
                    BlendMode.srcIn,
                  ),
                  width: 35,
                  height: 35,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
