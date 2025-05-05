import 'package:eclub/color_theme.dart';
import 'package:flutter/material.dart';
import 'package:eclub/shared/svg_icon.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({super.key});

  Widget _buildBanner({
    required String text,
    required String nameSvg,
    required Color backgroundColor,
  }) {
    return Material(
      color: backgroundColor,
      borderRadius: BorderRadius.circular(8),
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () {},
        splashColor: Colors.white.withAlpha((0.2 * 255).toInt()),
        child: Container(
          padding: const EdgeInsets.all(10),
          width: 240,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: Text(
                  text,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis,
                ),
              ),

              // 3. Icono a la derecha
              SvgIcon(
                nameSvg: nameSvg,
                color: Colors.white,
                size: 35,
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final notifications = [
      _buildBanner(
        backgroundColor: primaryColor,
        nameSvg: 'air_paper.svg',
        text:
            'Nombre promoción de dos o tres líneas lorem ipsum lorem ipsum dolor sit amet',
      ),
      _buildBanner(
        backgroundColor: secondaryColor,
        nameSvg: 'double_face.svg',
        text:
            'Nombre promoción de dos o tres líneas lorem ipsum lorem ipsum dolor sit amet',
      ),
    ];

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
          SizedBox(
            height: 70,
            child: ListView.separated(
              scrollDirection: Axis.horizontal,
              physics: const ClampingScrollPhysics(),
              itemBuilder: (context, index) => notifications[index],
              separatorBuilder: (context, index) => const SizedBox(width: 20),
              itemCount: notifications.length,
            ),
          )
        ],
      ),
    );
  }
}
