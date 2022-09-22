import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget buildListTile({String? imgPath,String? title}){
    return ListTile(
      onTap: (){},
      leading: Container(
        height: 20,
        width: 20,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(imgPath!),
            fit: BoxFit.fill
          ),
        ),
      ),
      title: Text(
        title!,
        style: GoogleFonts.inter(
          textStyle: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.w500,
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }