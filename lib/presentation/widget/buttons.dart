import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  const DefaultButton(
      {super.key,
      required this.onPressed,
      required this.text,
      this.textColor = Colors.black,
      this.radius = 0,
      this.buttonColor,
      this.width,
      this.height,
      this.elevation = 0,
      this.style,
      this.shadowColor});
  final Color? shadowColor;
  final String text;
  final VoidCallback? onPressed;
  final Color? textColor;
  final double? radius;
  final double? width;
  final double? height;
  final Color? buttonColor;
  final TextStyle? style;
  final double? elevation;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            shadowColor: shadowColor,
            elevation: elevation,
            padding: EdgeInsets.zero,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!))),
        onPressed: onPressed,
        child: Text(
          text,
          style: style ??
              Theme.of(context)
                  .textTheme
                  .titleMedium!
                  .copyWith(color: textColor),
        ),
      ),
    );
  }
}

class OutlinedButton extends StatelessWidget {
  const OutlinedButton(
      {super.key,
      required this.text,
      required this.onPressed,
      required this.textColor,
      this.radius = 10,
      this.elevation = 0,
      this.buttonColor,
      this.outlineColor = Colors.black});
  final String text;
  final VoidCallback onPressed;
  final Color textColor;
  final double? radius;
  final Color? buttonColor;
  final Color? outlineColor;
  final double? elevation;
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          elevation: elevation,
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(radius!),
              side: BorderSide(color: outlineColor!, width: 1))),
      onPressed: onPressed,
      child: Text(
        text,
        style:
            Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
      ),
    );
  }
}

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width,
    this.height,
    required this.widget,
    this.buttonColor,
    this.radius = 0,
    required this.onPressed,
    this.elevation = 0,
  });
  final double? width;
  final double? height;
  final Widget widget;
  final Color? buttonColor;
  final double? radius;
  final double? elevation;
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
      height: height,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
            elevation: elevation,
            backgroundColor: buttonColor,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(radius!))),
        onPressed: onPressed,
        child: widget,
        
      ),
    );
  }
}

class TextButton extends StatelessWidget {
  const TextButton(
      {super.key,
      required this.text,
      required this.onPressed,
      this.textColor = Colors.black,
      this.style});
  final String text;
  final VoidCallback onPressed;
  final Color? textColor;
  final TextStyle? style;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Text(
        text,
        style: style ??
            Theme.of(context).textTheme.titleMedium!.copyWith(color: textColor),
      ),
    );
  }
}