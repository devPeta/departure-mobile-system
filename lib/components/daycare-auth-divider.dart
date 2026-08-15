import 'package:flutter/material.dart';
class DayCareAuthOrDivider extends StatelessWidget {
  const DayCareAuthOrDivider({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: const [
        Expanded(child: Divider()),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.0),
          child: Text('OR'),
        ),
        Expanded(child: Divider()),
      ],
    );
  }
}
