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

  Future<ResponseModel> updateBarberShop({
    required String name,
    required bool isActive,
    String shopType = 'SEEN_RECENTLY',
    required int lat,
    required int long,
    required int barberShopId,
  }) async {
    ResponseModel response =
        await dio.put('/barber_shop/barbershops/$barberShopId', data: {
      {
        "barber_shop_name": name,
        "is_active": isActive,
        "shop_type": shopType,
        "location": {"latitude": lat, "longitude": long},
      }
    });

    return response;
  }
}
