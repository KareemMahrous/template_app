import 'package:flutter/material.dart';

class DefaultText extends StatelessWidget {
  final String data;
  final TextStyle? style;
  final TextAlign? textAlign;
  final TextOverflow? overflow;
  final int? maxLines;

  const DefaultText(
    this.data, {
    super.key,
    this.style,
    this.textAlign,
    this.overflow,
    this.maxLines,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      data,
      style: style,
      textAlign: textAlign,
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}
