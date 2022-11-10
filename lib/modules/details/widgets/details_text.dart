import 'package:flutter/material.dart';

class DetailsText extends StatelessWidget {
  final String keey;
  final String value;
  const DetailsText({
    Key? key,
    required this.keey,
    required this.value,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RichText(
      text: TextSpan(
        text: keey,
        style: Theme.of(context).textTheme.headline6!.copyWith(
              fontWeight: FontWeight.w500,
              height: 1.7,
            ),
        children: [
          TextSpan(
            text: value,
            style: Theme.of(context).textTheme.headline6!.copyWith(
                  fontWeight: FontWeight.w300,
                ),
          ),
        ],
      ),
    );
  }
}
