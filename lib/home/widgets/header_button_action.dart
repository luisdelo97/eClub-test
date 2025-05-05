import 'package:eclub/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:eclub/shared/svg_icon.dart';

class HeaderButtonActions extends StatelessWidget {
  const HeaderButtonActions({super.key});
  Widget _buildAction({required String label, required String nameSvg}) {
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
              child: SvgIcon(
                nameSvg: nameSvg,
                color: primaryColor,
                size: 30,
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
          nameSvg: 'double_arrow.svg',
        ),
        _buildAction(
          label: 'Recargas',
          nameSvg: 'credit_card.svg',
        ),
        _buildAction(
          label: 'Creditos',
          nameSvg: 'wallet.svg',
        ),
        _buildAction(
          label: 'Pagos',
          nameSvg: 'document.svg',
        ),
      ],
    );
  }
}
