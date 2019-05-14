import 'package:flutter/material.dart';
import 'package:gerencia_loja/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Container(),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Icon(
                    Icons.store_mall_directory,
                    color: Colors.pinkAccent,
                    size: 160,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:16, horizontal:8),
                    child: InputField(
                      icon: Icons.person_outline,
                      hint: "Usuário",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:16, horizontal:8),
                    child: InputField(
                      icon: Icons.lock_outline,
                      hint: "Senha",
                      obscure: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:16, horizontal:8),
                    child: RaisedButton(
                      color: Colors.pinkAccent,
                      child: Text("Entrar"),
                      onPressed: (){},
                      textColor: Colors.white,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}