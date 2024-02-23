import 'package:flutter/material.dart';
import 'package:pet_shop_app/pet_model.dart';

class CartProvider extends ChangeNotifier {

  final List<PetModel> _items = [];

  List<PetModel> get items => _items;

  void add(PetModel item) {
    _items.add(item);
    notifyListeners();
  }

  void remove(PetModel item) {
    _items.remove(item);
    notifyListeners();
  }

  void removeAll() {
    _items.clear();
    notifyListeners();
  }

  double getCartTotal() {
    return _items.fold(0, (previousValue, item) => previousValue + item.price);
  }
}