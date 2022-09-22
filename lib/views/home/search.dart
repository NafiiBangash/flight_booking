import 'package:flight_booking/models/search_model.dart';
import 'package:flight_booking/views/home/flight_detail.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
class Search extends StatefulWidget {
  const Search({Key? key}) : super(key: key);

  @override
  State<Search> createState() => _SearchState();
}



class _SearchState extends State<Search> {
  List<SearchModel> items = [
    SearchModel(image: 'assets/indigo.png',flight: 'IN 230',time: '0 hr 40 min',distance1: '5.50',distance2: '7.30',city1: 'DEL(Delhi)',city2: 'CCU(kolkata)',flightclass: 'Business Class',price: '\$230'),
    SearchModel(image: 'assets/indigo.png',flight: 'IN 230',time: '0 hr 40 min',distance1: '5.50',distance2: '7.30',city1: 'DEL(Delhi)',city2: 'CCU(kolkata)',flightclass: 'Business Class',price: '\$230'),
    SearchModel(image: 'assets/indigo.png',flight: 'IN 230',time: '0 hr 40 min',distance1: '5.50',distance2: '7.30',city1: 'DEL(Delhi)',city2: 'CCU(kolkata)',flightclass: 'Business Class',price: '\$230'),
  ];
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios,
            color: Colors.grey,
          ),
        ),
        title: Text(
          'Search Result',
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 15),
          height: size.height,
          width: size.width,
          child: ListView.builder(
            itemCount: items.length,
            itemBuilder: ((context, index) {
              final item = items[index];
              return buildContainer(imgPath: item.image,flightName: item.flight,time: item.time,distance1: item.distance1,distance2: item.distance2,city1: item.city1,city2: item.city2,flightClass: item.flightclass,price: item.price);
            }),),
      ),
    ),);
  }
  void selectedItem(BuildContext context,int index){
    switch(index){
      case 0:
        Navigator.push(context, MaterialPageRoute(builder: (context)=>Flight_Detail(),),);
    }
  }
}
