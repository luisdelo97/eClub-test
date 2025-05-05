import 'package:eclub/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class HeaderButtonActions extends StatelessWidget {
  const HeaderButtonActions({super.key});
  Widget _buildAction({required String label, required String path}) {
    return Column(
      spacing: 10,
      mainAxisSize: MainAxisSize.min,
      children: [
        Material(
          color: Colors.white,
          shape: const CircleBorder(),
          child: InkWell(
            onTap: () {
              debugPrint('Tapped $label');
            },
            customBorder: const CircleBorder(),
            splashColor: primaryColor.withAlpha((0.3 * 255).toInt()),
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: SvgPicture.asset(
                path,
                colorFilter: const ColorFilter.mode(
                  primaryColor,
                  BlendMode.srcIn,
                ),
                width: 30,
                height: 30,
              ),
            ),
          ),
        ),
        Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 12,
            fontWeight: FontWeight.w400,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildAction(
          label: 'Convertir R\$',
          path: 'assets/vectors/double_arrow.svg',
        ),
        _buildAction(
          label: 'Recargas',
          path: 'assets/vectors/credit_card.svg',
        ),
        _buildAction(
          label: 'Creditos',
          path: 'assets/vectors/wallet.svg',
        ),
        _buildAction(
          label: 'Pagos',
          path: 'assets/vectors/document.svg',
        ),
      ],
    );
  }
}
