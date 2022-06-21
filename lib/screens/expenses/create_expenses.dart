import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/widgets/primary_button.dart';
import 'package:im_web/widgets/single_select.dart';

import '../../constants.dart';

class CreateExpenses extends StatefulWidget {
  const CreateExpenses({Key? key}) : super(key: key);

  @override
  _CreateExpensesState createState() => _CreateExpensesState();
}

class _CreateExpensesState extends State<CreateExpenses> {
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 6,
        header: "Create Expenses",
        isBackPressed: true,
        headerChildren: [
          PrimaryButton(
              onPress: (){},
              option: "Save"
          ),
        ],
        screen: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    children: [
                      const Divider(color: Colors.transparent,),
                      addExpenseForm()
                    ]
                )
            )
        )
    );
  }

  Widget addExpenseForm(){
    return Form(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        color: bright,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: expenseDetails()
            ),
            const SizedBox(width: defaultPadding),
            Expanded(child: Container()
            )
          ],
        ),
      )
    );
  }

  Widget expenseDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Expense Category",style: Theme.of(context).textTheme.caption!.copyWith(
            color: textColor1),),
        const Divider(color: Colors.transparent,height: 4,),
        const SingleSelect(value: 'Business', options: ["Business","Food","Grocerry","Product","Furniture","Others"]),
        const Divider(color: Colors.transparent,),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Payment Mode",style: Theme.of(context).textTheme.caption!.copyWith(
                      color: textColor1),),
                  const Divider(color: Colors.transparent,height: 4,),
                  const SingleSelect(value: 'Cash', options: ["Cash","Cheque","Online"])
                ],
              ),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Date",style: Theme.of(context).textTheme.caption!.copyWith(
                      color: textColor1),),
                  const Divider(color: Colors.transparent,height: 4,),
                  SizedBox(
                      width: 300,
                      height: 40,
                      child: Container(
                        padding: const EdgeInsets.only(left: defaultPadding/2),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: promptColor,
                              width: 1,
                            ),
                            borderRadius: BorderRadius.circular(4)
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(App().dateFormat(date),style:Theme.of(context).textTheme.caption!.copyWith(color: textColor),),
                            IconButton(
                              icon: const Icon(Icons.date_range,color: promptColor,),
                              onPressed: ()async{
                                DateTime? picked = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime(2021),
                                  firstDate: DateTime(2021),
                                  lastDate: DateTime(2022),
                                );
                                if(picked!=date && picked!=null) {
                                  setState(() {
                                    date = picked;
                                  });
                                }
                              },
                            ),
                          ],
                        )
                      )
                  ),
                ],
              ),
            )
          ],
        ),
        const Divider(color: Colors.transparent,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Expanded(
              child: Text("Total Expense Amount",style: Theme.of(context).textTheme.subtitle2!.copyWith(
                  color: textColor),),
            ),
            const SizedBox(width: defaultPadding),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 300,
                    height: 40,
                    child: TextFormField(
                      cursorHeight: 22,
                      style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
                      decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: btnColor, width: 1.0),
                          ),
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(color: promptColor, width: 1.0),
                          ),
                          hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),
                        prefixIcon:const Padding(
                          child: Text("\u20B9"), padding: EdgeInsets.all(defaultPadding/2),
                        ),
                        prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                      ),
                    ),
                  )
                ],
              )
            )
          ],
        ),
        const Divider(color: Colors.transparent,),
        Text("Notes (Optional)",style: Theme.of(context).textTheme.caption!.copyWith(
            color: textColor1),),
        const Divider(color: Colors.transparent,height: 4,),
        SizedBox(
          width: 300,
          height: 40,
          child: TextFormField(
            cursorHeight: 22,
            style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
            decoration: InputDecoration(
                contentPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: btnColor, width: 1.0),
                ),
                enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: promptColor, width: 1.0),
                ),
                hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
            ),
          ),
        )
      ],
    );
  }
}
