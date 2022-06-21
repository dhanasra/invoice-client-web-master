class Items{
  final String name,code,qty,value,sellingPrice,purchasePrice,mrp,wholeSalePrice;

  Items({required this.name,required this.code,required this.qty,required this.value,required this.sellingPrice,required this.purchasePrice,required this.wholeSalePrice,required this.mrp});
}

List<Items> items = [
  Items(name: "Daal", code: "330", qty: "10 PCS", value: "20,000",sellingPrice: "300",purchasePrice: "200",wholeSalePrice: "100",mrp: "40"),
  Items(name: "Rice", code: "229", qty: "50 PCS", value: "11,000",sellingPrice: "500",purchasePrice: "400",wholeSalePrice: "200",mrp: "30"),
  Items(name: "Flour", code: "112", qty: "10 KG", value: "19,000",sellingPrice: "800",purchasePrice: "600",wholeSalePrice: "200",mrp: "220"),
];