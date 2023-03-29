import 'package:flutter/material.dart';

class AppErrorWidget extends StatelessWidget {
  const AppErrorWidget(this.errorText, {super.key});
  final String errorText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        errorText,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
