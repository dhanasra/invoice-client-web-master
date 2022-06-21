import 'package:flutter/material.dart';

import '../constants.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
      child: ElevatedButton(
          onPressed: (){},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(
                horizontal: defaultPadding * 1.5,
                vertical: defaultPadding
            ),
            minimumSize: Size(180,40),
            textStyle: Theme.of(context).textTheme.caption,
            backgroundColor: btnColor,
          ),
          child: Text(option,style: Theme.of(context).textTheme.caption!.copyWith(color: white),)
      )
    );
  }
}