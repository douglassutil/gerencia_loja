import 'package:flutter/material.dart';
import 'package:gerencia_loja/blocs/login_bloc.dart';
import 'package:gerencia_loja/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginBloc = LoginBloc();

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
                      stream: _loginBloc.outEmail,
                      onChanged: _loginBloc.changeEmail,
                      icon: Icons.person_outline,
                      hint: "Usuário",
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:16, horizontal:8),
                    child: InputField(
                      stream: _loginBloc.outPassword,
                      onChanged: _loginBloc.changePassword,
                      icon: Icons.lock_outline,
                      hint: "Senha",
                      obscure: true,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:16, horizontal:8),
                    child: StreamBuilder<bool>(
                      stream: _loginBloc.submitValid,
                      builder: (context, snapshot) {
                        return RaisedButton(
                          color: Colors.pinkAccent,
                          child: Text("Entrar"),
                          onPressed: snapshot.hasData ? _loginBloc.submit : null,
                          textColor: Colors.white,
                          disabledColor: Colors.pinkAccent.withAlpha(100),
                        );
                      }
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