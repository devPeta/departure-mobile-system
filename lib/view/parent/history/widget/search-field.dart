import 'package:flutter/material.dart';


class SearchField extends StatelessWidget {
  const SearchField({
    required this.onChanged,
  });

  final ValueChanged<String> onChanged;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 48,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),
      child: TextField(
        onChanged: onChanged,
        style: const TextStyle(
          fontSize: 13,
          color: Color(0xff10243E),
        ),
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xff9AA7B5),
          ),
          hintText:
          'Search child or guardian name...',
          hintStyle: TextStyle(
            fontSize: 13,
            color: Color(0xffA1ACB8),
          ),
          contentPadding: EdgeInsets.symmetric(
            vertical: 14,
          ),
        ),
      ),
    );
  }
}