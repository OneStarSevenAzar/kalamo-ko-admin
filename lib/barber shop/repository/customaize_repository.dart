import 'package:shop_style/barber%20shop/model/customaize_model.dart';
import 'package:shop_style/common/models/api_service.dart';
import 'package:shop_style/common/services/response_model.dart';
import 'package:shop_style/locator.dart';

abstract class IBarberRepository {
  Future<ResponseModel> getBarber(int? barberShopId);
}

class BarberRepository extends IBarberRepository {
  ApiClientV3 dio = locator.get();

  @override
  Future<ResponseModel> getBarber(int? barberShopId) async {
    ResponseModel response = await dio.get(
      'barber_shop/barbershops/$barberShopId',
    );
    if (response.statusCode == 200) {
      response.data = BarberShopModel.fromJson(response.json);
    }
    return response;
  }
}
