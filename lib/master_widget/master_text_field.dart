import 'package:flutter/material.dart';

class MasterTextField extends StatefulWidget {
  final String? id;
  final String labelText;
  final String? value;
  final String? hint;
  final String? Function(String?)? validator;
  final bool obscure;
  final bool enabled;
  final int? maxLength;
  final Widget? prefixWidget;
  final IconData? prefixIcon;
  final bool usePrefix;
  final Widget? suffixWidget;
  final IconData? suffixIcon;
  final bool useSuffix;
  final TextEditingController controller;
  final void Function(String)? onChanged;
  final void Function(String)? onSubmitted;
  final Widget? counter;
  final bool defaultCounter;
  final InputBorder? border;
  final int maxLines;
  final TextInputType textInputType;
  final double? textAlignVertical;

  const MasterTextField({
    Key? key,
    required this.labelText,
    this.id,
    this.value,
    this.validator,
    this.hint,
    this.maxLength,
    this.onChanged,
    this.onSubmitted,
    this.obscure = false,
    this.enabled = true,
    this.prefixWidget,
    this.prefixIcon,
    this.usePrefix = false,
    this.suffixWidget,
    this.suffixIcon,
    this.useSuffix = false,
    required this.controller,
    this.defaultCounter = false,
    this.border,
    this.counter,
    this.maxLines = 1,
    this.textInputType = TextInputType.text,
    this.textAlignVertical,
  }) : super(key: key);

  factory MasterTextField.initFalue() {
    return MasterTextField(
      labelText: 'Text Field',
      controller: TextEditingController(),
      value: 'Text Filled',
    );
  }

  factory MasterTextField.initRoundedFalue() {
    return MasterTextField(
      labelText: 'Text Field',
      controller: TextEditingController(),
      value: 'Text Filled',
      border: const OutlineInputBorder(
        borderSide: BorderSide(width: 1),
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
    );
  }

  @override
  State<MasterTextField> createState() => _MasterTextFieldState();
}

class _MasterTextFieldState extends State<MasterTextField> {
  late TextEditingController textEditingController;

  @override
  void initState() {
    textEditingController = widget.controller;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (textEditingController.text.isEmpty) {
      setState(() {
        textEditingController.text = widget.value ?? "";
      });
    }
    super.didChangeDependencies();
  }

  FocusNode focusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      textAlignVertical: widget.textAlignVertical != null ? TextAlignVertical(y: widget.textAlignVertical!) : null,
      enabled: widget.enabled,
      controller: widget.controller,
      focusNode: focusNode,
      validator: widget.validator,
      maxLength: widget.maxLength,
      obscureText: widget.obscure,
      maxLines: widget.maxLines,
      keyboardType: widget.textInputType,
      decoration: InputDecoration(
        alignLabelWithHint: true,
        labelText: widget.labelText.isEmpty && (widget.hint ?? '').isNotEmpty
            ? null
            : widget.labelText,
        contentPadding: EdgeInsets.zero,
        labelStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        border: widget.border,
        focusedBorder: widget.border,
        counter: widget.counter == null && !widget.defaultCounter
            ? Container()
            : widget.counter,
        enabledBorder: widget.border ??
            const UnderlineInputBorder(
              borderSide: BorderSide(
                color: Colors.blueGrey,
              ),
            ),
        prefixIcon: widget.usePrefix
            ? widget.prefixWidget ??
                Icon(widget.prefixIcon ?? Icons.text_format)
            : null,
        suffixIcon: widget.useSuffix
            ? widget.suffixWidget ??
                Icon(widget.suffixIcon ?? Icons.text_format)
            : null,
        hintText: widget.hint,
      ),
      onChanged: widget.onChanged,
      onFieldSubmitted: (value) {
        if (widget.onSubmitted != null) widget.onSubmitted!(value);
      },
    );
  }
}
