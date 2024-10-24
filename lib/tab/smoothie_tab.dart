import 'package:flutter/material.dart';
import 'package:p1_donut_app_manuel_tapia/car/cart_model.dart';  // Importa el modelo del carrito
import 'package:provider/provider.dart';
import '../utils/smoothie_title.dart';

class SmoothieTab extends StatelessWidget {
  // list of smoothies 
 final List smoothieOnSale = [
    //[ smoothieFlavor, smoothiePrice, smoothieColor, imageName ]
    ["Strawberry", "30", Colors.blue, "lib/Smoothie_image/Fresa_smoothie.png"],
    ["Kiwi", "58", Colors.red, "lib/Smoothie_image/Kiwi_smoothie.png"],
    ["Mango", "76", Colors.purple, "lib/Smoothie_image/Mango_smoothie.png"],
    ["Blackberry", "63", Colors.brown, "lib/Smoothie_image/Mora_smoothie.png"],
    ["Orange", "42", Colors.green, "lib/Smoothie_image/Naranja_smoothie.png"],
    ["Pineapple", "59", Colors.red, "lib/Smoothie_image/Piña_smoothie.png"],
    ["Banana", "25", Colors.purple, "lib/Smoothie_image/Platano_smoothie.png"],
    ["Watermelon", "95", Colors.brown, "lib/Smoothie_image/Sandia_smoothie.png"],
  ]; 
  SmoothieTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: smoothieOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2.3,
              ),
              itemBuilder: (context, index) {
                return SmoothieTitle(
                  smoothieFlavor: smoothieOnSale[index][0],
                  smoothiePrice: smoothieOnSale[index][1],
                  smoothieColor: smoothieOnSale[index][2],
                  imageName: smoothieOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': smoothieOnSale[index][0],
                      'price': smoothieOnSale[index][1],
                      'color': smoothieOnSale[index][2],
                      'image': smoothieOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${smoothieOnSale[index][0]} toggled');
                  },
                );
              },
            ),
          ),
          // Barrita inferior para mostrar el total del carrito
          Consumer<CartModel>(
            builder: (context, cart, child) {
              return Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    top: BorderSide(color: Colors.grey[300]!, width: 1),
                  ),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 10,
                      spreadRadius: 2,
                    ),
                  ],
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          '${cart.totalItems} Items | \$${cart.totalPrice.toStringAsFixed(2)}',
                          style: const TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        const Text(
                          'Delivery Charges Included',
                          style: TextStyle(fontSize: 12, color: Colors.grey),
                        ),
                      ],
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink, // Color del botón "View Cart"
                      ),
                      onPressed: () {
                        // Acción para ver el carrito
                        print('View Cart pressed');
                      },
                      child: const Text('View Cart'),
                    ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}