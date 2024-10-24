import 'package:flutter/material.dart';

class SmoothieTitle extends StatelessWidget {
  final String smoothieFlavor;
  final String smoothiePrice;
  final dynamic smoothieColor; //dynamic porque sera de tipo de color
  final String imageName;
  final VoidCallback onAddToCart; // Callback para agregar al carrito
  final VoidCallback onFavoriteToggle; // Callback para cambiar el estado del favorito
  const SmoothieTitle({super.key, required this.smoothieFlavor, required this.smoothiePrice, this.smoothieColor, required this.imageName, required this.onAddToCart, required this.onFavoriteToggle});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12),
      child: Container(
        decoration: BoxDecoration(color: smoothieColor [100], borderRadius: BorderRadius.circular(24)),
      child: Column(
        children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [Container(
            decoration: BoxDecoration(color: smoothieColor[200], 
            borderRadius: const BorderRadius.only(
              topRight: Radius.circular(24), 
              bottomLeft: Radius.circular(24))),
            padding: 
            const EdgeInsets.symmetric(vertical: 8,horizontal: 18),
            child: Text("\$$smoothiePrice",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: smoothieColor[800]
                ),),
          )],),
              //Donut picture
              Padding(
                padding: const EdgeInsets.symmetric(
                horizontal:24,
                vertical:12),
                child: Image.asset(imageName),
              ),
              //Donut flavor Tex
              Text(smoothieFlavor,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold
              ),),
              Text("Starbucks",
              style: TextStyle(color: Colors.grey[600])),
              ////Love icon + add button
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    //love icon
                    Icon(Icons.favorite, color: Colors.pink[400],),
                    //plus Button
                    IconButton(icon: const Icon(Icons.add), onPressed: onAddToCart, color: Colors.grey[800],)
                  ],
                ),
              )
            ],
      ),
      ),
    );
  }
}