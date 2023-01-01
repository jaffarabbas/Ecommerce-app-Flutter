// ignore_for_file: deprecated_member_use, prefer_const_constructors, non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_app/containers/_textFeild.dart';
import 'package:flutter_ecommerce_app/pages/home.dart';
import 'package:flutter_ecommerce_app/pages/login.dart';
import 'package:flutter_ecommerce_app/widgits/theme.dart';


class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool stateOfContainer = false;
  final _formKey = GlobalKey<FormState>();

  ValidateFeilds(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        stateOfContainer = true;
      });
      await Future.delayed(Duration(seconds: 1));
      await Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
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
        child: Stack(
          // overflow: Overflow.visible,
          children: [
            Image.asset("assets/images/layout/bg.png",fit:BoxFit.contain,),
            Positioned(
              top: 30,
              right: 50,
              child: Image.asset("assets/images/layout/logo_w.png",width:90),
            ),
            Center(
              child: Form(
                key: _formKey,
                child: Container(
                  margin: EdgeInsets.only(top: 250),
                  height: 400,
                  child: Column(
                    children: [
                      Feilds(
                          // controller: userController,
                          hint: "Enter Username",
                          isPass: false),
                      Feilds(
                          // controller: userController,
                          hint: "Enter email",
                          isPass: false),
                      Feilds(
                          // controller: passController,
                          hint: "Enter Password",
                          isPass: true),
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
                                      'REGISTER HERE',
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
                       TextButton(onPressed: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => LoginPage()),
                        );
                      }, child: Text("Already A User?")),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
