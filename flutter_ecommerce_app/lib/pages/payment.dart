// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/DataSource/CartList.dart';
import 'package:flutter_ecommerce_app/containers/_textFeild.dart';
import 'package:flutter_ecommerce_app/pages/home.dart';
import 'package:flutter_ecommerce_app/pages/success.dart';
import 'package:flutter_ecommerce_app/widgits/theme.dart';


class PaymentPage extends StatefulWidget {
  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool stateOfContainer = false;
  final _formKey = GlobalKey<FormState>();

  ValidateFeilds(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        stateOfContainer = true;
      });
      await Future.delayed(Duration(seconds: 1));
      CartList.cart.clear();
      CartList.cartCount = 0;
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => SuccessPage()),
      );
      setState(() {
        stateOfContainer = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Container(
            margin: EdgeInsets.only(top: 100),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment:   CrossAxisAlignment.center,
              children: [
                Text('Payment Page',style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),),
                SizedBox(height: 20,),
                Feilds(
                    // controller: userController,
                    hint: "Enter Full name",
                    isPass: false),
                Feilds(
                    // controller: userController,
                    hint: "Enter Credit Card Number",
                    isPass: false),
                Feilds(
                    // controller: passController,
                    hint: "Enter Enter Card Date",
                    isPass: false),

                Feilds(
                    // controller: passController,
                    hint: "Enter Enter Address",
                    isPass: false),
                Container(
                  margin: EdgeInsets.only(top:30),
                  child: Material(
                    color: stateOfContainer
                        ? Colors.green[300]
                        : AppTheme.primarybackground,
                    borderRadius: BorderRadius.circular(
                      stateOfContainer ? 80 : 12,
                    ),
                    child: InkWell(
                      onTap: () => ValidateFeilds(context),
                      child: AnimatedContainer(
                        duration: Duration(seconds: 1),
                        height: 50,
                        width: stateOfContainer ? 50 : 250,
                        alignment: Alignment.center,
                        child: stateOfContainer
                            ? Icon(
                                Icons.done,
                                color: Colors.white,
                              )
                            : Text(
                                'Place Order',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: stateOfContainer ? 12 : 15,
                                ),
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
