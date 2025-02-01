import 'package:dio/dio.dart';
import 'package:shop_style/barber%20shop/model/customaize_model.dart';

class BarberShopRepository {
  final Dio _dio = Dio();

  Future<BarberShopModel> fetchBarberShopData() async {
    try {
      final response = await _dio
          .get('https://style-shop.liara.run/barber_shop/barbershops/1');

      return BarberShopModel.fromJson(response.data);
    } catch (e) {
      throw Exception('Failed to load barber shop data: $e');
    }
  }
}
  