class ToppingEntity {
  final String? id;
  final String? name;
  final num? price;
  final bool? isActive;

  ToppingEntity({this.id, this.name, this.price, this.isActive});

  bool get isNew => id == null;
}
