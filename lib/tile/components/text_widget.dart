import 'package:atom/gen/colors.gen.dart';
import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  const TextWidget({
    super.key,
    required this.value,
  });

  final String value;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Expanded(
      child: Center(
        child: Text(
          value,
          style: textTheme.headlineMedium!.copyWith(
            fontWeight: FontWeight.w600,
            color: ColorName.XBlack,
          ),
        ),
      ),
    );
  }
}
