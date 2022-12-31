// ignore_for_file: override_on_non_overriding_member, avoid_single_cascade_in_expression_statements

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/DataSource/CartList.dart';
import 'package:flutter_ecommerce_app/DataSource/DataMap.dart';
import 'package:flutter_ecommerce_app/DataSource/FavouriteList.dart';
import 'package:flutter_ecommerce_app/pages/home.dart';
import 'package:flutter_ecommerce_app/widgits/home/itemCard.dart';
import 'package:flutter_ecommerce_app/widgits/theme.dart';

class Favouritepage extends StatefulWidget {
  // Function appCounter;
  Favouritepage({Key? key}) : super(key: key);

  @override
  _FavouritepageState createState() => _FavouritepageState();
}

class _FavouritepageState extends State<Favouritepage> {
  late int index;
  late int counterBar = 0;
  int IndexSeter(int i) {
    setState(() {
      index = i;
    });
    return index;
  }

  void refreashCount() {
    setState(() {
      CartList.cartCount = CartList.cart.length;
    });
  }

  Widget ItemTileView() {
    return ListView.builder(
        shrinkWrap: true,
        // physics: NeverScrollableScrollPhysics(),
        itemCount: FavouriteList.favourite.length,
        itemBuilder: (context, index) {
          return ItemCard(
              isFavouritePage: true,
              DeleteCart: () => IndexSeter(index),
              DeleteFavourate: () => IndexSeter(index),
              Refresh: refreashCount,
              productInformation: FavouriteList.favourite[index]);
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppTheme.primarybackground,
        leading: InkWell(
            onTap: () {
              // Navigator.of(context)
              //   ..push(MaterialPageRoute(
              //     builder: (context) => HomePage(),
              //   )).then((value) {
              //     refreashCount();
              //   });
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
            child: Icon(Icons.arrow_back)),
      ),
      body: ItemTileView(),
    );
  }
}
