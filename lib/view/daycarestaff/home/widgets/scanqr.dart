import 'package:flutter/material.dart';

class ScanParentQrCard extends StatelessWidget {
  const ScanParentQrCard({
    required this.onTap,
  });

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 14,
        ),
        decoration: BoxDecoration(
          color: const Color(0xff102A43),
          borderRadius:
          BorderRadius.circular(14),
        ),
        child: Row(
          children: [
            // QR ICON
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                color: const Color(0xff203D58),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: const Icon(
                Icons.qr_code_scanner_rounded,
                color: Colors.white,
                size: 27,
              ),
            ),

            const SizedBox(width: 14),

            // TEXT
            const Expanded(
              child: Column(
                crossAxisAlignment:
                CrossAxisAlignment.start,
                children: [
                  Text(
                    'Scan Parent QR Code',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),

                  SizedBox(height: 4),

                  Text(
                    'Tap to immediately launch verified departure scanner',
                    style: TextStyle(
                      fontSize: 11,
                      height: 1.3,
                      color: Color(0xffB8C6D3),
                    ),
                  ),
                ],
              ),
            ),

            const Icon(
              Icons.chevron_right_rounded,
              color: Colors.white,
              size: 27,
            ),
          ],
        ),
      ),
    );
  }
}