import 'package:flutter/material.dart';

class ActivityChart extends StatelessWidget {
  const ActivityChart({
    required this.values,
  });

  final List<double> values;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 116,
      padding: const EdgeInsets.fromLTRB(
        14,
        12,
        14,
        10,
      ),

      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
        BorderRadius.circular(16),
        border: Border.all(
          color: const Color(0xffDCE3EA),
        ),
      ),

      child: Column(
        children: [
          Row(
            children: [
              const Expanded(
                child: Text(
                  'Exit Handover Activity Trend',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w700,
                    color: Color(0xff182B3C),
                  ),
                ),
              ),

              const Text(
                'Last 7 Days',
                style: TextStyle(
                  fontSize: 10,
                  color: Color(0xff66717E),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          Expanded(
            child: Row(
              crossAxisAlignment:
              CrossAxisAlignment.end,

              mainAxisAlignment:
              MainAxisAlignment.spaceAround,

              children: values.map(
                    (value) {
                  return Container(
                    width: 16,
                    height: 48 * value + 4,
                    decoration: BoxDecoration(
                      color:
                      const Color(0xff102A43),
                      borderRadius:
                      BorderRadius.circular(
                        4,
                      ),
                    ),
                  );
                },
              ).toList(),
            ),
          ),
        ],
      ),
    );
  }
}