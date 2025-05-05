import 'package:eclub/router.dart';
import 'package:flutter/material.dart';

class MonthList extends StatefulWidget {
  const MonthList(
      {super.key, required this.month, required this.onMonthSelected});
  final List<String> month;
  final ValueChanged<int> onMonthSelected;
  @override
  State<MonthList> createState() => _MonthListState();
}

class _MonthListState extends State<MonthList> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      itemCount: widget.month.length,
      scrollDirection: Axis.horizontal,
      separatorBuilder: (context, index) => const SizedBox(width: 14),
      itemBuilder: (context, index) {
        final isSelected = index == currentIndex;
        final selectedColor = isSelected ? primaryColor : Colors.black;
        return IntrinsicWidth(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              InkWell(
                onTap: () {
                  currentIndex = index;
                  widget.onMonthSelected(index);
                  setState(() {});
                },
                child: Text(
                  '${widget.month[index]} 2025',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w400,
                    color: selectedColor,
                  ),
                ),
              ),
              const SizedBox(height: 4),
              if (index == currentIndex)
                Container(
                  height: 2,
                  color: Colors.red,
                ),
            ],
          ),
        );
      },
    );
  }
}
