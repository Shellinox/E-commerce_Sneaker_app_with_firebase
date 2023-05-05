import 'package:flutter/material.dart';

import '../models/shoe.dart';
class ShoeList extends StatelessWidget {
  Shoe shoe;
  ShoeList({Key? key, required this.shoe}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          color: Colors.grey[300]
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              SizedBox(
                height: 150,
                  child: Image.asset(shoe.imgpath),
                  ),
              Text(shoe.name,style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w500),),
              const SizedBox(height: 3,),
              Text('Rs.${shoe.price}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.w400),),
            ],
          ),
        ),
      ),
    );
  }
}
