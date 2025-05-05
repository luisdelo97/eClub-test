import 'package:eclub/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class NotificationBanner extends StatelessWidget {
  const NotificationBanner({super.key});

  Widget _buildBanner({required String text, required String iconSvgPath}) {
    return Material(
      color: primaryColor,
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
              SvgPicture.asset(
                iconSvgPath,
                width: 35,
                height: 35,
                colorFilter: const ColorFilter.mode(
                  Colors.white,
                  BlendMode.srcIn,
                ),
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
        iconSvgPath: 'assets/vectors/air_paper.svg',
        text:
            'Nombre promoción de dos o tres lfdfdfdfdfdfdfdfdfsfsdfdsfsfsfsfsfsfsfsfsfsfsdffdfdfdfdfdfdffdfsfsdínea',
      ),
      _buildBanner(
          iconSvgPath: 'assets/vectors/double_face.svg',
          text:
              'Nombre promoción de dos o tres lfdfdfdfdfdfdfdfdfsfsdfdsfsfsfsfsfsfsfsfsfsfsdffdfdfdfdfdfdffdfsfsdínea'),
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
