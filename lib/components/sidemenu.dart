import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:im_web/app/app.dart';
import 'package:im_web/app/app_routes.dart';
import 'package:im_web/constants.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
    required this.index
  }) : super(key: key);
  final int index;

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: primaryColor,
        child: SingleChildScrollView(
            child: Column(
              children: [
                DrawerHeader(
                  padding: EdgeInsets.only(top:10),
                    child: Column(
                        children: [
                          ListTile(
                            title: Text("Spiderlingz",style: Theme.of(context).textTheme.subtitle2!.copyWith(
                                color: white,
                                fontWeight: FontWeight.w400
                            ),),
                            subtitle: Text("8056384773",style: Theme.of(context).textTheme.caption!.copyWith(
                                color: white,
                                fontSize: 10,
                                fontWeight: FontWeight.w400
                            ),),
                            leading: ClipRRect(
                              borderRadius: BorderRadius.circular(25.0),
                              child: Image.asset(
                                "assets/images/business.jpeg",
                                height: 55.0,
                                width: 50.0,
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 30),
                            child: TextButton.icon(
                              style: TextButton.styleFrom(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: defaultPadding * 1.5,
                                      vertical: defaultPadding
                                  ),
                                  minimumSize: Size(180,40),
                                  backgroundColor: white,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.all(Radius.circular(25))
                                  )
                              ),
                              onPressed: ()=>App().setNavigation(context, AppRoutes.APP_ADD_SALES_INVOICE),
                              icon: Icon(Icons.add,size: 16,color: black,),
                              label: Text("Create Sales Invoice",
                                style: Theme.of(context).textTheme.caption!.copyWith(
                                    color: black,
                                    fontSize: 10,
                                    fontWeight: FontWeight.w400
                                ),
                              ),
                            ),
                          )
                        ],
                    )
                ),
                DrawerListTile(
                  icon: Icons.dashboard_outlined,
                  title: "Dashboard",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_DASHBOARD);
                  },
                  isSelected: index==0,
                ),
                DrawerListTile(
                  icon: Icons.group_outlined,
                  title: "Parties",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_PARTIES);
                  },
                  isSelected: index==1,
                ),
                DrawerListTile(
                  icon: Icons.add_box_outlined,
                  title: "Items",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_ITEMS);
                  },
                  isSelected: index==4,
                ),
                ExpansionTile(
                  maintainState: true,
                  iconColor: white,
                  collapsedIconColor: primaryTxtColor,
                  onExpansionChanged: (val){
                    if(val){
                      App().setNavigation(context, AppRoutes.APP_SALES_INVOICE);
                    }else{

                    }
                  },
                  initiallyExpanded: index>30 && index<40 ?true:false,
                  leading: Icon(Icons.sell,color: index==31?white:primaryTxtColor,size: 18,),
                  title: Align(
                    child: Text("Sales",style: Theme.of(context).textTheme.caption!.copyWith(
                      color: index==31?white:primaryTxtColor,
                      fontWeight: FontWeight.w100,
                    ),),
                    alignment: Alignment(-1.3, 0),
                  ),
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_SALES_INVOICE);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Sales Invoices",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==31?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_QUOTATION);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Quotation / Estimate",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==32?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PAYMENT_IN);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Payment In",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==33?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_SALES_RETURN);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Sales Return",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==34?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_DELIVERY_CHALLAN);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Delivery Challan",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==35?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                  ],
                ),
                ExpansionTile(
                  maintainState: true,
                  iconColor: white,
                  collapsedIconColor: primaryTxtColor,
                  onExpansionChanged: (val){
                    if(val){
                      App().setNavigation(context, AppRoutes.APP_PURCHASE_INVOICE);
                    }else{

                    }
                  },
                  initiallyExpanded: index>20 && index<30 ?true:false,
                  leading: Icon(Icons.shopping_cart_outlined,color: index==21?white:primaryTxtColor,size: 18,),
                  title: Align(
                    alignment: Alignment(-1.3, 0),
                    child: Text("Purchases",style: Theme.of(context).textTheme.caption!.copyWith(
                        color: index==21?white:primaryTxtColor,
                        fontWeight: FontWeight.w100
                    ),),
                  ),
                  children: <Widget>[
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PURCHASE_INVOICE);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Purchase Invoices",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==21?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),)
                    ),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PAYMENT_OUT);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Payment Out",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==22?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PURCHASE_RETURN);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Purchase Return",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==23?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                    ListTile(
                      onTap: (){
                        App().setNavigation(context, AppRoutes.APP_PURCHASE_ORDER);
                      },
                      horizontalTitleGap: 0.0,
                      leading: Container(width: 10,),
                      title: Text("Purchase Orders",style: Theme.of(context).textTheme.caption!.copyWith(
                          color: index==24?white:primaryTxtColor,
                          fontWeight: FontWeight.w100
                      ),),),
                  ],
                ),
                DrawerListTile(
                  icon: Icons.attach_money_outlined,
                  title: "Cash & bank",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_CASH_BANK);
                  },
                  isSelected: index==5,
                ),
                DrawerListTile(
                  icon: Icons.subdirectory_arrow_right_outlined,
                  title: "Expense",
                  onPress: (){
                    App().setNavigation(context, AppRoutes.APP_EXPENSES);
                  },
                  isSelected: index==6,
                ),
                DrawerListTile(
                  icon: Icons.settings_outlined,
                  title: "Settings",
                  onPress: (){
                  },
                  isSelected: index==7,
                ),
                DrawerListTile(
                  icon: Icons.help_center_outlined,
                  title: "Help",
                  onPress: (){
                  },
                  isSelected: index==8,
                ),
              ],
            )
        )
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.onPress,
    required this.isSelected
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool isSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      horizontalTitleGap: 0.0,
      leading: Icon(icon,color: isSelected?white:primaryTxtColor,size: 18,),
      title: Text(title,style: Theme.of(context).textTheme.caption!.copyWith(
          color: isSelected?white:primaryTxtColor,
          fontWeight: FontWeight.w100
        ),
      ),
    );
  }
}
