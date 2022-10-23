import 'package:flutter/material.dart';

class BaseTextField extends StatefulWidget {
  const BaseTextField({
    Key? key,
    required this.hint,
    this.label,
    this.controller,
    this.onChanged,
    this.prefixIcon,
    this.suffixIcon,
  }) : super(key: key);

  final String hint;
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Widget? prefixIcon;
  final Widget? suffixIcon;

  @override
  State<BaseTextField> createState() => _BaseTextFieldState();
}

class _BaseTextFieldState extends State<BaseTextField> {
  late TextEditingController _controller;

  @override
  void initState() {
    super.initState();

    _controller = widget.controller ?? TextEditingController();
    if (widget.onChanged != null) {
      _controller.addListener(() {
        widget.onChanged!(_controller.text);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _controller,
      decoration: InputDecoration(
        hintText: widget.hint,
        labelText: widget.label,
        fillColor: Colors.white,
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
        ),
        prefixIcon: widget.prefixIcon,
        suffixIcon: widget.suffixIcon,
      ),
    );
  }
}
