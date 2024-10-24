import 'package:flutter/material.dart';
import 'package:p1_donut_app_manuel_tapia/utils/pancakes_title.dart';
import 'package:p1_donut_app_manuel_tapia/car/cart_model.dart';  // Importa el modelo del carrito
import 'package:provider/provider.dart';

class PancakeTab extends StatelessWidget {
   // list of donuts 
 final List pancakesOnSale = [
    //[ pancakesFlavor, pancakesPrice, pancakesColor, imageName ]
    ["Chocolate ", "76", Colors.orange, "lib/Image_pancakes/chocolate_pancakes.png"],
    ["Crepa", "39", Colors.blue, "lib/Image_pancakes/Crepa_pancakes.png"],
    ["Fresh", "64", Colors.purple, "lib/Image_pancakes/Fresas_pancakes.png"],
    ["Frutales", "57", Colors.green, "lib/Image_pancakes/Frutas_pancakes.png"],
    ["Mini", "29", Colors.orange, "lib/Image_pancakes/mini_pancakes.png"],
    ["Especial Mora", "68", Colors.blue, "lib/Image_pancakes/Moras_pancakes.png"],
    ["Original", "70", Colors.purple, "lib/Image_pancakes/Original_pancakes.png"],
    ["Simples", "100", Colors.green, "lib/Image_pancakes/simple_pancakes.png"],
  ]; 
  PancakeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pancakesOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                final pancakes = pancakesOnSale[index];
                return PancakesTitle(
                  pancakesFlavor: pancakes[0],
                  pancakesPrice: pancakes[1],
                  pancakesColor: pancakes[2],
                  imageName: pancakes[3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pancakes[0],
                      'price': pancakes[1],
                      'color': pancakes[2],
                      'image': pancakes[3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${pancakes[0]} toggled');
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