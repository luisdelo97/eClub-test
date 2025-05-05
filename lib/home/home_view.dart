import 'package:eclub/color_theme.dart';
import 'package:eclub/home/widgets/header_button_action.dart';
import 'package:eclub/home/widgets/notification_banner.dart';
import 'package:eclub/home/widgets/reales_account.dart';
import 'package:eclub/shared/transaction_list.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      spacing: 16,
      children: [
        Container(
          height: MediaQuery.of(context).size.width * 0.8,
          width: double.infinity,
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
            gradient: LinearGradient(
              colors: [
                primaryColor,
                secondaryColor,
                terciaryColor,
              ],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight,
              stops: [0.1, 0.6, 1.0],
            ),
          ),
          child: const SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 22, horizontal: 20),
              child: Column(
                children: [
                  _NameWelcome(),
                  SizedBox(height: 10),
                  _GsBalance(),
                  Spacer(),
                  HeaderButtonActions(),
                ],
              ),
            ),
          ),
        ),
        const RealesAccount(),
        const NotificationBanner(),
        Expanded(
          child: TransactionList(
            transactions: [
              TransactionItem(
                color: const Color(0xFFC9E265),
                nameSvg: 'double_face.svg',
                title: 'PlayStation Network',
                category: 'Entretenimiento',
                date: DateTime(2025, 10, 12),
                total: 1000,
              ),
              TransactionItem(
                color: const Color(0xFFC3EDD8),
                nameSvg: 'deposit.svg',
                title: 'Banco Regional',
                category: 'Retiros',
                date: DateTime(2025, 10, 12),
                total: 1000,
              ),
              TransactionItem(
                color: const Color(0xFFFF9190),
                nameSvg: 'heart_bit.svg',
                title: 'Punto Farma',
                category: 'Salud',
                date: DateTime(2025, 10, 12),
                total: 1.000,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _NameWelcome extends StatelessWidget {
  const _NameWelcome();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 10,
      children: [
        Container(
          padding: const EdgeInsets.all(10),
          decoration: const BoxDecoration(
            color: Colors.white,
            shape: BoxShape.circle,
          ),
          child: const Text(
            'GR',
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.bold, color: primaryColor),
          ),
        ),
        const Text(
          'Hola, Juan!',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
        )
      ],
    );
  }
}

class _GsBalance extends StatelessWidget {
  const _GsBalance();

  @override
  Widget build(BuildContext context) {
    return Row(
      spacing: 14,
      children: [
        const Text(
          'Gs. 374.500',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        IconButton(
          onPressed: () {},
          color: Colors.white,
          icon: const Icon(Icons.remove_red_eye_outlined),
        )
      ],
    );
  }
}
