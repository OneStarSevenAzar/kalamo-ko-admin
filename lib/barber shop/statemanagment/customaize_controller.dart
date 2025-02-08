import 'package:flutter/material.dart';
import 'package:shop_style/barber%20shop/model/customaize_model.dart';
import 'package:shop_style/barber%20shop/repository/customaize_repository.dart';
import 'package:shop_style/common/configs/state_handeler.dart';
import 'package:shop_style/common/services/response_model.dart';

class BarberShopProvider with ChangeNotifier {
  final BarberRepository repository = BarberRepository();

  BarberShopModel? barberShopData;
  BlocStatus barberShopState = BlocStatusInitial();

  Future<void> fetchBarberShopData() async {
    barberShopState = BlocStatusLoading();
    notifyListeners();

    ResponseModel response = await repository.getBarber(1);
    if (response.statusCode == 200) {
      barberShopState = BlocStatusCompleted(null);
      barberShopData = response.data;
    } else {
      barberShopState =
          BlocStatusError(response.error?.message, response.statusCode);
    }
    notifyListeners();
  }
}
