import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:gerencia_loja/blocs/user_bloc.dart';
import 'package:gerencia_loja/widgets/user_tile.dart';

class UsersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final _userBloc = BlocProvider.getBloc<UserBloc>();

    return Column(
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          child: TextField(
            onChanged: _userBloc.onChangedSearch,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
                hintText: "Pesquisar",
                hintStyle: TextStyle(color: Colors.white),
                icon: Icon(Icons.search, color: Colors.white),
                border: InputBorder.none),
          ),
        ),
        Expanded(
          child: StreamBuilder<List>(
            stream: _userBloc.outUsers,
            builder: (context, snapshot) {
              if (!snapshot.hasData) {
                return Center(child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation(Colors.pinkAccent),
                ));
              }else if(snapshot.data.length == 0){
                return Center(child:Text("Nenhum usuário encontrado!", style:TextStyle(color: Colors.pinkAccent)));
              }else{
                return ListView.separated(
                  itemBuilder: (BuildContext context, int index) {
                    return UserTile(snapshot.data[index]);
                  },
                  itemCount: snapshot.data.length,
                  separatorBuilder: (BuildContext context, int index) {
                    return Divider();
                  },
                );
              }
            }
          ),
        )
      ],
    );
  }
}
