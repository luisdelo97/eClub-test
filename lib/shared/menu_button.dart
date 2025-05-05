import 'package:flutter/material.dart';
import 'package:eclub/shared/svg_icon.dart';

class MenuButton extends StatelessWidget {
  final Color color;

  const MenuButton({
    super.key,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () {},
        child: Container(
          padding: const EdgeInsets.all(8),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(6),
            border: Border.all(color: color),
          ),
          child: SvgIcon(
            nameSvg: 'menu.svg',
            color: color,
            size: 24,
          ),
        ),
      ),
    );
  }
}
