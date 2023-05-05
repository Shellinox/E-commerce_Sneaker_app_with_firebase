import 'package:flutter/material.dart';
import 'package:sneakerapp/models/shoe.dart';

import '../pages/Details_page.dart';

class Shoetile extends StatelessWidget {
  void Function()? onTap;
  Shoe shoe;
  Shoetile({Key? key, required this.shoe,required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context)=> shoeDetails(shoe: shoe,))),
      child: Container(
        margin: EdgeInsets.only(left: 25),
        width: 280,
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            //shoe
            SizedBox(height: 250, width: 250, child: Hero(tag: shoe.name,
            child: Image.asset(shoe.imgpath))),
            // name
            Text(
              shoe.name,
              style: TextStyle(fontSize: 21, fontWeight: FontWeight.bold),
              textAlign: TextAlign.start
            ),
            //description
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0,vertical: 5),
              child: Text(
                shoe.descriptiion,
                style: TextStyle(fontSize: 15, color: Colors.grey),
              ),
            ),
            SizedBox(height: 6,),
            //price+add to cart
            Padding(
              padding: const EdgeInsets.all(22.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    shoe.price,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: onTap,
                    child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: Colors.black,
                        ),
                        padding: const EdgeInsets.all(13),
                        child: const Icon(
                          Icons.add,
                          color: Colors.white,
                        )),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
