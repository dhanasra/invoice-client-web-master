import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/modal/items.dart';
import 'package:im_web/widgets/elevated_icon_button.dart';
import 'package:im_web/widgets/table.dart';

import '../../constants.dart';

class ItemsScreen extends StatefulWidget {
  const ItemsScreen({Key? key}) : super(key: key);

  @override
  _ItemsScreenState createState() => _ItemsScreenState();
}

class _ItemsScreenState extends State<ItemsScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 4,
        header: "Items",
        headerChildren: [
          ElevatedIconButton(
              icon: Icons.add,
              onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_ITEM),
              option: "Create Items"
          ),
        ],
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: const [
                  ItemsTable()
                ],
              )
          ),
        )
    );
  }
}

class ItemsTable extends StatelessWidget {
  const ItemsTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bright,
          borderRadius: const BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: borderColor)
      ),
      margin: const EdgeInsets.all(defaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "All Items",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: subtitleColor
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: IMTable.items(context: context, items: items)
          )
        ],
      ),
    );
  }
}


