class Expenses{
  final String date,party,mode,paid,balance;

  Expenses({required this.date,required this.party,required this.mode,required this.paid,required this.balance});
}

List<Expenses> expenses = [
  Expenses(date: "12/12/2021",party: "Jeeva",mode: "Cash",paid: "1000",balance: "1000")
];