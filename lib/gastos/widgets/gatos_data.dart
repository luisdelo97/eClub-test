import 'package:eclub/color_theme.dart';
import 'package:flutter/material.dart';

class GastosData {
  final String category;
  final double total;
  final Color color;
  final String nameSvg;
  final List<GastosItem> items;
  const GastosData({
    required this.category,
    required this.total,
    required this.color,
    required this.nameSvg,
    required this.items,
  });
  static List<GastosData> get getGastos => [
        GastosData(
          category: 'Restaurantes y Bares',
          total: 104000,
          color: restaurantColor,
          nameSvg: 'restaurant.svg',
          items: [
            GastosItem(
              title: 'Don vito',
              date: DateTime(2025, 10, 12),
              amount: 62000,
            ),
            GastosItem(
              title: 'El cafe de aca',
              date: DateTime(2025, 10, 13),
              amount: 42000,
            ),
          ],
        ),
        GastosData(
          category: 'Compras',
          total: 195000,
          color: shoppingColor,
          nameSvg: 'check_bag.svg',
          items: [
            GastosItem(
              title: 'Adidas',
              date: DateTime(2025, 10, 12),
              amount: 130000,
            ),
            GastosItem(
              title: 'American Eagle',
              date: DateTime(2025, 10, 13),
              amount: 165000,
            ),
          ],
        ),
        GastosData(
          category: 'Transporte',
          total: 138000,
          color: terciaryColor,
          nameSvg: 'bus.svg',
          items: [
            GastosItem(
              title: 'Uber',
              date: DateTime(2025, 10, 12),
              amount: 60000,
            ),
            GastosItem(
              title: 'Bolt',
              date: DateTime(2025, 10, 13),
              amount: 78000,
            ),
          ],
        ),
      ];
}

class GastosItem {
  final String title;
  final DateTime date;
  final double amount;
  GastosItem({
    required this.title,
    required this.date,
    required this.amount,
  });
}
