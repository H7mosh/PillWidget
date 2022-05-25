
import 'dart:ffi';
import 'package:flutter/material.dart';

class BillWidget extends StatelessWidget {
  String text;
  BillWidget({required this.text});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      width: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(25.0),
        color: Colors.grey.shade100,
      ),
      child:Center(child:Text(text)),
    );
  }
}

