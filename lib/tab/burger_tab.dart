import 'package:flutter/material.dart';
import 'package:p1_donut_app_manuel_tapia/car/cart_model.dart';  // Importa el modelo del carrito
import 'package:provider/provider.dart';
import 'package:p1_donut_app_manuel_tapia/utils/burger_title.dart';

class BurgerTab extends StatelessWidget {
  //lits Burger
  final List burgerOnsale = [
    //[ burgerFlavor, burgerPrice, burgerColor, imagesName ]
    ["Chicken Burger", "85", Colors.red, "lib/burger_image/conpollo_burger.png"],
    ["Cheeseburger", "60", Colors.green, "lib/burger_image/conqueso_burger.png"],
    ["Burger with bacon", "95", Colors.orange, "lib/burger_image/contocino_burger.png"],
    ["Breaded Burger", "50", Colors.blue, "lib/burger_image/empanizado_burger.png"],
    ["Special Burger", "120", Colors.purple, "lib/burger_image/Especial_burger.png"],
    ["Monster Burger", "150", Colors.red, "lib/burger_image/Monster_burger.png"],
    ["Simple Burger", "45", Colors.green, "lib/burger_image/Sencilladoblecarne_burger.png"],
    ["Double Burger", "130", Colors.blue, "lib/burger_image/Doblecarne_burger.png"]
  ];
  
  BurgerTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: burgerOnsale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                final burger = burgerOnsale[index];
                return BurgerTitle(
                  burgerFlavor: burger[0],
                  burgerPrice: burger[1],
                  burgerColor: burger[2],
                  imagesName: burger[3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': burger[0],
                      'price': burger[1],
                      'color': burger[2],
                      'image': burger[3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${burger[0]} toggled');
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
