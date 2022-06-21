import 'package:flutter/material.dart';
import 'package:im_web/components/sidemenu.dart';
import 'package:im_web/constants.dart';
import 'package:im_web/responsive.dart';

import 'header.dart';

class ScreenWrapper extends StatelessWidget {
  const ScreenWrapper({
    Key? key,
    required this.index,
    required this.screen,
    required this.header,
    this.headerChildren = const [],
    this.isBackPressed = false,
  }) : super(key: key);

  final int index;
  final Widget screen;
  final String header;
  final bool isBackPressed;
  final List<Widget> headerChildren;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: context.read<MenuController>().scaffoldKey,
      drawer: SideMenu(index: index,),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if(Responsive.isDesktop(context))
              Expanded(
                  child: SideMenu(index: index,)
              ),
            Expanded(
                flex: 5,
                child: SafeArea(
                  child: Column(
                    children: [
                      Header(
                        header: header,
                        headerChildren: headerChildren,
                        isBackPressed: isBackPressed,
                      ),
                      Expanded(
                        child: SingleChildScrollView(
                            child: screen,
                        ),
                      ),
                    ],
                  ),
                )
            )
          ],
        ),
      ),
    );
  }
}


