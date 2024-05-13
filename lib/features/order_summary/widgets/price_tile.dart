import 'package:flutter/material.dart';
import 'package:myapp/core/extensions/context_extension.dart';

class PriceTile extends StatelessWidget {
  final String title;
  final double price;
  final TextStyle? style;
  const PriceTile(
      {super.key, required this.title, required this.price, this.style});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Text(
            title,
            style: context.bodyText200.copyWith(
              color: const Color(0xff666666),
            ),
          ),
        ),
        Text(
          "\$$price",
          style: style ?? context.headline300,
        )
      ],
    );
  }
}
