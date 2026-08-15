import 'package:daycare_management_system_mobile/view/staff/children/staff-children-controller.dart';
import 'package:flutter/material.dart';

class TSearchField extends StatelessWidget {
  const TSearchField({
    required this.controller,
  });

  final StaffChildrenController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(14),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),
      child: TextField(
        controller:
        controller.searchController,
        decoration: const InputDecoration(
          border: InputBorder.none,
          prefixIcon: Icon(
            Icons.search_rounded,
            color: Color(0xff52667A),
          ),
          hintText:
          'Search children, rooms, parents...',
          hintStyle: TextStyle(
            fontSize: 14,
            color: Color(0xff8996A3),
          ),
          contentPadding:
          EdgeInsets.symmetric(
            vertical: 13,
          ),
        ),
      ),
    );
  }
}