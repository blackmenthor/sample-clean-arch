import 'package:flutter/material.dart';
import 'package:flutter_clean_arch/ui/components/base_text_field.dart';
import 'package:flutter_clean_arch/utils/debouncer.dart';

const _kDebounceDuration = Duration(milliseconds: 500);

class BaseSearchTextField extends StatefulWidget {
  const BaseSearchTextField({
    Key? key,
    required this.hint,
    this.label,
    this.controller,
    this.onChanged,
    this.debounceDuration = _kDebounceDuration,
  }) : super(key: key);

  final String hint;
  final String? label;
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final Duration debounceDuration;

  @override
  State<BaseSearchTextField> createState() => _BaseSearchTextFieldState();
}

class _BaseSearchTextFieldState extends State<BaseSearchTextField> {
  late TextEditingController _textEditingController;
  late Debouncer _debouncer;

  @override
  void initState() {
    super.initState();

    _debouncer = Debouncer(
      milliseconds: widget.debounceDuration.inMilliseconds,
    );
    _textEditingController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();

    _debouncer.close();
    _textEditingController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BaseTextField(
      controller: _textEditingController,
      hint: widget.hint,
      label: widget.label,
      suffixIcon: InkWell(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
          _textEditingController.clear();
          if (widget.onChanged != null) {
            widget.onChanged!('');
          }
        },
        child: const Icon(
          Icons.close,
        ),
      ),
      onChanged: (query) => _debouncer.run(() {
        if (widget.onChanged != null) {
          widget.onChanged!(query);
        }
      }),
    );
  }
}
