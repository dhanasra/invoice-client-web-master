import 'package:flutter/material.dart';

import '../constants.dart';

class SecondaryButton extends StatelessWidget {
  const SecondaryButton({
    Key? key,
    required this.onPress,
    required this.option,
    this.padding = const EdgeInsets.all(defaultPadding/2)
  }) : super(key: key);

  final String option;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: padding,
        child: OutlinedButton(
            onPressed: onPress,
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical: defaultPadding
              ),
              side:BorderSide(color: btnColor),
              minimumSize: Size(180,40),
            ),
            child: Text(option,style: Theme.of(context).textTheme.caption!.copyWith(color: btnColor),)
        )
    );
  }
}