import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/modal/expenses.dart';
import 'package:im_web/widgets/elevated_icon_button.dart';
import 'package:im_web/widgets/table.dart';

import '../../constants.dart';

class ExpensesScreen extends StatefulWidget {
  const ExpensesScreen({Key? key}) : super(key: key);

  @override
  _ExpensesScreenState createState() => _ExpensesScreenState();
}

class _ExpensesScreenState extends State<ExpensesScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 6,
        header: "Expenses",
        headerChildren: [
          ElevatedIconButton(
              icon: Icons.add,
              onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_EXPENSE),
              option: "Create Expense"
          ),
        ],
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: const [
                  ExpensesTable()
                ],
              )
          ),
        )
    );
  }
}

class ExpensesTable extends StatelessWidget {
  const ExpensesTable({Key? key}) : super(key: key);

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
              "All Time",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: subtitleColor
              ),
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: IMTable.expenses(context: context, expenses: expenses)
          )
        ],
      ),
    );
  }
}




