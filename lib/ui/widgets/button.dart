import 'package:flutter/material.dart';
import 'package:todo_app/ui/theme.dart';

class MyButton extends StatelessWidget {
  const MyButton({
    Key? key,
    required this.label,
    required this.onTap,
  }) : super(key: key);

  final String label;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap, // Handle tap events
      child: Container(
        width: 100,
        height: 45,
        decoration: BoxDecoration(
          color: primaryClr, // Set the background color for the button
          borderRadius: BorderRadius.circular(8), // Add rounded corners
        ),
        alignment: Alignment.center, // Center the text
        child: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 16,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
