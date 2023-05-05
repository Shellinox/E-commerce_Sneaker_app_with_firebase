import 'package:flutter/foundation.dart';

import 'shoe.dart';

class Cart extends ChangeNotifier {
  //List of shoes on app
  List<Shoe> Shoeshop = [
    Shoe(
        name: 'Jordan Retro High',
        imgpath: 'lib/images/orange.png',
        price: '3000',
        descriptiion:
            'This iteration of the AJ1 reimagines MJ\'s first signature shoe with a fresh mix of colours.',
        details:
            'There\'s no such thing as a perfect marriage, but this one comes pretty close. The classic AJ1 silhouette gets blessed with the most iconic element of the AJ3—you know what it is—proving that two icons are made even better together. Black, white and Tech Grey create a modern neutral colourway that will set off any outfit, and premium materials will keep you on your feet all day. Cheers to the happy couple.'),
    Shoe(
        name: 'Jordan Retro High',
        imgpath: 'lib/images/orange.png',
        price: '3000',
        descriptiion:
            'This iteration of the AJ1 reimagines MJ\'s first signature shoe with a fresh mix of colours.',
        details:
            'There\'s no such thing as a perfect marriage, but this one comes pretty close. The classic AJ1 silhouette gets blessed with the most iconic element of the AJ3—you know what it is—proving that two icons are made even better together. Black, white and Tech Grey create a modern neutral colourway that will set off any outfit, and premium materials will keep you on your feet all day. Cheers to the happy couple.'),
    Shoe(
        name: 'Jordan Retro High',
        imgpath: 'lib/images/orange.png',
        price: '3000',
        descriptiion:
            'This iteration of the AJ1 reimagines MJ\'s first signature shoe with a fresh mix of colours.',
        details:
            'There\'s no such thing as a perfect marriage, but this one comes pretty close. The classic AJ1 silhouette gets blessed with the most iconic element of the AJ3—you know what it is—proving that two icons are made even better together. Black, white and Tech Grey create a modern neutral colourway that will set off any outfit, and premium materials will keep you on your feet all day. Cheers to the happy couple.'),
    Shoe(
        name: 'Jordan Retro High',
        imgpath: 'lib/images/orange.png',
        price: '3000',
        descriptiion:
            'This iteration of the AJ1 reimagines MJ\'s first signature shoe with a fresh mix of colours.',
        details:
            'There\'s no such thing as a perfect marriage, but this one comes pretty close. The classic AJ1 silhouette gets blessed with the most iconic element of the AJ3—you know what it is—proving that two icons are made even better together. Black, white and Tech Grey create a modern neutral colourway that will set off any outfit, and premium materials will keep you on your feet all day. Cheers to the happy couple.'),
    Shoe(
        name: 'Jordan Retro High',
        imgpath: 'lib/images/orange.png',
        price: '3000',
        descriptiion:
            'This iteration of the AJ1 reimagines MJ\'s first signature shoe with a fresh mix of colours.',
        details:
            'There\'s no such thing as a perfect marriage, but this one comes pretty close. The classic AJ1 silhouette gets blessed with the most iconic element of the AJ3—you know what it is—proving that two icons are made even better together. Black, white and Tech Grey create a modern neutral colourway that will set off any outfit, and premium materials will keep you on your feet all day. Cheers to the happy couple.'),
    Shoe(
        name: 'Air Jordan 1 Chicago',
        imgpath: 'lib/images/red.png',
        price: '2000',
        descriptiion: 'The AJ1 '
            'Chicago'
            ' was inspired by the high -op Air Jordan 1 original colourway, first released in 1985.',
        details:
            'The Air Jordan 1 is a footwear pioneer—but the OG silhouette isn\'t too old to learn new tricks. The Air Jordan 1 KO repackages the famous design using a mix of leather and canvas to create a fit that\'s redesigned for comfort. This edition sports a classic colour scheme, with contrasting hits of black and white blended with Varsity Red.'),
    Shoe(
        name: 'Nike Air Max',
        imgpath: 'lib/images/dark red.png',
        price: '4000',
        descriptiion:
            'Strap a little sunshine to your feet with the Nike Air Max 90 SE.',
        details:
            'Nike Air Max shoes are ideal for everyone who are looking for both comfort and style. With great soles and comfortable cushioning, these shoes will keep you comfortable throughout the day. Whether you’re planning to go to a gym or you’re planning to incorporate running into your day-to-day life.'),
    Shoe(
        name: 'Nike Air Force 1 ' '\'07' '',
        imgpath: 'lib/images/white.png',
        price: '1000',
        descriptiion:
            'The radiance lives on in the Nike Air Force 1 \'07, puts a fresh spin on what you know best',
        details:
            'The radiance lives on in the Nike Air Force 1 \'07, the basketball original that puts a fresh spin on what you know best: durably stitched overlays, clean finishes and the perfect amount of flash to make you shine.'),
  ];
  //Shoes in cart
  List<Shoe> userCart = [];
//get a list of shoes for sale
  List<Shoe> getShoeList() {
    return Shoeshop;
  }

//get user cart items
  List<Shoe> getUserCart() {
    return userCart;
  }

//add shoes in cart
  void addItemsToCart(Shoe shoe) {
    userCart.add(shoe);
    notifyListeners();
  }

  void removeItemsFromCart(Shoe shoe) {
    userCart.remove(shoe);
    notifyListeners();
  }
}
