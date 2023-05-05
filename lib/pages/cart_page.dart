import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sneakerapp/models/cart.dart';
import 'package:sneakerapp/models/shoe.dart';
import 'package:sneakerapp/pages/placeOrder.dart';
import '../components/cart_item.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  //Heading
                 Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children:  [
                     const Text("My Cart",
                         style:
                         TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
                     IconButton(onPressed: (){
                       Navigator.push(context, MaterialPageRoute(builder: (context)=>const PlaceOrder()));
                     }, icon: const Icon(Icons.shopping_cart_checkout_outlined),color: Colors.black,)
                   ],
                 ),
                  const SizedBox(
                    height: 30,
                  ),
                  Expanded(
                      child: ListView.builder(
                          itemCount: value.getUserCart().length,
                          itemBuilder: (context, index) {
                            //get indiviudal shoe
                            Shoe individualShoe = value.getUserCart()[index];
                            //return cart item
                            return cartItem(shoe: individualShoe);
                          }
                          )
                  ),
                ],
              ),
            ));
  }
}
