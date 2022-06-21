import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';
import 'package:im_web/widgets/primary_button.dart';
import 'package:im_web/widgets/secondary_button.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class SalesInvoiceScreen extends StatefulWidget {
  const SalesInvoiceScreen({Key? key}) : super(key: key);

  @override
  _SalesInvoiceScreenState createState() => _SalesInvoiceScreenState();
}

class _SalesInvoiceScreenState extends State<SalesInvoiceScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 31,
        header: "Sales Invoice",
        headerChildren: [
          SecondaryButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              onPress: ()=>App().setNavigation(context, AppRoutes.APP_ADD_SALES_INVOICE),
              option: "Create Sales Invoice"
          ),
          PrimaryButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              onPress: (){},
              option: "Invoice Settings"
          )
        ],
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: const [
                  Divider(color: Colors.transparent,),
                  SalesInvoiceTable()
                ],
              )
          ),
        )
    );
  }
}

class SalesInvoiceTable extends StatelessWidget {
  const SalesInvoiceTable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(defaultPadding),
      padding: EdgeInsets.all(defaultPadding),
      decoration: BoxDecoration(
          color: bright,
          borderRadius: BorderRadius.all(Radius.circular(4))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "All Time",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          SizedBox(
            width: double.infinity,
            child: DataTable(
                horizontalMargin: 0,
                columnSpacing: defaultPadding,
                columns: [
                  DataColumn(
                      label: Text("DATE")
                  ),
                  DataColumn(
                      label: Text("SALES INVOICE NO")
                  ),
                  DataColumn(
                      label: Text("PARTY NAME")
                  ),
                  DataColumn(
                      label: Text("DUE IN")
                  ),
                  DataColumn(
                      label: Text("AMOUNT")
                  ),
                  DataColumn(
                      label: Text("STATUS")
                  ),
                ],
                rows: List.generate(salesInvoiceData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(salesInvoiceData[index].date)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].no)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].party)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].due)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].amount)
                          ),
                          DataCell(
                              Text(salesInvoiceData[index].status)
                          )
                        ]
                    )
                )
            ),
          )
        ],
      ),
    );
  }
}

class SalesInvoiceData{
  final String date,no,party,due,amount,status;

  SalesInvoiceData({required this.date,required this.no,required this.party,required this.due,required this.amount,required this.status});
}

List<SalesInvoiceData> salesInvoiceData = [
  SalesInvoiceData(date: "12/12/2021",no: "11",party: "Jeeva",due: "7 days",amount: "1000",status: "Unpaid")
];