import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/components/screen_wrapper.dart';
import 'package:im_web/widgets/primary_button.dart';
import 'package:im_web/widgets/secondary_button.dart';
import 'package:im_web/widgets/single_select.dart';

import '../../constants.dart';

class CreateParty extends StatefulWidget {
  const CreateParty({Key? key}) : super(key: key);

  @override
  _CreatePartyState createState() => _CreatePartyState();
}

class _CreatePartyState extends State<CreateParty> {

  @override
  Widget build(BuildContext context) {
    return ScreenWrapper(
        index: 1,
        header: "Create Party",
        headerChildren: [
          SecondaryButton(
              padding: const EdgeInsets.only(left:defaultPadding/2),
              onPress: (){},
              option: "Save & New"
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
                addPartyForm()
              ],
            ),
          ),
        )
    );
  }

  Widget addPartyForm(){
    return Form(
      child: Container(
        padding: const EdgeInsets.all(defaultPadding),
        color: bright,
        child: Column(
          children: [
             Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Party Name",style: Theme.of(context).textTheme.caption!.copyWith(
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
                              hintText: "Enter Name",
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
                      Text("Mobile Number",style: Theme.of(context).textTheme.caption!.copyWith(
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
                              hintText: "Enter Mobile Number",
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
                      Text("Email",style: Theme.of(context).textTheme.caption!.copyWith(
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
                              hintText: "Enter Email",
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
                      Text("Opening Balance",style: Theme.of(context).textTheme.caption!.copyWith(
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
                          const SingleSelect(value: "To Pay", options: ["To Pay","To Collect"],width: 120,isTextInputAdded: true,),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            const Divider(),
            Row(
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Party Type",style: Theme.of(context).textTheme.caption!.copyWith(
                        color: textColor1),),
                    const Divider(color: Colors.transparent,height: 4,),
                    const SingleSelect(value: "Customer",options: ["Customer","Supplier"],),
                  ],
                ),
                const SizedBox(width:defaultPadding),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("GSTIN",style: Theme.of(context).textTheme.caption!.copyWith(
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
                            hintText: "ex: 29xxxxxxx99189",
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
                    Text("Place of supply",style: Theme.of(context).textTheme.caption!.copyWith(
                        color: textColor1),),
                    const Divider(color: Colors.transparent,height: 4,),
                    const SingleSelect(value: "Tamil nadu",options: ["Tamil nadu","Bangalore","Gujarat","Gova","Delhi","Mumbai","Kerala"],),
                  ],
                )
              ],
            ),
            const Divider(color:Colors.transparent),
            Row(
              children: [
                Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Billing Address",style: Theme.of(context).textTheme.caption!.copyWith(
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
                              hintText: "Enter billing address",
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
                      Text("Shipping Address",style: Theme.of(context).textTheme.caption!.copyWith(
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
                              hintText: "Enter shipping address",
                              hintStyle: Theme.of(context).textTheme.caption!.copyWith(color: textColor1)
                          ),
                        ),
                      )
                    ],
                  ),
              ],
            )
          ],
        ),
      )
    );
  }
}
