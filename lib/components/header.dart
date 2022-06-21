import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/controllers/menu_controller.dart';

import '../constants.dart';
import '../responsive.dart';
import 'package:provider/provider.dart';

class Header extends StatelessWidget {
  const Header({
    Key? key,
    required this.headerChildren,
    required this.header,
    required this.isBackPressed,
  }) : super(key: key);
  final String header;
  final List<Widget> headerChildren;
  final bool isBackPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: Colors.black54,
                blurRadius: 4.0,
                offset: Offset(0.0, 0.75)
            )
          ],
        color: bright,
      ),
      height: 55,
      padding: EdgeInsets.only(left:defaultPadding,right:defaultPadding),
      child: Row(
        children: [
          isBackPressed
              ?IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: ()=>App().setBackNavigation(context),
          ):!Responsive.isDesktop(context)?
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: context.read<MenuController>().controlMenu,
          ):Container(),
          Text(header,style: Theme.of(context).textTheme.headline6!.copyWith(color: titleColor),),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: headerChildren,
            ),
          )
        ],
      ),
    );
  }
}