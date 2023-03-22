import 'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CartProvider with ChangeNotifier{
  int _counter = 0;
  int get counter => _counter;

  double _totalPrice = 0;
  double get totalPrice => _totalPrice;

  void _setPrefItems() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setInt('cart_item', _counter);
    pref.setDouble('total_price', _totalPrice);
    notifyListeners();
  }

  void _getPrefItems() async{
    SharedPreferences pref = await SharedPreferences.getInstance();
    _counter = pref.getInt('cart_item') ?? 0;
    _totalPrice = pref.getDouble('total_price') ?? 0.0;
    notifyListeners();
  }
  void addTotalPrice(double productPrice){
    _totalPrice = _totalPrice + productPrice;
    _setPrefItems();
    notifyListeners();
  }
  void removeTotalPrice(double productPrice){
    _totalPrice = _totalPrice - productPrice;
    _setPrefItems();
    notifyListeners();
  }
  double getTotalPrice(){
    _setPrefItems();
    return _totalPrice;
  }
  void addCounter(){
    _counter ++;
    _setPrefItems();
    notifyListeners();
  }
  void removeCounter(){
    _counter --;
    _setPrefItems();
    notifyListeners();
  }
  int getCounter(){
    _setPrefItems();
    return _counter;
  }
}