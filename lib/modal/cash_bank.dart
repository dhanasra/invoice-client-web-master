class CashBank{
  final String date,type,txn,party,mode,paid,received,balance;

  CashBank({required this.date,required this.type,required this.txn,required this.party,required this.mode,required this.paid,required this.received,required this.balance});
}

List<CashBank> cashBank = [
  CashBank(date: "12/12/2021",type: "Payment In",txn: "7",party: "Jeeva",mode: "Cash",paid: "-",received: "1000",balance: "1000")
];