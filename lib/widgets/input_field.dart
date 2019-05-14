import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final IconData icon;
  final String hint;
  final bool obscure;

  const InputField({@required this.icon,@required this.hint, this.obscure = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        icon: Icon(icon, color:Colors.white),
        hintText: hint,
        hintStyle: TextStyle(color: Colors.white),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.pinkAccent)
        )
      ),
      style: TextStyle(color: Colors.white),
      obscureText: obscure,
    );
  }
}