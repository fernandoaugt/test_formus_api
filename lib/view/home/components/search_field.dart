import 'package:flutter/material.dart';
import 'package:test_formus_api/helper/constants.dart';

class SearchField extends StatefulWidget {
  const SearchField(
      {super.key,
      this.controller,
      this.onChanged,
      required this.labelText,
      this.sufixIcon});
  final TextEditingController? controller;
  final void Function(String)? onChanged;
  final String labelText;
  final Widget? sufixIcon;

  @override
  State<SearchField> createState() => _SearchFieldState();
}

class _SearchFieldState extends State<SearchField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w600,
          fontSize: 14,
          decoration: TextDecoration.none,
          letterSpacing: 0.2),
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.sentences,
      textInputAction: TextInputAction.search,
      autofocus: false,
      cursorColor: Theme.of(context).primaryTextTheme.bodyLarge?.color,
      controller: widget.controller,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(18),
        fillColor: Constants.backgroundColor,
        filled: true,
        isDense: true,
        labelText: widget.labelText,
        labelStyle: TextStyle(
            fontSize: 16,
            color: Constants.fontColor,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.2),
        enabledBorder: OutlineInputBorder(
          borderRadius: const BorderRadius.all(Radius.circular(16)),
          borderSide: BorderSide(
            width: 0,
            color: Constants.suportFontColor,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16),
          borderSide: BorderSide(color: Constants.suportFontColor),
        ),
        suffixIcon: widget.sufixIcon,
      ),
    );
  }
}
