import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/constants.dart';
import 'package:im_web/modal/transactions.dart';
import 'package:im_web/responsive.dart';
import 'package:im_web/widgets/chart.dart';
import 'package:im_web/widgets/elevated_icon_button.dart';
import 'package:im_web/widgets/table.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 0,
        header: "Dashboard",
        screen: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: defaultPadding,),

            if(Responsive.isDesktop(context))
            Padding(
              padding: EdgeInsets.only(
                  left: defaultPadding / 2, right: defaultPadding / 2),
              child:

              Wrap(children: [
                ElevatedIconButton(
                    icon: Icons.sell_outlined,
                    onPress: () =>
                        App().setNavigation(
                            context, AppRoutes.APP_ADD_SALES_INVOICE),
                    option: "Create Invoice"
                ),
                ElevatedIconButton(
                    icon: Icons.shopping_cart_outlined,
                    onPress: () =>
                        App().setNavigation(
                            context, AppRoutes.APP_ADD_PURCHASE_INVOICE),
                    option: "Create Purchase"
                ),
                ElevatedIconButton(
                    icon: Icons.notes_outlined,
                    onPress: () =>
                        App().setNavigation(
                            context, AppRoutes.APP_ADD_QUOTATION),
                    option: "Create Quotation"
                ),
                ElevatedIconButton(
                    icon: Icons.subdirectory_arrow_left_outlined,
                    onPress: () =>
                        App().setNavigation(
                            context, AppRoutes.APP_ADD_PAYMENT_IN),
                    option: "Record Payment In"
                ),
                ElevatedIconButton(
                    icon: Icons.add_box_outlined,
                    onPress: () =>
                        App().setNavigation(context, AppRoutes.APP_ADD_ITEM),
                    option: "Create Item"
                ),
              ],),
            ),
            SizedBox(height: defaultPadding,),
            Padding(
              padding: EdgeInsets.only(
                  left: defaultPadding, right: defaultPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                      flex: 5,
                      child: Column(
                        children: [
                          LatestTransactions(),
                          if(Responsive.isMobile(context))
                            SizedBox(height: defaultPadding,),
                          if(Responsive.isMobile(context))
                            TransactionsSummary()
                        ],
                      )
                  ),
                  if(!Responsive.isMobile(context))
                    SizedBox(width: defaultPadding,),
                  if(!Responsive.isMobile(context))
                    Expanded(
                        flex: 2,
                        child: TransactionsSummary()
                    )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.all(defaultPadding),
              child: SizedBox(
                  width: Responsive.isDesktop(context)?800:double.infinity,
                  child: Container(
                      padding: EdgeInsets.all(defaultPadding),
                      decoration: BoxDecoration(
                          color: white,
                          border: Border.all(color: borderColor),
                          borderRadius: const BorderRadius.all(
                              Radius.circular(4))
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Sales Report 15 Dec 2021 to 21 Dec 2021",
                            style: Theme
                                .of(context)
                                .textTheme
                                .subtitle2!
                                .copyWith(
                                color: subtitleColor
                            ),),
                          Container(
                              margin: EdgeInsets.only(top: defaultPadding / 2,
                                  bottom: defaultPadding),
                              width: double.infinity,
                              color: borderColor,
                              height: 1
                          ),
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(
                                width: Responsive.isDesktop(context)?550:MediaQuery.of(context).size.width-300,
                                height: 250,
                                child: Chart(),
                              ),
                              SizedBox(
                                width: 200,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text("Last 7 days Sales", style: Theme
                                        .of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        color: subtitleColor
                                    ),), SizedBox(height: 10),
                                    Text("\u20B9 0.0", style: Theme
                                        .of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        color: textColor
                                    ),), SizedBox(height: 10),
                                    Text("Invoice Made", style: Theme
                                        .of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        color: subtitleColor
                                    ),), SizedBox(height: 10),
                                    Text("0", style: Theme
                                        .of(context)
                                        .textTheme
                                        .subtitle2!
                                        .copyWith(
                                        color: textColor
                                    ),),
                                  ],
                                ),
                              )
                            ],
                          )
                        ],
                      )
                  ),
                  height: 340
              ),
            ),
            SizedBox(
                height: 30
            )
          ],
        )
    );
  }
}

class InfoCard extends StatelessWidget {
  final IconData icon;
  final String title, count,amount;

  const InfoCard({
    Key? key,
    required this.icon,
    required this.title,
    required this.count,
    required this.amount
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
        onTap: (){},
        tileColor: white,
        title: Text(title, maxLines: 1, overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.subtitle2!.copyWith(
              color:subtitleColor,
          ),
        ),
        subtitle: Text(count, style: Theme.of(context).textTheme.caption!.copyWith(
              color:textColor1
          ),
        ),
        trailing: Text(amount, style: Theme.of(context).textTheme.caption!.copyWith(
            color:textColor
          ),
        ),
        leading: SizedBox(width: 20, height: 20, child: Icon(icon,color: iconColor1,size: 18,),),
    );
  }
}

class TransactionsSummary extends StatelessWidget {
  const TransactionsSummary({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          border: Border.all(color: borderColor),
          borderRadius: const BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          InfoCard(
              icon: Icons.shopping_cart_rounded,
              title: "To Collect",
              count: "Invoices & Payment In",
              amount: "1,500"),
          InfoCard(
              icon: Icons.sell,
              title: "To Pay",
              count: "Purchases & Payement Out",
              amount: "23,500"),
          InfoCard(
              icon: Icons.attach_money_rounded,
              title: "Cash + Bank",
              count: "in cash",
              amount: "500"),
          InfoCard(
              icon: Icons.all_inbox,
              title: "Stock Value",
              count: "Total stock worth",
              amount: "55,000"),
          InfoCard(
              icon: Icons.inbox,
              title: "Low Stock",
              count: "Below 10 stocks",
              amount: "0 Items"),
        ],
      ),
    );
  }
}


class RecentTransactions extends StatelessWidget {
  const RecentTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

class LatestTransactions extends StatelessWidget {
  const LatestTransactions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4)),
          border: Border.all(color: borderColor)
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(defaultPadding),
            child: Text(
              "Recent Transactions",
              style: Theme.of(context).textTheme.subtitle1!.copyWith(
                color: subtitleColor
              ),
            ),
          ),
          SizedBox(
            width: double.infinity,
            child: IMTable.recentTransactions(context: context, transactions: transactions)
          )
        ],
      ),
    );
  }
}
