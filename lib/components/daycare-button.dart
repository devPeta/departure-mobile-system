import 'package:daycare_management_system_mobile/components/daycare-indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';



class DayCareButton extends StatelessWidget {
  final String? text;
  final VoidCallback? onPressed;
  final Color? backgroundColor;
  final Color? textColor;
  final EdgeInsetsGeometry? padding;
  final double? borderRadius;
  final double? fontSize;
  final FontWeight? fontWeight;
  final double? width;
  final double? height;
  final Widget? icon;
  final bool isLoading;
  final bool isDisabled;
  final Widget? prefix;
  final Widget? suffix;
  final TextStyle? style;
  final BorderSide? border; // <-- Added border

  const DayCareButton({
    super.key,
    this.text,
    required this.onPressed,
    this.backgroundColor,
    this.textColor,
    this.padding,
    this.borderRadius = 8,
    this.fontSize,
    this.fontWeight,
    this.width,
    this.height = 44,
    this.icon,
    this.isLoading = false,
    this.isDisabled = false,
    this.prefix,
    this.suffix,
    this.style,
    this.border, // <-- Constructor assignment
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        onPressed: (isLoading || isDisabled) ? null : onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor:
          // (isLoading || isDisabled)
          //     ? backgroundColor?.withOpacity(0.6)
          //     :
          backgroundColor,
          padding: padding ?? const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
          minimumSize: Size(width ?? 0, height ?? 48.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(borderRadius ?? 10),
            side: border ?? BorderSide.none, // <-- Apply border style
          ),
          elevation: 0,
        ),
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (Widget child, Animation<double> animation) {
            return FadeTransition(
              opacity: animation,
              child: ScaleTransition(scale: animation, child: child),
            );
          },
          child: isLoading
              ? const DayCareLoadingIndicator(key: ValueKey('loading'),)
              : Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            key: const ValueKey('content'),
            children: [
              if (prefix != null) prefix!,
              if (prefix != null && text != null) SizedBox(width: 8),
              if (text != null)
                Text(
                  text!,
                  style: style ??
                      GoogleFonts.roboto(
                        fontWeight: fontWeight ?? FontWeight.w500,
                        fontSize: fontSize ?? 16,
                        color: textColor,
                      ),
                ),
              if (suffix != null) ...[
                SizedBox(width: 8),
                suffix!,
              ],
            ],
          ),
        ),
      ),
    );
  }
}
