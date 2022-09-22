import 'package:flutter/material.dart';

Widget buildText({String? seatNo}){
  return Center(
    child: Text(
      seatNo!,
      style:  const TextStyle(
        color: Colors.black,
        fontSize: 16,
        fontWeight: FontWeight.w500
      ),
    ),
  );
}