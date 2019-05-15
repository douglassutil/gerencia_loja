import 'package:flutter/material.dart';
import 'package:gerencia_loja/blocs/login_bloc.dart';
import 'package:gerencia_loja/screens/home_screen.dart';
import 'package:gerencia_loja/widgets/input_field.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _loginBloc = LoginBloc();

  @override
  void initState() {
    super.initState();
    _loginBloc.outState.listen((state){
      switch (state) {
        case LoginState.SUCESS:
          Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => HomeScreen())
          );
          break;
        case LoginState.FAIL:
          showDialog(context: context, builder: (context)=>AlertDialog(
            title: Text("Erro"),
            content: Container(
              height: MediaQuery.of(context).size.width*0.22,
              child: Column(
                children: <Widget>[
                  Icon(Icons.mood_bad),
                  Text("Você não possui os primilégios necessários")
                ]
              )
            ),
          ));
          break;
        case LoginState.LOADING:
        case LoginState.IDLE:
      }
    });
  }

  @override
  void dispose() {
    _loginBloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[850],
      body: StreamBuilder<LoginState>(
          stream: _loginBloc.outState,
          initialData: LoginState.LOADING,
          builder: (context, snapshot) {
            switch (snapshot.data) {
              case LoginState.LOADING:
                return Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.pinkAccent)));
              case LoginState.FAIL:
              case LoginState.SUCESS:
              case LoginState.IDLE:
                return Stack(
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: InputField(
                                stream: _loginBloc.outEmail,
                                onChanged: _loginBloc.changeEmail,
                                icon: Icons.person_outline,
                                hint: "Usuário",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: InputField(
                                stream: _loginBloc.outPassword,
                                onChanged: _loginBloc.changePassword,
                                icon: Icons.lock_outline,
                                hint: "Senha",
                                obscure: true,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16, horizontal: 8),
                              child: StreamBuilder<bool>(
                                  stream: _loginBloc.submitValid,
                                  builder: (context, snapshot) {
                                    return RaisedButton(
                                      color: Colors.pinkAccent,
                                      child: Text("Entrar"),
                                      onPressed: snapshot.hasData
                                          ? _loginBloc.submit
                                          : null,
                                      textColor: Colors.white,
                                      disabledColor:
                                          Colors.pinkAccent.withAlpha(100),
                                    );
                                  }),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                );
            }
          }),
    );
  }
}
