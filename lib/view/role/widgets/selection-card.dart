import 'package:flutter/material.dart';

class RoleSelectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final VoidCallback onTap;

  const RoleSelectionCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xff102A43);

    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        curve: Curves.easeInOut,
        width: double.infinity,
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),

          border: Border.all(
            color: isSelected
                ? primaryColor
                : const Color(0xffD9E2EC),
            width: isSelected ? 2 : 1,
          ),

          boxShadow: isSelected
              ? [
            BoxShadow(
              color: primaryColor.withOpacity(0.08),
              blurRadius: 8,
              offset: const Offset(0, 3),
            ),
          ]
              : [],
        ),
        child: Row(
          children: [
            // ICON
            AnimatedContainer(
              duration: const Duration(milliseconds: 200),
              width: 44,
              height: 44,
              decoration: BoxDecoration(
                color: isSelected
                    ? const Color(0xffE6EEF5)
                    : const Color(0xffF8FAFC),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? primaryColor
                    : const Color(0xff52667A),
                size: 23,
              ),
            ),

            const SizedBox(width: 16),

            // TITLE + SUBTITLE
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Color(0xff10243E),
                    ),
                  ),

                  const SizedBox(height: 5),

                  Text(
                    subtitle,
                    style: const TextStyle(
                      fontSize: 13,
                      height: 1.35,
                      color: Color(0xff52667A),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 10),

            // CHECK ICON
            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              transitionBuilder: (child, animation) {
                return ScaleTransition(
                  scale: animation,
                  child: child,
                );
              },
              child: isSelected
                  ? const Icon(
                Icons.check_circle_outline,
                key: ValueKey('selected'),
                color: Color(0xff00B686),
                size: 24,
              )
                  : const SizedBox(
                key: ValueKey('unselected'),
                width: 24,
                height: 24,
              ),
            ),
          ],
        ),
      ),
    );
  }
}