import 'package:flutter/material.dart';
import 'package:p1_donut_app_manuel_tapia/car/cart_model.dart';  // Importa el modelo del carrito
import 'package:provider/provider.dart';
import 'package:p1_donut_app_manuel_tapia/utils/pizza_title.dart';

class PizzaTab extends StatelessWidget {
    // list of pizza 
 final List pizzaOnSale = [
    //[ pizzaFlavor, pizzaPrice, pizzaColor, imageName ]
    ["Champiñon", "130", Colors.blue, "lib/Image_pizza/champiñon_pizza.png"],
    ["Corazón", "250", Colors.green, "lib/Image_pizza/especial_pizza.png"],
    ["Hawaiana", "190", Colors.orange, "lib/Image_pizza/hawaiana_pizza.png"],
    ["Mexicana", "350", Colors.red, "lib/Image_pizza/mexicana_pizza.png"],
    ["Peperoni", "100", Colors.green, "lib/Image_pizza/peperoni_pizza.png"],
    ["Pimienton", "120", Colors.red, "lib/Image_pizza/pimiento_pizza.png"],
    ["Sencilla", "80", Colors.purple, "lib/Image_pizza/queso_pizza.png"],
    ["Tocineta", "230", Colors.blue, "lib/Image_pizza/tocino_pizza.png"],
  ]; 
  PizzaTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: GridView.builder(
              itemCount: pizzaOnSale.length,
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                childAspectRatio: 1 / 2,
              ),
              itemBuilder: (context, index) {
                return PizzaTitle(
                  pizzaFlavor: pizzaOnSale[index][0],
                  pizzaPrice: pizzaOnSale[index][1],
                  pizzaColor: pizzaOnSale[index][2],
                  imageName: pizzaOnSale[index][3],
                  onAddToCart: () {
                    // Añadir al carrito usando el modelo CartModel
                    Provider.of<CartModel>(context, listen: false).addToCart({
                      'flavor': pizzaOnSale[index][0],
                      'price': pizzaOnSale[index][1],
                      'color': pizzaOnSale[index][2],
                      'image': pizzaOnSale[index][3],
                    });
                  },
                  onFavoriteToggle: () {
                    print('Favorite for ${pizzaOnSale[index][0]} toggled');
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