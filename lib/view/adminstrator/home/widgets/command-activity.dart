import 'package:daycare_management_system_mobile/view/adminstrator/home/admin-home-page-controller.dart';
import 'package:daycare_management_system_mobile/view/adminstrator/home/widgets/command-button.dart';
import 'package:flutter/material.dart';

class CommandActions extends StatelessWidget {
  const CommandActions({
    required this.controller,
  });

  final AdminHomeController controller;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: CommandButton(
            title: 'Manage Users',
            icon: Icons.person_add_alt_1_outlined,
            primary: true,
            onTap: controller.manageUsers,
          ),
        ),

        const SizedBox(width: 8),

        Expanded(
          child: CommandButton(
            title: 'Run Reports',
            icon: Icons.description_outlined,
            primary: false,
            onTap: controller.runReports,
          ),
        ),
      ],
    );
  }
}