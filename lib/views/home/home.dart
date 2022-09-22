import 'package:flight_booking/controllers/home_controller.dart';
import 'package:flight_booking/views/home/search.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:country_state_city_picker/country_state_city_picker.dart';

import '../../widgets/home_widgets/home_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String countryValue = '';
  String stateValue = '';
  String cityValue = '';
  int current = 0;
  List<String> items = [
    'One way',
    'Round',
    'Multicity',
  ];
  DateTime date = DateTime.now();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Book Flight',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              Scaffold.of(context).openEndDrawer();
            },
            icon: Icon(
              Icons.menu,
              color: Colors.black,
            ),
          ),
        ],
      ),
      endDrawer: Drawer(
        child: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Icon(
                      Icons.close,
                      color: Colors.black,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Container(
                        height: 34,
                        width: 34,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(17.0),
                          image: DecorationImage(
                            image: AssetImage('assets/Picture.png'),
                            fit: BoxFit.cover
                          )
                        ),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.grey,
                                fontWeight: FontWeight.w400,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                          Text(
                            'John Doe',
                            style: GoogleFonts.inter(
                              textStyle: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.w500,
                                fontSize: 16.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Divider(height: 40.0,thickness: 1.0),
                  buildListTile(imgPath: 'assets/Bookings.png',title: 'My Booking'),
                  buildListTile(imgPath: 'assets/Ticket.png',title: 'Boarding Pass'),
                  buildListTile(imgPath: 'assets/Support.png',title: 'Support'),
                  buildListTile(imgPath: 'assets/Rate.png',title: 'Rate us'),
                  const Divider(height: 40.0,thickness: 1.0),
                  buildListTile(imgPath: 'assets/AirplaneInFlight.png',title: 'Flight'),
                  buildListTile(imgPath: 'assets/Hotel.png',title: 'Hotel'),
                  buildListTile(imgPath: 'assets/Bus.png',title: 'Bus'),
                  buildListTile(imgPath: 'assets/Travel.png',title: 'Tour'),
                  buildListTile(imgPath: 'assets/Bank.png',title: 'Travel loan'),
                  Text(
                    'App Version 1.0.1',
                    style: GoogleFonts.inter(
                      textStyle: TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.w400,
                        fontSize: 14.0,
                      ),
                    ),
                  ),


                ],
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 10,
              ),
              Container(
                height: 32,
                width: size.width * 0.81,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(32.0),
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 30.0,
                        spreadRadius: 3.0),
                  ],
                ),
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: items.length,
                  itemBuilder: (context, index) => GestureDetector(
                    onTap: () {
                      setState(() {
                        current = index;
                      });
                    },
                    child: Container(
                      height: size.height * 0.03,
                      width: current == index ? size.width * 0.2 : size.width * 0.265,
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(32.0),
                        color: current == index
                            ? const Color(0xffEC441E)
                            : Colors.transparent,
                      ),
                      child: Center(
                        child: Text(
                          items[index],
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color:
                                  current == index ? Colors.white : Colors.grey,
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: size.height * 0.48,
                width: size.width,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  color: Colors.white,
                  boxShadow: [
                    const BoxShadow(
                        color: Colors.black12,
                        offset: Offset(0.0, 10.0),
                        blurRadius: 30.0,
                        spreadRadius: 3.0),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0,vertical: 10.0),
                  child: Column(
                    children: [
                      SelectState(onCountryChanged: (value) {
                        setState(() {
                          countryValue = value;
                        });
                      }, onStateChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      }, onCityChanged: (value) {
                        setState(() {
                          stateValue = value;
                        });
                      }),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: HomeController.departureController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  prefixIcon: const Icon(
                                    Icons.calendar_today,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Departure',
                                  labelStyle: const TextStyle(color: Colors.grey),
                                  hintText:
                                      '${date.day}/${date.month}/${date.year}',
                                  hintStyle: TextStyle(color: Colors.black)),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );
                                if (pickedDate == null) return;
                                if (pickedDate != null) {
                                  setState(() {
                                    date = pickedDate;
                                  });
                                }
                              },
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            child: TextField(
                              controller: HomeController.returnController,
                              decoration: InputDecoration(
                                  border: const OutlineInputBorder(),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide: BorderSide(color: Colors.grey)),
                                  prefixIcon: const Icon(
                                    Icons.add,
                                    color: Colors.grey,
                                  ),
                                  labelText: 'Return',
                                  labelStyle: const TextStyle(color: Colors.grey),
                                  hintText:
                                      '${date.day}/${date.month}/${date.year}',
                                  hintStyle: const TextStyle(color: Colors.black)),
                              onTap: () async {
                                DateTime? pickedDate = await showDatePicker(
                                  context: context,
                                  initialDate: DateTime.now(),
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );
                                if (pickedDate == null) return;
                                if (pickedDate != null) {
                                  setState(() {
                                    date = pickedDate;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                       SizedBox(
                        height: size.height * 0.01,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: HomeController.travellerController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                ),
                                labelText: 'Traveller',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5.0),
                          Expanded(
                            child: TextField(
                              controller: HomeController.classController,
                              decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                labelText: 'Class',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                            ),
                          ),
                        ],
                      ),
                       SizedBox(height: size.height * 0.015,),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>  const Search(),
                            ),
                          );
                        },
                        child: Container(
                          height: 48,
                          width: size.width,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8.0),
                            color: const Color(0xffEC441E),
                          ),
                          child: const Center(
                            child: Text(
                              'Search',
                              style: TextStyle(fontSize: 18, color: Colors.white),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 10.0,
                    ),
                    const Divider(height: 20, thickness: 1.0,indent: 15.0,endIndent: 15.0),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Hot offer',
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w600,
                              fontSize: 18.0,
                            ),
                          ),
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              'See All',
                              style: TextStyle(
                                color: Color(0xffEC441E),
                                fontWeight: FontWeight.w500,
                                fontSize: 14.0,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: size.height * 0.15,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: [
                          Image.asset('assets/frame1.png'),
                          Image.asset('assets/frame1.png'),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
