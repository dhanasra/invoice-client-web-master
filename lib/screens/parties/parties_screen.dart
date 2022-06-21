import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/modal/parties.dart';
import 'package:im_web/widgets/elevated_icon_button.dart';
import 'package:im_web/widgets/table.dart';

import '../../constants.dart';

class PartiesScreen extends StatefulWidget {
  const PartiesScreen({Key? key}) : super(key: key);

  @override
  _PartiesScreenState createState() => _PartiesScreenState();
}

class _PartiesScreenState extends State<PartiesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 1,
        header: "Parties",
        headerChildren: [
          ElevatedIconButton(
              icon: Icons.add,
              onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_PARTY),
              option: "Create Party"
          ),
        ],
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: const [
                  PartiesTable()
                ],
              )
          ),
        )
    );
  }
}

class PartiesTable extends StatelessWidget {
  const PartiesTable({Key? key}) : super(key: key);

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
              "All Parties",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: subtitleColor
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: IMTable.parties(context: context, parties: parties)
          )
        ],
      ),
    );
  }
}


