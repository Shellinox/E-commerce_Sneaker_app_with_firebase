import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/shoe_List.dart';
import '../models/cart.dart';
import '../models/shoe.dart';

class Inventory extends StatefulWidget {
  const Inventory({Key? key}) : super(key: key);

  @override
  State<Inventory> createState() => _InventoryState();
}

class _InventoryState extends State<Inventory> {
  @override
  Widget build(BuildContext context) {
    return Consumer<Cart>(
        builder: (context, value, child) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: Colors.transparent,
            elevation: 0,
            title: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 13.0),
              child: Text("All Collections",style: TextStyle(
                color: Colors.black
              ),
              ),
            ),
            actions: const [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                child: Icon(Icons.shopping_cart_outlined,color: Colors.black,),
              ),
            Padding(
                padding: EdgeInsets.only(right: 20.0),
                child: Icon(Icons.favorite,color: Colors.black,),
              ),
            ],
          ),
              body:Padding(
                padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 8.0),
                child:
                    Expanded(
                      child: GridView.builder(
                          itemCount: value.getShoeList().length,
                          itemBuilder: (context, index) {
                            value.getShoeList().length;
                            Shoe shoe = value.getShoeList()[index];
                            return ShoeList(shoe: shoe);
                          },
                          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 4 / 5)
                      ),
                    ),
                ),
              )
    );
  }
}
