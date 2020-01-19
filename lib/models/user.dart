class User {

  final String uid;

  User({this.uid});

}

class UserData {
  final String uid;
  final String name;
  final String pizzaSize;
  final List<String> pizzaToppings;

  // constructor
  UserData({this.uid, this.name, this.pizzaSize, this.pizzaToppings});
}