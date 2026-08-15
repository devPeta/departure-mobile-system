import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class DayCareTextField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLine;
  final String? label;
  final String hintText;
  final TextInputType keyboardType;
  final String? prefixText;
  final bool isPassword;
  final bool isLoading;
  final String? errorText;
  final void Function(String)? onChanged;
  final String? Function(String?)? validator;
  final Widget? prefix;
  final Widget? suffix;
  final String? initialValue;

  const DayCareTextField({
    super.key,
    this.controller,
    required this.hintText,
    this.keyboardType = TextInputType.text,
    this.isPassword = false,
    this.isLoading = false,
    this.label,
    this.errorText,
    this.onChanged,
    this.validator,
    this.prefix,
    this.suffix,
    this.maxLine,
    this.initialValue,
    this.prefixText,
  });

  @override
  State<DayCareTextField> createState() => _MeetTextFieldState();
}

class _MeetTextFieldState extends State<DayCareTextField> {
  bool isObscured = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (widget.label != null && widget.label!.isNotEmpty) ...[
          Text(
            widget.label!,
            style: GoogleFonts.inter(
              color: Color(0xff344054),
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
          SizedBox(height: 2),
        ],
        TextFormField(
          controller: widget.controller,
          maxLines: widget.maxLine != null ? null : 1,
          keyboardType: widget.keyboardType,
          obscureText: widget.isPassword ? isObscured : false,
          enabled: !widget.isLoading,
          onChanged: (value) => widget.onChanged?.call(value),
          validator: widget.validator,
          style: GoogleFonts.roboto(
            color: Colors.black45,
            fontSize: 14,
            fontWeight: FontWeight.w700,
          ),
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: GoogleFonts.inter(
              color: Color(0xff5A5E66),
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
            prefixText: widget.prefixText,
            prefixStyle: GoogleFonts.inter(
              color: Color(0xff344054),
              fontSize: 14,
              fontWeight: FontWeight.w300,
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xff94A3B8),
                width: 1.5,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xff94A3B8),
                width: 1.5,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color(0xffE2E8F0),
                width: 1.5,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Colors.redAccent,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide(
                color: Color.fromRGBO(210, 210, 210, 0.2),
                width: 1.5,
              ),
            ),
            contentPadding: const EdgeInsets.symmetric(
              horizontal: 16,
              vertical: 14,
            ),
            errorText: widget.errorText,
            filled: true,
            fillColor: Colors.white70,
            focusColor: Colors.white,
            prefixIcon: widget.prefix != null
                ? Padding(
              padding: const EdgeInsets.only(left: 12, right: 8),
              child: widget.prefix,
            )
                : null,
            suffixIcon: widget.isLoading
                ? Padding(
              padding: const EdgeInsets.all(10),
              child: SizedBox(
                width: 20,
                height: 20,
                child: CircularProgressIndicator(
                  strokeWidth: 2,
                  color: Color(0xff808080),
                ),
              ),
            )
                : widget.isPassword
                ? IconButton(
              icon: Icon(
                isObscured
                    ? Icons.visibility_off
                    : Icons.visibility,
                color: Color(0xff94A3B8),
              ),
              onPressed: () =>
                  setState(() => isObscured = !isObscured),
            )
                : widget.suffix != null
                ? Padding(
              padding: const EdgeInsets.only(right: 12, left: 8),
              child: widget.suffix,
            )
                : null,
          ),
        ),
      ],
    );
  }
}
