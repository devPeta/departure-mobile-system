import 'package:flutter/material.dart';

class FilterButtonA extends StatelessWidget {
  const FilterButtonA({
    required this.title,
    required this.count,
    required this.selected,
    required this.onTap,
  });

  final String title;
  final int count;
  final bool selected;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(
          horizontal: 13,
          vertical: 8,
        ),
        decoration: BoxDecoration(
          color: selected
              ? const Color(0xff102A43)
              : Colors.white,
          borderRadius:
          BorderRadius.circular(22),
          border: Border.all(
            color: selected
                ? const Color(0xff102A43)
                : const Color(0xffDCE3EA),
          ),
        ),
        child: Row(
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 11,
                fontWeight: FontWeight.w600,
                color: selected
                    ? Colors.white
                    : const Color(0xff52606D),
              ),
            ),

            const SizedBox(width: 7),

            Container(
              padding:
              const EdgeInsets.symmetric(
                horizontal: 7,
                vertical: 2,
              ),
              decoration: BoxDecoration(
                color: selected
                    ? const Color(0xff36526B)
                    : const Color(0xffEDF2F7),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: Text(
                count.toString(),
                style: TextStyle(
                  fontSize: 9,
                  fontWeight: FontWeight.w700,
                  color: selected
                      ? Colors.white
                      : const Color(0xff52606D),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}