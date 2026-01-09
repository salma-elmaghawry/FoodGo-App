import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:foodgo_app/Core/widgets/custom_text_field.dart';


class CustomPasswordField extends StatefulWidget {
  final TextEditingController? controller;
  final String? hintText;
  final String? labelText;
  final IconData? prefixIcon;
  final String? Function(String?)? validator;
  final void Function(String)? onChanged;
  final bool initialObscure;
  final String? serverErrorText;

  const CustomPasswordField({
    super.key,
    this.controller,
    this.hintText,
    this.labelText,
    this.prefixIcon = CupertinoIcons.lock,
    this.validator,
    this.onChanged,
    this.initialObscure = true,
    this.serverErrorText,
  });

  @override
  State<CustomPasswordField> createState() => _CustomPasswordFieldState();
}

class _CustomPasswordFieldState extends State<CustomPasswordField> {
  late bool _isObscure;

  @override
  void initState() {
    super.initState();
    _isObscure = widget.initialObscure;
  }

  void _toggle() => setState(() => _isObscure = !_isObscure);

  @override
  Widget build(BuildContext context) {
    return CustomTextFormField(
      controller: widget.controller,
      hintText: widget.hintText,
      labelText: widget.labelText,
      //  prefixIcon: Icon(widget.prefixIcon),
      isObsecureText: _isObscure,
      onChanged: widget.onChanged,
      validator: widget.validator,
      serverErrorText: widget.serverErrorText,
      hasSuffixIcon: true,
      suffixIcon: IconButton(
        icon: Icon(
          _isObscure ? CupertinoIcons.eye_slash : CupertinoIcons.eye,
          color: Colors.grey[600],
        ),
        onPressed: _toggle,
      ),
    );
  }
}
