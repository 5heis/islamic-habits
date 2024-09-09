import 'package:flutter/material.dart';

class MyFloatingActionButton extends StatelessWidget {
  final Function()? onPressed;

  const MyFloatingActionButton({
    super.key,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Color.fromARGB(255, 2, 179, 8),
      foregroundColor: Colors.white,
      onPressed: onPressed,
      child: Icon(Icons.add),
    );
  }
}
