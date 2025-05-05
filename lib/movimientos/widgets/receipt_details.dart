import 'package:eclub/color_theme.dart';
import 'package:eclub/formatter.dart';
import 'package:flutter/material.dart';

class ReceiptDetails extends StatelessWidget {
  final String category;
  final DateTime date;
  final String idRef;
  const ReceiptDetails({
    super.key,
    required this.category,
    required this.date,
    required this.idRef,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        spacing: 15,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Operacion',
                style: TextStyle(fontSize: 14),
              ),
              Text(
                category,
                style: const TextStyle(fontSize: 14),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Fecha:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: onSurfaceColor,
                ),
              ),
              Text(
                formatDate(date),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Hora:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: onSurfaceColor,
                ),
              ),
              Text(
                formatTime(date),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Text(
                'Cod. Referencia:',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: onSurfaceColor,
                ),
              ),
              Text(
                idRef,
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
