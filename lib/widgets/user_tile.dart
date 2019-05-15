import 'package:flutter/material.dart';

class UserTile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final textStyle = TextStyle(color: Colors.white);

    return ListTile(
      title: Text(
        "Título",
        style: textStyle
      ),
      subtitle: Text(
        "SubTítulo",
        style: textStyle
      ),
      trailing: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: <Widget>[
          Text(
            "Pedidos: 0 ",
            style: textStyle
          ),
          Text(
            "Gasto: 0 ",
            style: textStyle
          )
        ],
      ),
    );
  }
}