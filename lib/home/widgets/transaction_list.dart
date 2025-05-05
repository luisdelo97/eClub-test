import 'package:eclub/formatter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TransactionList extends StatelessWidget {
  const TransactionList({super.key, required this.transactions});
  final List<TransactionItem> transactions;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Column(
        spacing: 20,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          const Text(
            'Movimientos',
            style: TextStyle(fontSize: 14),
          ),
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.zero,
              itemCount: transactions.length,
              separatorBuilder: (context, index) => const SizedBox(height: 14),
              itemBuilder: (context, index) => transactions[index],
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionItem extends StatelessWidget {
  final String nameSvg;
  final String title;
  final String? category;
  final DateTime? date;
  final double total;
  final Color color;
  final VoidCallback? onTap;
  const TransactionItem(
      {super.key,
      required this.nameSvg,
      required this.title,
      required this.total,
      required this.color,
      this.category,
      this.date,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Row(
          spacing: 16,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 35,
              height: 35,
              decoration: const BoxDecoration(
                shape: BoxShape.circle,
                color: Colors.white,
              ),
              padding: const EdgeInsets.all(6),
              child: SvgPicture.asset(
                'assets/vectors/$nameSvg',
                colorFilter: ColorFilter.mode(
                  color,
                  BlendMode.srcIn,
                ),
                width: 25,
                height: 25,
              ),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                spacing: 6,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  if (category != null)
                    Text(
                      category!,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                ],
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              spacing: 6,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  '-${formatNumber(total)}Gs',
                  style: const TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                if (date != null)
                  Text(
                    formatDate(date!),
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
