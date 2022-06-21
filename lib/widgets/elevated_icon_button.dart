import 'package:flutter/material.dart';

import '../constants.dart';

class ElevatedIconButton extends StatelessWidget {
  ElevatedIconButton({
    Key? key,
    required this.icon,
    required this.onPress,
    required this.option,
    this.btnColor = const Color(0xFF247cf0),
    this.padding = const EdgeInsets.all(defaultPadding/2)
  }) : super(key: key);

  final String option;
  final IconData icon;
  final Color btnColor;
  final EdgeInsetsGeometry padding;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.symmetric(
              horizontal: defaultPadding * 1.5,
              vertical: defaultPadding
          ),
          minimumSize: const Size(180,40),
          textStyle: Theme.of(context).textTheme.caption,
          backgroundColor: btnColor,
        ),
        onPressed: onPress,
        icon: Icon(icon,size: 18,color: white,),
        label: Text(option,style: Theme.of(context).textTheme.caption!.copyWith(color: white),),
      ),
    );
  }
}