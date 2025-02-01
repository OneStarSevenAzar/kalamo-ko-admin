import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/model/customaize_model.dart';
import 'package:shop_style/barber%20shop/repository/customaize_repository.dart';

class BarberShopProvider with ChangeNotifier {
  final BarberShopRepository repository;
  BarberShopModel? barberShop;
  bool isLoading = false;
  String? error;

  BarberShopProvider({required this.repository});

  Future<void> fetchBarberShopData() async {
    isLoading = true;
    notifyListeners();

    try {
      barberShop = await repository.fetchBarberShopData();
      error = null; // Reset error if fetch is successful
    } catch (e) {
      error = e.toString();
      barberShop = null; // Reset barber shop if there's an error
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}