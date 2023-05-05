import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:sneakerapp/components/bottom_nav_bar.dart';
import 'package:sneakerapp/pages/login_page.dart';
import 'package:sneakerapp/pages/shoppage.dart';

import 'cart_page.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  // selected index controls navigation bar
  int _selectedIndex = 0;
  //method to update the selected index
  void navigateBottomBar(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  final List<Widget> _pages = [
    const ShopPage(),
    const CartPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.only(left: 12.0),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  color: Colors.black,
                ),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              ),
            ),
          )),
      backgroundColor: Colors.grey[300],
      bottomNavigationBar: Mynavbar(
        onTabChange: (index) => navigateBottomBar(index),
      ),
      drawer: Drawer(
        backgroundColor: Colors.grey[900],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                DrawerHeader(
                    child: Image.asset(
                      'lib/images/nike.png',
                      color: Colors.white,
                      height: 120,
                      width: 120,
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25.0),
                  child: Divider(
                    color: Colors.grey[600],),
                ),
                  Padding(
                  padding: EdgeInsets.only(left:25.0),
                  child: ListTile(
                    leading: Icon(Icons.home,color: Colors.white,),
                    title: Text("Home",style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(left:25.0),
                  child: ListTile(
                    leading: Icon(Icons.info,color: Colors.white,),
                    title: Text("About",style: TextStyle(
                        color: Colors.white
                    ),),
                  ),
                ),
              ],
            ),
             Padding(
              padding: EdgeInsets.only(left:25.0,bottom: 20),
              child: GestureDetector(
                onTap:(){
                  FirebaseAuth.instance.signOut().then((value) => Navigator.push(context, MaterialPageRoute(builder: (context)=>const Login())));
                },
                child: ListTile(
                  leading: Icon(Icons.logout_outlined,color: Colors.white,),
                  title: Text("Logout",style: TextStyle(
                    color: Colors.white
                  ),),
                ),
              ),
            ),
          ],
        ),
      ),
      body: _pages[_selectedIndex],
    );
  }
}
