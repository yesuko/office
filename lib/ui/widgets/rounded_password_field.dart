import 'package:flutter/material.dart';

import '../../util.dart';
import 'text_field_container.dart';

class RoundedPasswordField extends StatefulWidget {
  final Function(String)? onChanged;
  final String? Function(String?) validator;
  final Function(String?)? onSaved;
  final String hintText;
  final double? scale;

  const RoundedPasswordField({
    this.onChanged,
    this.hintText = "Password",
    required this.validator,
    this.scale,
    Key? key,
    this.onSaved,
  }) : super(key: key);

  @override
  State<RoundedPasswordField> createState() => _RoundedPasswordFieldState();
}

class _RoundedPasswordFieldState extends State<RoundedPasswordField> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {
    return TextFieldContainer(
      scale: widget.scale,
      child: TextFormField(
        obscureText: obscureText,
        onChanged: widget.onChanged,
        validator: widget.validator,
        onSaved: widget.onSaved,
        cursorColor: kPrimaryColor,
        decoration: InputDecoration(
          hintText: widget.hintText,
          isCollapsed: false,
          icon: const Icon(
            Icons.lock,
            color: kPrimaryColor,
          ),
          suffixIcon: GestureDetector(
            onTap: () => setState(() => obscureText = !obscureText),
            child: Icon(
              obscureText ? Icons.visibility : Icons.visibility_off,
              color: kPrimaryColor,
            ),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }
}
