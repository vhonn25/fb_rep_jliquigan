import 'package:facebook_application/widgets/constants.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.validator,
    this.onSaved,
    this.controller,
    this.isObscure = false,
    this.fontSize,
    this.fontColor,
    this.hintTextSize = 12.0,
    this.hintText = '',
    this.fillColor = Colors.black12,
    this.height,
    this.width,
    this.keyboardType = TextInputType.text,
    this.maxLength = 200,
    required this.onTap,
  });

  final String? Function(String?) validator;
  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final bool isObscure;
  final double? fontSize;
  final Color? fontColor;
  final double? height, width;
  final double hintTextSize;
  final String hintText;
  final Color fillColor;
  final TextInputType keyboardType;
  final int maxLength;
  final void Function() onTap;

  @override
  _CustomTextFormFieldState createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool _isObscured;
  late TextEditingController _textController;

  @override
  void initState() {
    super.initState();
    _isObscured = widget.isObscure;
    _textController = widget.controller ?? TextEditingController();
  }

  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: widget.validator,
      onSaved: widget.onSaved,
      controller: _textController,
      obscureText: _isObscured,
      keyboardType: widget.keyboardType,
      inputFormatters: [LengthLimitingTextInputFormatter(widget.maxLength)],
      style: TextStyle(
        fontSize: widget.fontSize ?? 14.0,
        color: widget.fontColor ?? Colors.black,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.fromLTRB(
          widget.width ?? 10.0,
          widget.height ?? 10.0,
          widget.width ?? 10.0,
          widget.height ?? 10.0,
        ),
        focusColor: Colors.black12,
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color:
                FB_PURPLE_PRIMARY, // Replace FB_PURPLE_PRIMARY with an actual color
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        errorStyle: const TextStyle(fontFamily: 'Frutiger'),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color: Colors.red,
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(
            color:
                Colors.green, // Replace FB_LIGHT_PRIMARY with an actual color
            width: 2,
          ),
          borderRadius: BorderRadius.circular(10.0),
        ),
        filled: true,
        hintStyle: TextStyle(
          color: Colors.black12,
          fontSize: widget.hintTextSize,
          fontFamily: 'Frutiger',
        ),
        hintText: widget.hintText,
        fillColor: widget.fillColor,
        suffixIcon: widget.isObscure
            ? IconButton(
                icon: Icon(
                  _isObscured ? Icons.visibility_off : Icons.visibility,
                  color: Colors.grey,
                ),
                onPressed: () {
                  setState(() {
                    _isObscured = !_isObscured;
                  });
                },
              )
            : null,
      ),
    );
  }
}
