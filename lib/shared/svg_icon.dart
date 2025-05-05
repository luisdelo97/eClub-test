import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class SvgIcon extends StatelessWidget {
  final String nameSvg;
  final Color color;
  final double size;
  const SvgIcon({
    super.key,
    required this.nameSvg,
    required this.color,
    required this.size,
  });

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      'assets/vectors/$nameSvg',
      colorFilter: ColorFilter.mode(
        color,
        BlendMode.srcIn,
      ),
      width: size,
      height: size,
    );
  }
}
