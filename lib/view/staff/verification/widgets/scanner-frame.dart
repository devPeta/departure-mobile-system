import 'package:flutter/material.dart';

class ScannerFrame extends StatelessWidget {
  const ScannerFrame({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 250,
      height: 250,
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color(0xff536C82),
          width: 2,
        ),
        borderRadius: BorderRadius.circular(28),
      ),
      child: Stack(
        children: [
          // ==========================================
          // SCAN AREA
          // ==========================================

          Center(
            child: Container(
              width: 200,
              height: 200,
              decoration: BoxDecoration(
                border: Border.all(
                  color: const Color(0xff16C79A),
                  width: 3,
                ),
                borderRadius:
                BorderRadius.circular(12),
              ),
              child: Stack(
                children: [
                  // Horizontal scanning line
                  Align(
                    alignment: Alignment.center,
                    child: Container(
                      height: 2,
                      width: double.infinity,
                      color: const Color(0xff16C79A),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ==========================================
          // TOP LABEL
          // ==========================================

          const Positioned(
            top: 20,
            left: 0,
            right: 0,
            child: Text(
              'POSITION QR WITHIN FRAME',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 10,
                fontWeight: FontWeight.w500,
                color: Color(0xffC2CED8),
              ),
            ),
          ),
        ],
      ),
    );
  }
}