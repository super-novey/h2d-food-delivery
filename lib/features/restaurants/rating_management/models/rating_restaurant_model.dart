class RatingRestaurant {
  final String comment;
  final int stars;
  final DateTime orderDateTime;
  final String nameCustomer;
  final String avatar;


  RatingRestaurant(
      {required this.comment,
      required this.stars,
      required this.orderDateTime,
      required this.nameCustomer, 
      required this.avatar});
}
