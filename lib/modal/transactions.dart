class Transactions{
  final String date,party,amount,type;

  Transactions({required this.amount,required this.date,required this.party,required this.type});
}

List<Transactions> transactions = [
  Transactions(amount: "2100", date: "12/12/2022", party: "Dhana", type: "Sales"),
  Transactions(amount: "3300", date: "10/12/2022", party: "Guna", type: "Invoice"),
  Transactions(amount: "1500", date: "1/12/2022", party: "Guna", type: "Invoice"),
  Transactions(amount: "500", date: "2/12/2022", party: "Dhana", type: "Sales"),
  Transactions(amount: "500", date: "8/12/2022", party: "Dhana", type: "Sales"),
  Transactions(amount: "2300", date: "15/12/2022", party: "Guna", type: "Invoice")
];
