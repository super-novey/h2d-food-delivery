import 'package:food_delivery_h2d/features/restaurants/topping_management/entity/topping_entity.dart';

class ToppingGroupEntity {
  final String? id;
  final String name;
  final List<ToppingEntity> toppings;

  ToppingGroupEntity({this.id, this.name = "", this.toppings = const []});

  ToppingGroupEntity copyWith(
      {String? id, String? name, List<ToppingEntity>? toppings}) {
    return ToppingGroupEntity(
        id: id ?? this.id,
        name: name ?? this.name,
        toppings: toppings ?? this.toppings);
  }

  int get quantity => toppings.length;

  int get isActiveQuantity => toppings.where((e) => e.isActive == true).length;

  String get toppingCounter => "$isActiveQuantity/$quantity";

  String get toppingNames => toppings.map((e) => e.name).join(', ');

  bool get isNew => id == null;
}
