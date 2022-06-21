import 'package:flutter/material.dart';
import 'package:im_web/modal/cash_bank.dart';
import 'package:im_web/modal/expenses.dart';
import 'package:im_web/modal/items.dart';
import 'package:im_web/modal/parties.dart';
import 'package:im_web/modal/transactions.dart';

import '../constants.dart';

class IMTable {

  static DataCell cell({required BuildContext context,required String text}){
    return DataCell(
        Text(text,
            style: Theme.of(context).textTheme.caption!.copyWith(
                color: textColor
            )
        )
    );
  }

  static DataColumn column({required BuildContext context,required String text}){
    return DataColumn(
        label: Text(text,
            style: Theme.of(context).textTheme.subtitle2!.copyWith(
                color: subtitleColor
            )
        )
    );
  }

  static Widget recentTransactions({required BuildContext context,required List<Transactions> transactions}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "NO"),
          IMTable.column(context: context, text: "DATE"),
          IMTable.column(context: context, text: "PARTY"),
          IMTable.column(context: context, text: "AMOUNT"),
          IMTable.column(context: context, text: "TYPE"),
        ],
        rows: List.generate(transactions.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: index.toString()),
                  IMTable.cell(context: context, text: transactions[index].date),
                  IMTable.cell(context: context, text: transactions[index].party),
                  IMTable.cell(context: context, text: transactions[index].amount),
                  IMTable.cell(context: context, text: transactions[index].type),
                ]
            )
        )
    );
  }

  static Widget cashBank({required BuildContext context,required List<CashBank> cashBank}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "DATE"),
          IMTable.column(context: context, text: "TYPE"),
          IMTable.column(context: context, text: "TXN NO"),
          IMTable.column(context: context, text: "PARTY"),
          IMTable.column(context: context, text: "MODE"),
          IMTable.column(context: context, text: "PAID"),
          IMTable.column(context: context, text: "RECEIVED"),
          IMTable.column(context: context, text: "BALANCE"),
        ],
        rows: List.generate(cashBank.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: cashBank[index].date),
                  IMTable.cell(context: context, text: cashBank[index].type),
                  IMTable.cell(context: context, text: cashBank[index].txn),
                  IMTable.cell(context: context, text: cashBank[index].party),
                  IMTable.cell(context: context, text: cashBank[index].mode),
                  IMTable.cell(context: context, text: cashBank[index].paid),
                  IMTable.cell(context: context, text: cashBank[index].received),
                  IMTable.cell(context: context, text: cashBank[index].balance),
                ]
            )
        )
    );
  }

  static Widget expenses({required BuildContext context,required List<Expenses> expenses}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "DATE"),
          IMTable.column(context: context, text: "PARTY"),
          IMTable.column(context: context, text: "MODE"),
          IMTable.column(context: context, text: "PAID"),
          IMTable.column(context: context, text: "BALANCE"),
        ],
        rows: List.generate(expenses.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: expenses[index].date),
                  IMTable.cell(context: context, text: expenses[index].party),
                  IMTable.cell(context: context, text: expenses[index].mode),
                  IMTable.cell(context: context, text: expenses[index].paid),
                  IMTable.cell(context: context, text: expenses[index].balance),
                ]
            )
        )
    );
  }

  static Widget parties({required BuildContext context,required List<Parties> parties}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "NAME"),
          IMTable.column(context: context, text: "MOBILE NUMBER"),
          IMTable.column(context: context, text: "PARTY TYPE"),
          IMTable.column(context: context, text: "BALANCE"),
        ],
        rows: List.generate(parties.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: parties[index].name),
                  IMTable.cell(context: context, text: parties[index].mobile),
                  IMTable.cell(context: context, text: parties[index].type),
                  IMTable.cell(context: context, text: parties[index].balance),
                ]
            )
        )
    );
  }

  static Widget items({required BuildContext context,required List<Items> items}){
    return DataTable(
        showCheckboxColumn: false,
        headingRowColor: MaterialStateProperty.all(highlightColor),
        horizontalMargin: defaultPadding,
        headingRowHeight: 40,
        columnSpacing: defaultPadding,
        columns: [
          IMTable.column(context: context, text: "ITEM NAME"),
          IMTable.column(context: context, text: "ITEM CODE"),
          IMTable.column(context: context, text: "STOCK QTY"),
          IMTable.column(context: context, text: "STOCK VALUE"),
          IMTable.column(context: context, text: "SELLING PRICE"),
          IMTable.column(context: context, text: "PURCHASE PRICE"),
          IMTable.column(context: context, text: "MRP"),
          IMTable.column(context: context, text: "WHOLESALE PRICE"),
        ],
        rows: List.generate(items.length, (index) =>
            DataRow(
                onSelectChanged: (index){

                },
                cells: [
                  IMTable.cell(context: context, text: items[index].name),
                  IMTable.cell(context: context, text: items[index].code),
                  IMTable.cell(context: context, text: items[index].qty),
                  IMTable.cell(context: context, text: items[index].value),
                  IMTable.cell(context: context, text: items[index].sellingPrice),
                  IMTable.cell(context: context, text: items[index].purchasePrice),
                  IMTable.cell(context: context, text: items[index].mrp),
                  IMTable.cell(context: context, text: items[index].wholeSalePrice),
                ]
            )
        )
    );
  }
}

