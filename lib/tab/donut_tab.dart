import 'package:flutter/material.dart';
import 'package:p1_donut_app_manuel_tapia/car/cart_model.dart';  // Importa el modelo del carrito
import 'package:provider/provider.dart';
import '../utils/donut_tile.dart'; // Asegúrate de importar el widget correcto

class DonutTab extends StatelessWidget {
  // list of donuts 
 final List donutsOnSale = [
    //[ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Polporones", "58", Colors.green, "lib/images/Polporones_donut.png"],
    ["Especial", "120", Colors.red, "lib/images/especialchoco_donut.png"],
    ["Adereso", "63", Colors.purple, "lib/images/Adereso_donut.png"],
    ["Chocochispas", "71", Colors.brown, "lib/images/Chocochispas_donut.png"],
  ];

  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: donutsOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return DonutTile(
                  donutFlavor: donutsOnSale[index][0],
                  donutPrice: donutsOnSale[index][1],
                  donutColor: donutsOnSale[index][2],
                  imageName: donutsOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': donutsOnSale[index][0],
                      'price': donutsOnSale[index][1],
                      'color': donutsOnSale[index][2],
                      'image': donutsOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${donutsOnSale[index][0]} toggled');
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
