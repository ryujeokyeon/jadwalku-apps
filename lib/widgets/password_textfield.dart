import 'package:flutter/material.dart';
import '../constant.dart';
// import '../screens/home_screen.dart';

class PasswordTextField extends StatefulWidget {
  final controller;
  final String hintText;
  // final bool obscureText;

  const PasswordTextField({
    super.key,
    this.controller,
    required this.hintText,
    // required this.obscureText,
  });

  @override
  State<PasswordTextField> createState() => PasswordyTextFieldState();
}

class PasswordyTextFieldState extends State<PasswordTextField> {
  bool showPassword = false;

  @override
  void initState() {
    super.initState();
    showPassword = true;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25),
      child: TextField(
        // controller: widget.controller,
        obscureText: showPassword == false ? false : true,
        decoration: InputDecoration(
          border: InputBorder.none,
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(color: kuning, width: 3),
          ),
          fillColor: putih,
          filled: true,
          hintText: widget.hintText,
          hintStyle: TextStyle(
            color: Colors.grey[500],
          ),
          suffixIcon: IconButton(
            color: abuabu,
            icon: Icon(showPassword ? Icons.visibility : Icons.visibility_off),
            onPressed: () {
              setState(
                () {
                  showPassword = !showPassword;
                },
              );
            },
          ),
        ),
      ),
    );
  }
}

/*
Padding(
padding: const EdgeInsets.symmetric(horizontal: 25),
child: Container(
  decoration: BoxDecoration(
    color: Colors.grey[200],
    border: Border.all(color: Colors.white),
    borderRadius: BorderRadius.circular(12),
  ),
  child: const Padding(
    padding: EdgeInsets.only(left: 20),
    child: TextField(
      obscureText: true,
      decoration: InputDecoration(
        border: InputBorder.none,
        hintText: 'Password',
      ),
    ),
  ),
),
),
*/