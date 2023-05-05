import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/components/Toast_message.dart';
import 'package:sneakerapp/components/cart_item.dart';
import 'package:sneakerapp/components/textField.dart';
import 'package:sneakerapp/models/cart.dart';
import 'package:sneakerapp/models/shoe.dart';

class PlaceOrder extends StatefulWidget {
  const PlaceOrder({Key? key}) : super(key: key);

  @override
  State<PlaceOrder> createState() => _PlaceOrderState();
}

class _PlaceOrderState extends State<PlaceOrder> {
  bool loading = false;
  TextEditingController _name = TextEditingController();
  TextEditingController _address = TextEditingController();
  TextEditingController _number = TextEditingController();
  TextEditingController _email = TextEditingController();
  Cart shoes=new Cart();
  Future createOrder() async {
    final Order =
    FirebaseFirestore.instance.collection('userOrders').doc(
        "Order ID: ${DateTime
            .now()
            .millisecondsSinceEpoch}");
    final json = {
      'Name': _name.text,
      'Address': _address.text,
      'Phone': _number.text,
      'Email': _email.text,
      'Orders':[shoes.getUserCart()],
    };
    await Order.set(json);
    }
    void placeOrder() {
      setState(() {
        loading = true;
      });
      createOrder().then((value) {
        setState(() {
          loading = false;
        });
        Utils.toastMessage("Order Placed! Thank you for shopping");
      }).onError((error, stackTrace) {
        Utils.toastMessage(error.toString());
        setState(() {
          loading = false;
        });
      });
    }
  @override
    Widget build(BuildContext context) {
      return Scaffold(
          resizeToAvoidBottomInset: false,
          appBar: AppBar(
              backgroundColor: Colors.red, title: const Text("Place Order")),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                tField("Name", _name),
                const SizedBox(
                  height: 25,
                ),
                tField("Address", _address),
                const SizedBox(
                  height: 25,
                ),
                tField("Phone Number", _number),
                const SizedBox(
                  height: 25,
                ),
                tField("Email", _email),
                const SizedBox(
                  height: 25,
                ),
                GestureDetector(
                  onTap: () {
                    placeOrder();
                  },
                  child: Container(
                    height: 50,
                    width: 400,
                    decoration: BoxDecoration(
                        color: Colors.grey[900],
                        borderRadius: BorderRadius.circular(5)),
                    child: Center(
                      child: loading
                          ? const SizedBox(
                        height: 20,
                        width: 20,
                        child: CircularProgressIndicator(
                          color: Colors.white,
                          strokeWidth: 2,
                        ),
                      )
                          : const Text(
                        "Place Order",
                        style: (TextStyle(color: Colors.white)),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
      );
    }
  }
