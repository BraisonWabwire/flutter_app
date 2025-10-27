import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomButton extends StatelessWidget {
  final Color backgroundColor;
  final Color borderColor;
  final Color textColor;
  final String? text;
  double size;
  IconData? icon;
  bool? isIcon;

  CustomButton({
    super.key,
    required this.backgroundColor,
    required this.borderColor,
    required this.textColor,
    this.text,
    required this.size,
    this.icon,
    this.isIcon = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(color: borderColor, width: 1.0),
      ),
      child: Center(
        child: isIcon==false?Text(text ?? "", style: TextStyle(color: textColor)):Icon(icon, color: textColor),
      ),
    );
  }
}
