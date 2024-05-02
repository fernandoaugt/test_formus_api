import 'package:flutter/material.dart';

class SnackBarCustom extends StatelessWidget {
  const SnackBarCustom({super.key, required this.title});
  final String title;
  @override
  Widget build(BuildContext context) {
    return SnackBar(
      content: Text(title),
      action: SnackBarAction(
        label: 'Undo',
        onPressed: () {
          // Some code to undo the change.
        },
      ),
    );
  }
}
