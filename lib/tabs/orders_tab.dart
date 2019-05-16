import 'package:flutter/material.dart';
import 'package:gerencia_loja/widgets/order_tile.dart';

class OrdersTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 16),
      child: ListView.builder(
        itemCount: 6,
        itemBuilder: (context, index){
          return OrderTile();
        },
      ),
    );
  }
}