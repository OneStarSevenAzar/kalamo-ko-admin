import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shop_style/barber%20shop/statemanagment/customaize_controller.dart';

class BarberShopScreen extends StatelessWidget {
  const BarberShopScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<BarberShopProvider>(
        
        builder: (context, provider, _) {
          if (provider.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (provider.error != null) {
            return Center(child: Text(provider.error!));
          }
        
          final barberShop = provider.barberShop;

          if (barberShop == null) {
            return const Center(child: Text('No data available'));
          }

          return ListView(
            children: [
              ListTile(
                title: Text(barberShop.barberShopName),
                subtitle: Text(barberShop.shopType),
              ),
              ListTile(
                title: const Text('Location'),
                subtitle: Text(
                  'Lat: ${barberShop.location.latitude}, Long: ${barberShop.location.longitude}',
                ),
              ),
              ...barberShop.comments.map(
                (comment) => ListTile(
                  title: Text(comment.comment),
                  subtitle: Text('Rating: ${comment.rating}'),
                ),
              ),
              ...barberShop.images.map(
                (image) => Image.network(image.url),
              ),
            ],
          );
        },
      ),
    );
  }
}
