import 'package:flutter/material.dart';

import '../utils/donut_tile.dart';

class DonutTab extends StatelessWidget {
  // list of donuts 
 final List donutsOnSale = [
    //[ donutFlavor, donutPrice, donutColor, imageName ]
    ["Ice Cream", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Strawberry", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Grape Ape", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Choco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
    ["Chocochispas", "36", Colors.blue, "lib/images/icecream_donut.png"],
    ["Adereso", "45", Colors.red, "lib/images/strawberry_donut.png"],
    ["Chispas", "84", Colors.purple, "lib/images/grape_donut.png"],
    ["Chaco", "95", Colors.brown, "lib/images/chocolate_donut.png"],
  ]; 
  
  DonutTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Delegate sirve para organizar los widgets en la cuadricula
    return GridView.builder(
    itemCount: donutsOnSale.length,
    padding: const EdgeInsets.all(12),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, childAspectRatio: 1/1.7), 
      itemBuilder:(context, index){
        return DonutTile(
          donutFlavor: donutsOnSale[index][0], 
          donutPrice: donutsOnSale[index][1],
          donutColor: donutsOnSale[index][2],
          imageName: donutsOnSale[index][3],
        );
      } );
  }
}