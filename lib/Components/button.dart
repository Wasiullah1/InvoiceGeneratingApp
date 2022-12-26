import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;
  final VoidCallback onPress;
  const Button({required this.title, required this.onPress});

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(20),
      clipBehavior: Clip.antiAlias,
      child: MaterialButton(
          color: Colors.blue.shade400,
          minWidth: double.infinity,
          height: 40,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
          onPressed: onPress),
    );
  }
}
