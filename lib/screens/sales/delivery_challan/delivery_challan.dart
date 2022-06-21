import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/screens/dashboard/dashboard_screen.dart';

import '../../../constants.dart';
import '../../../responsive.dart';

class DeliveryChallanScreen extends StatefulWidget {
  const DeliveryChallanScreen({Key? key}) : super(key: key);

  @override
  _DeliveryChallanScreenState createState() => _DeliveryChallanScreenState();
}

class _DeliveryChallanScreenState extends State<DeliveryChallanScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 35,
        header: "Delivery Challan",
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    color: bright,
                    padding: EdgeInsets.only(top:defaultPadding/2,bottom: defaultPadding/2,left: defaultPadding,right: defaultPadding),
                    child: Row(
                      children: [
                        if(!Responsive.isDesktop(context))
                          IconButton(
                            icon: Icon(Icons.menu),
                            onPressed: (){},
                            // onPressed: context.read<MenuController>().controlMenu,
                          ),
                        if(!Responsive.isMobile(context))
                          Text("Delivery Challan",style: Theme.of(context).textTheme.headline6!.copyWith(color: txtColor),),
                        if(!Responsive.isMobile(context))
                          Spacer(flex: Responsive.isDesktop(context) ? 2 : 1,),
                        // Expanded(
                        //     child: SearchField()
                        // ),
                        SizedBox(width: defaultPadding,),
                        ElevatedButton(
                            onPressed: (){},
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.symmetric(
                                  horizontal: defaultPadding * 1.5,
                                  vertical: defaultPadding
                              ),
                              minimumSize: Size(180,40),
                              textStyle: Theme.of(context).textTheme.caption,
                              backgroundColor: primaryColor,
                            ),
                            child: Text("Create Delivery Challan",style: Theme.of(context).textTheme.caption!.copyWith(color: txtColor),)
                        )
                      ],
                    ),
                  ),
                  SizedBox(height: defaultPadding,),
                  DeliveryChallanTable()
                ],
              )
          ),
        )
    );
  }
}

class DeliveryChallanTable extends StatelessWidget {
  const DeliveryChallanTable({Key? key}) : super(key: key);

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
                      label: Text("DELIVERY CHALLAN NO")
                  ),
                  DataColumn(
                      label: Text("PARTY NAME")
                  ),
                  DataColumn(
                      label: Text("DUE IN")
                  ),
                  DataColumn(
                      label: Text("AMOUNT")
                  )
                ],
                rows: List.generate(deliveryChallanData.length, (index) =>
                    DataRow(
                        cells: [
                          DataCell(
                              Text(deliveryChallanData[index].date)
                          ),
                          DataCell(
                              Text(deliveryChallanData[index].no)
                          ),
                          DataCell(
                              Text(deliveryChallanData[index].party)
                          ),
                          DataCell(
                              Text(deliveryChallanData[index].due)
                          ),
                          DataCell(
                              Text(deliveryChallanData[index].amount)
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

class DeliveryChallanData{
  final String date,no,party,due,amount;

  DeliveryChallanData({required this.date,required this.no,required this.party,required this.due,required this.amount});
}

List<DeliveryChallanData> deliveryChallanData = [
  DeliveryChallanData(date: "12/12/2021",no: "11",party: "Jeeva",due: "",amount: "1000")
];