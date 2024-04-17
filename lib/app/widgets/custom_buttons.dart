import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.onPress,
    this.text,
    this.fullWidthButton = true,
    this.color,
    this.textColor,
  });

  final Function()? onPress;
  final String? text;
  final bool fullWidthButton;
  final Color? color;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return GFButton(
      onPressed: onPress,
      text: text,
      color: color ?? Get.theme.primaryColor,
      textColor: textColor ?? GFColors.LIGHT,
      fullWidthButton: fullWidthButton,
    );
  }
}
