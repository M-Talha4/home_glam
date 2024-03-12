import '/utils/style.dart';
import '../consts/app_color.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class RectangularTextFormField extends StatelessWidget {
  final int? maxline;
  final double? height;
  final double? borderradius;
  final double? borderwidth;
  final double? focusborderwidth;
  final String? hint;
  final String? label;
  final bool? showlabel;
  final bool? obscureText;
  final bool? filled;
  final bool? isCollapsed;
  final bool? isDense;
  final bool? isEnabled;
  final bool? readOnly;
  final Color? fillColor;
  final Color? hintcolor;
  final Color? labelcolor;
  final Color? inputcolor;
  final Color? bordercolor;
  final Color? focusbordercolor;
  final Color? cursorcolor;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final TextInputType? keyboardtype;
  final TextInputAction? inputaction;
  final AutovalidateMode? autoValidateMode;
  void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? Function(String?) validation;

  RectangularTextFormField({
    super.key,
    this.maxline,
    this.height,
    this.borderradius,
    this.borderwidth,
    this.focusborderwidth,
    this.hint,
    this.label,
    this.showlabel,
    this.obscureText,
    this.filled,
    this.isCollapsed,
    this.isDense,
    this.isEnabled,
    this.readOnly,
    this.fillColor,
    this.hintcolor,
    this.labelcolor,
    this.inputcolor,
    this.bordercolor,
    this.focusbordercolor,
    this.cursorcolor,
    this.suffixIcon,
    this.prefixIcon,
    this.keyboardtype,
    this.inputaction,
    this.autoValidateMode,
    this.onChanged,
    this.controller,
    required this.validation,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          //   boxShadow: [
          //   BoxShadow(blurRadius: 5, color: AppColor.grey, offset: Offset(2, 5))
          // ]
          ),
      child: TextFormField(
        controller: controller,
        obscureText: obscureText ?? false,
        cursorColor: cursorcolor ?? AppColor.black,
        maxLines: /*obscureText == true ? 1 :*/ maxline ?? 1,
        textInputAction: inputaction,
        style: TextStyle(
          color: inputcolor ?? AppColor.black,
          fontSize: AppStyle.bodysize(context),
        ),
        autofocus: false,
        keyboardType: keyboardtype,
        onChanged: onChanged,
        autovalidateMode: autoValidateMode ?? AutovalidateMode.disabled,
        readOnly: readOnly ?? false,
        enabled: isEnabled ?? true,
        decoration: InputDecoration(
          hintText: showlabel ?? false ? null : hint,
          label: showlabel ?? false
              ? Text(
                  label!,
                  style: TextStyle(
                    color: labelcolor,
                  ),
                )
              : null,
          hintStyle: TextStyle(
              color: hintcolor ?? AppColor.black,
              fontSize: AppStyle.smallsize(context)),
          filled: true,
          fillColor: isEnabled == false
              ? AppColor.lightGrey
              : fillColor ?? AppColor.textFieldPink,
          prefixIcon: prefixIcon,
          suffixIcon: suffixIcon,
          contentPadding: const EdgeInsets.fromLTRB(20.0, 10, 20.0, 10),
          errorMaxLines: 2,
          isCollapsed: isCollapsed ?? false,
          isDense: isDense,
          // Border States
          enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(
                  color: bordercolor ?? AppColor.transparent,
                  width: borderwidth ?? 1),
              borderRadius: BorderRadius.circular(borderradius ?? 5)),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: focusbordercolor ?? AppColor.primary,
              width: focusborderwidth ?? 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.red,
              width: focusborderwidth ?? 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.red,
              width: focusborderwidth ?? 2,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColor.grey,
              width: focusborderwidth ?? 2,
            ),
          ),
        ),
        validator: validation,
      ),
    );
  }
}
