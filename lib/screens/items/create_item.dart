import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/widgets/primary_button.dart';
import 'package:im_web/widgets/secondary_button.dart';
import 'package:im_web/widgets/single_select.dart';
import 'package:im_web/widgets/tags_radio.dart';

import '../../constants.dart';

class CreateItem extends StatefulWidget {
  const CreateItem({Key? key}) : super(key: key);

  @override
  _CreateItemState createState() => _CreateItemState();
}

class _CreateItemState extends State<CreateItem> {
  var lowStockWarning = false;
  var date = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 4,
        header: "Create Item",
        headerChildren: [
          SecondaryButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              onPress: (){},
              option: "Item Settings"
          ),
          PrimaryButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              onPress: (){},
              option: "Save"
          )
        ],
        isBackPressed: true,
        screen: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Divider(color: Colors.transparent,),
                addItemForm()
              ],
            ),
          ),
        )
    );
  }

  Widget addItemForm(){
    return Form(
        child: Container(
          padding: const EdgeInsets.all(defaultPadding),
          color: bright,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    generalDetails()
                  ],
                ),
              ),
              const SizedBox(width: defaultPadding),
              Expanded(child: Column(
                children: [
                  stockDetails(),
                  pricingDetails(),
                ],
              ),
              )
            ],
          ),
        )
    );
  }

  Widget generalDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(defaultPadding/2),
          color: highlightColor,
          child: Row(
            children: [
              Text("General Details",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
            ],
          )
        ),
        const Divider(color: Colors.transparent),
        Text("Item Type", style: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),),
        const Divider(color: Colors.transparent,height: 8,),
        TagsRadio(tags: const ["Product","Service"], selected: (val){}),
        const Divider(color: Colors.transparent,),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Name",style: Theme.of(context).textTheme.caption!.copyWith(
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
                        hintText: "Enter Item Name",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                    ),
                  ),
                )
              ],
            ),
            const SizedBox(width:defaultPadding),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Code",style: Theme.of(context).textTheme.caption!.copyWith(
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
                        hintText: "Enter Item Code",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
        const Divider(color:Colors.transparent),
        Row(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Item Description",style: Theme.of(context).textTheme.caption!.copyWith(
                    color: textColor1),),
                const Divider(color: Colors.transparent,height: 4,),
                SizedBox(
                  width: 300,
                  height: 110,
                  child: TextFormField(
                    cursorHeight: 22,
                    maxLines: 5,
                    style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
                    decoration: InputDecoration(
                        contentPadding: const EdgeInsets.only(left:defaultPadding/2,right:defaultPadding/2,top:defaultPadding,bottom: defaultPadding),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: btnColor, width: 1.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: promptColor, width: 1.0),
                        ),
                        hintText: "Enter item description",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                    ),
                  ),
                )
              ],
            ),
          ],
        )
      ],
    );
  }

  Widget stockDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            padding: const EdgeInsets.all(defaultPadding/2),
            color: highlightColor,
            child: Row(
              children: [
                Text("Stock Details",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
              ],
            )
        ),
        const Divider(color: Colors.transparent),
      Row(
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Unit",style: Theme.of(context).textTheme.caption!.copyWith(
                  color: textColor1),),
              const Divider(color: Colors.transparent,height: 4,),
              const SingleSelect(value: "PCS",options: ["Kgs","PCS","mg","g"],)
            ],
          ),
        ],
      ),
    const Divider(color: Colors.transparent,),
      Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Opening Stock",style: Theme.of(context).textTheme.caption!.copyWith(
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
                        hintText: "0",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                    ),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(width: defaultPadding,),
          Expanded(child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("As of Date",style: Theme.of(context).textTheme.caption!.copyWith(
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
          ),
        ],
      ),
        const Divider(color: Colors.transparent,),
      Row(
        children: [
          Expanded(child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text("Low Stock Warning",style: Theme.of(context).textTheme.caption!.copyWith(
                  color: textColor1),),
              SizedBox(
                width: 100,
                height: 70,
                child: Switch(
                      onChanged: (bool value) {
                          setState(() {
                            lowStockWarning = value;
                          });
                      }, value: lowStockWarning,
                  )
              )],
          ),),
          const SizedBox(width: defaultPadding,),
          Expanded(child: Visibility(
            visible: lowStockWarning,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Low Stock Units",style: Theme.of(context).textTheme.caption!.copyWith(
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
                        hintText: "Enter low stock units",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                    ),
                  ),
                )
              ],
            ),
          ),),
        ],
      )
    ],);
  }

  Widget pricingDetails(){
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(color: Colors.transparent),
        Container(
            padding: const EdgeInsets.all(defaultPadding/2),
            color: highlightColor,
            child: Row(
              children: [
                Text("Pricing Details",style: Theme.of(context).textTheme.subtitle2!.copyWith(color: txtColor),),
              ],
            )
        ),
        const Divider(color: Colors.transparent),
        Row(
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Sales Price",style: Theme.of(context).textTheme.caption!.copyWith(
                    color: textColor1),),
                const Divider(color: Colors.transparent,height: 4,),
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextFormField(
                        cursorHeight: 22,
                        style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: btnColor, width: 1.0),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: promptColor, width: 1.0),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                          ),
                          hintText: "0",
                          hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),
                          prefixIcon:const Padding(
                            child: Text("\u20B9"), padding: EdgeInsets.all(defaultPadding/2),
                          ),
                          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                        ),
                      ),
                    ),
                    const SingleSelect(value: "With Tax", options: ["With Tax","Without Tax"],width: 120,isTextInputAdded: true,),
                  ],
                )
              ],
            ),
            ),
            const SizedBox(width: defaultPadding,),
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Purchase Price",style: Theme.of(context).textTheme.caption!.copyWith(
                    color: textColor1),),
                const Divider(color: Colors.transparent,height: 4,),
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextFormField(
                        cursorHeight: 22,
                        style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: btnColor, width: 1.0),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: promptColor, width: 1.0),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                          ),
                          hintText: "0",
                          hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),
                          prefixIcon:const Padding(
                            child: Text("\u20B9"), padding: EdgeInsets.all(defaultPadding/2),
                          ),
                          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                        ),
                      ),
                    ),
                    const SingleSelect(value: "With Tax", options: ["With Tax","Without Tax"],width: 120,isTextInputAdded: true,),
                  ],
                )
              ],
            ),
            ),
          ],
        ),
        const Divider(color: Colors.transparent,),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("MRP",style: Theme.of(context).textTheme.caption!.copyWith(
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
                    hintText: "0",
                    hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),
                  prefixIcon:const Padding(
                    child: Text("\u20B9"), padding: EdgeInsets.all(defaultPadding/2),
                  ),
                  prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                ),
              ),
            )
          ],
        ),
        const Divider(color: Colors.transparent,),
        Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("HSN Code",style: Theme.of(context).textTheme.caption!.copyWith(
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
                          hintText: "Enter HSN Code",
                          hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                      ),
                    ),
                  )
                ],
              ),
            ),
            const SizedBox(width: defaultPadding,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("GST Tax Rate",style: Theme.of(context).textTheme.caption!.copyWith(
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
                          hintText: "Tax Rate",
                          hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
        const Divider(color: Colors.transparent,),
        Row(
          children: [
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wholesale Price",style: Theme.of(context).textTheme.caption!.copyWith(
                    color: textColor1),),
                const Divider(color: Colors.transparent,height: 4,),
                Row(
                  children: [
                    SizedBox(
                      width: 180,
                      height: 40,
                      child: TextFormField(
                        cursorHeight: 22,
                        style: Theme.of(context).textTheme.caption!.copyWith(color: textColor),
                        decoration: InputDecoration(
                          contentPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: btnColor, width: 1.0),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                          ),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: promptColor, width: 1.0),
                              borderRadius: BorderRadius.only(topLeft: Radius.circular(4),bottomLeft: Radius.circular(4))
                          ),
                          hintText: "0",
                          hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1),
                          prefixIcon:const Padding(
                            child: Text("\u20B9"), padding: EdgeInsets.all(defaultPadding/2),
                          ),
                          prefixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
                        ),
                      ),
                    ),
                    const SingleSelect(value: "With Tax", options: ["With Tax","Without Tax"],width: 120,isTextInputAdded: true,),
                  ],
                )
              ],
            ),
            ),
            const SizedBox(width: defaultPadding,),
            Expanded(child:
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text("Wholesale Quantity",style: Theme.of(context).textTheme.caption!.copyWith(
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
                        hintText: "Enter minimum quanitity",
                        hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                    ),
                  ),
                )
              ],
            ),
            ),
          ],
        ),
      ],
    );
  }
}
