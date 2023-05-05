import 'package:flutter/material.dart';

import '../models/shoe.dart';

class shoeDetails extends StatelessWidget {
  Shoe shoe;
  shoeDetails({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.grey[300],
        body: Column(
          children: [
            Expanded(
              flex: 3,
              child: Container(
                height: 370,
                decoration: BoxDecoration(
                    borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(24),
                        bottomLeft: Radius.circular(24)),
                    color: Colors.grey[100]),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Hero(tag: shoe.name, child: Image.asset(shoe.imgpath)),
                      Text(
                        shoe.name,
                        style: const TextStyle(
                            fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Text(
                  shoe.details,
                  style: TextStyle(fontSize: 17, color: Colors.grey[600]),
                ),
              ),
            ),
            Expanded(
                flex: 1,
                child: Container(
                  height: 200,
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                              color: Colors.black,
                              borderRadius: BorderRadius.circular(25)),
                          child: const Center(
                              child: Text(
                            "Add to cart",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                        ),
                        Container(
                          height: 50,
                          width: 140,
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(25),
                          ),
                          child: const Center(
                              child: Text(
                            "Buy now",
                            style: TextStyle(fontSize: 14, color: Colors.white),
                          )),
                        ),
                        Icon(Icons.shopping_cart,size: 30,)
                      ],
                    ),
                  ),
                ))
          ],
        ));
  }
}
