import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/modal/cash_bank.dart';
import 'package:im_web/widgets/elevated_icon_button.dart';
import 'package:im_web/widgets/primary_button.dart';
import 'package:im_web/widgets/secondary_button.dart';
import 'package:im_web/widgets/table.dart';
import 'package:im_web/widgets/tags_radio.dart';

import '../../constants.dart';
import '../../responsive.dart';

class CashBankScreen extends StatefulWidget {
  const CashBankScreen({Key? key}) : super(key: key);

  @override
  _CashBankScreenState createState() => _CashBankScreenState();
}

class _CashBankScreenState extends State<CashBankScreen> {
  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 5,
        header: "Cash & Bank",
        headerChildren: [
          ElevatedIconButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              icon: Icons.remove,
              btnColor: btnColor2,
              onPress: (){
                showDialog(context: context,
                    builder: (context){
                      return Dialog(
                          child: Stack(
                            children: const [
                              AddOrReduceMoney(type: "REMOVE",),
                            ],
                          )
                      );
                    }
                );
              },
              option: "Reduce Money"
          ),
          ElevatedIconButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              icon: Icons.add,
              onPress: (){
                showDialog(context: context,
                    builder: (context){
                      return Dialog(
                          child: Stack(
                            children: const [
                              AddOrReduceMoney(type: "ADD",),
                            ],
                          )
                      );
                    }
                );
              },
              option: "Add Money"
          ),
        ],
        screen: SafeArea(
          child: SingleChildScrollView(
              child: Column(
                children: const [
                  CashBankTable()
                ],
              )
          ),
        )
    );
  }
}

class CashBankTable extends StatelessWidget {
  const CashBankTable({Key? key}) : super(key: key);

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
              child: IMTable.cashBank(context: context, cashBank: cashBank)
          )
        ],
      ),
    );
  }
}

class AddOrReduceMoney extends StatefulWidget {
  const AddOrReduceMoney({
    Key? key,
    required this.type
  }) : super(key: key);
  final String type;


  @override
  _AddOrReduceMoneyState createState() => _AddOrReduceMoneyState();
}

class _AddOrReduceMoneyState extends State<AddOrReduceMoney> {
  String newBalance = "";
  var dateVisible = false;
  DateTime date=DateTime.now();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 500,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [Container(
            padding: const EdgeInsets.only(top:defaultPadding/2,left:defaultPadding,right:defaultPadding),
            child:
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(widget.type=="ADD"?"Add Money":"Reduce Money",
                  style: Theme.of(context).textTheme.subtitle2!.copyWith(
                      color: titleColor),
                ),
                IconButton(
                    splashRadius: 20,
                    onPressed: ()=>Navigator.pop(context), icon: const Icon(Icons.close,color: txtColor,)),
              ],
            ),),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              child: SizedBox(
                height: 400,
                child: Stack(
                  children: [
                    ListView(
                      shrinkWrap: true,
                      children: [
                        Text(widget.type=="ADD"?"Add Money In":"Reduce Money In",
                          style: Theme.of(context).textTheme.caption!.copyWith(
                              color: textColor1),
                        ),
                        const Divider(color: Colors.transparent,height: 8,),
                        TagsRadio(tags: const ["Cash","Bank"], selected: (val){}),
                        const Divider(color: Colors.transparent),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Current Balance",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: textColor1),
                                  ),
                                  const Divider(color: Colors.transparent,height: 4,),
                                  Text("\u20b9 33,000",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: textColor),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Date",
                                    style: Theme.of(context).textTheme.caption!.copyWith(
                                        color: textColor1),
                                  ),
                                  const Divider(color: Colors.transparent,height: 4,),
                                  Row(
                                    children: [
                                      Text(App().dateFormat(date),
                                        style: Theme.of(context).textTheme.caption!.copyWith(
                                            color: textColor),
                                      ),
                                      const Spacer(),
                                      InkWell(
                                        child: Icon(dateVisible?Icons.close:Icons.date_range,color: promptColor,size: 20,),
                                        onTap: (){
                                          setState(() {
                                            dateVisible = !dateVisible;
                                          });
                                        }
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                        const Divider(color: Colors.transparent,height: defaultPadding,),
                        Text("Enter Amount",style: Theme.of(context).textTheme.caption!.copyWith(
                            color: textColor1),),
                        const Divider(color: Colors.transparent,height: 4,),
                        SizedBox(
                          width: 300,
                          height: 40,
                          child: TextFormField(
                            style: Theme.of(context).textTheme.subtitle2!.copyWith(color: textColor),
                            decoration: InputDecoration(
                                prefixIcon: widget.type=="ADD"?const Icon(Icons.add,color: Colors.green,):const Icon(Icons.remove,color: Colors.red,),
                                contentPadding: const EdgeInsets.only(top:defaultPadding/2),
                                hintText: "0",
                                focusedBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: btnColor, width: 1.0),
                                ),
                                enabledBorder: const UnderlineInputBorder(
                                  borderSide: BorderSide(color: promptColor, width: 1.0),
                                ),
                                hintStyle: Theme.of(context).textTheme.subtitle2!.copyWith(color: textColor1)
                            ),
                            onChanged: (val){
                              setState(() {
                                newBalance = val;
                              });
                            },
                          ),
                        ),
                        Visibility(
                            visible: newBalance.isNotEmpty,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Divider(color: Colors.transparent,height: defaultPadding,),
                                Text("New Balance",style: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),),
                                Text(newBalance,style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),),
                              ],
                            )
                        ),
                        const Divider(color: Colors.transparent,height: defaultPadding,),
                        Text("Remarks",style: Theme.of(context).textTheme.caption!.copyWith(
                            color: textColor1),),
                        const Divider(color: Colors.transparent,height: 4,),
                        SizedBox(
                          width: 300,
                          height: 80,
                          child: TextFormField(
                            maxLines: 5,
                            style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
                            decoration: InputDecoration(
                                contentPadding: const EdgeInsets.only(
                                    top : defaultPadding*0.65,
                                    bottom : defaultPadding*0.65,
                                    left : defaultPadding/2,
                                    right : defaultPadding/2
                                ),
                                focusedBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: btnColor, width: 1.0),
                                ),
                                enabledBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: promptColor, width: 1.0),
                                ),
                                hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                            ),
                          ),
                        ),
                      ],
                    ),
                    Visibility(
                      visible: dateVisible,
                      child: Positioned(
                        right: 0,
                        top: 140,
                        child: Container(
                            decoration: BoxDecoration(
                                color:white,
                                border: Border.all(color: promptColor),
                                borderRadius: const BorderRadius.all(Radius.circular(4))
                            ),
                            child: CalendarDatePicker(
                              firstDate: DateTime(2021),
                              onDateChanged: (DateTime value) {
                                setState(() {
                                  date = value;
                                });
                              },
                              initialDate: DateTime(2021),
                              lastDate: DateTime(2022),
                            ),
                            width: 300,
                            height: 200
                        ),
                      ),
                    )
                  ],
                )
              ),
            ),
            const Divider(),
            Container(
              padding: const EdgeInsets.all(defaultPadding),
              child:
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SecondaryButton(
                      padding: const EdgeInsets.only(left:defaultPadding/2),
                      onPress: ()=>Navigator.pop(context),
                      option: "Cancel"
                  ),
                  PrimaryButton(
                      padding: const EdgeInsets.only(left:defaultPadding/2),
                      onPress: (){},
                      option: "Save"
                  )
                ],
              ),)
          ],
        )
    );
  }
}

