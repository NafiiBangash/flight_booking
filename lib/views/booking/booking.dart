import 'package:flight_booking/utils/appColors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BookingPage extends StatefulWidget {
  const BookingPage({Key? key}) : super(key: key);

  @override
  State<BookingPage> createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  TextEditingController controller = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  var _value = 5.0;
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
          'My Booking',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: AppColors.blackColor,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        height: size.height,
        width: size.width,
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(height: 20),
              Container(
                height: size.height * 0.6,
                width: size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black12,
                        blurRadius: 20,
                        offset: Offset(0.0, 3.0),
                      ),
                    ]),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 15,
                    ),
                    Container(
                      height: 64,
                      width: 96,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/indigo.png'),
                              fit: BoxFit.cover)),
                    ),
                    Divider(
                      height: 30,
                      thickness: 1.0,
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15.0),
                      height: size.height * 0.15,
                      width: size.width,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Column(
                                children: [
                                  Text(
                                    '5.50',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'DEL',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                              Slider(
                                min: 0.0,
                                max: 10.0,
                                value: _value,
                                onChanged: (val) {
                                  setState(() {
                                    _value = val;
                                  });
                                },
                              ),
                              Column(
                                children: [
                                  Text(
                                    '7.30',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w600),
                                  ),
                                  Text(
                                    'CCU',
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Indira Gandhi ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0),
                                  ),
                                  Text(
                                    'International',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0),
                                  ),
                                  Text(
                                    'Airport',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Subhash Chandra ',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0),
                                  ),
                                  Text(
                                    'Bose International',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0),
                                  ),
                                  Text(
                                    'Airport',
                                    style: TextStyle(
                                        color: Colors.grey,
                                        fontWeight: FontWeight.w300,
                                        fontSize: 12.0),
                                  ),
                                ],
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                prefixIcon: Icon(
                                  Icons.calendar_today,
                                  color: Colors.grey,
                                ),
                                hintText:
                                '${date.day}/${date.month}/${date.year}',
                                hintStyle: const TextStyle(color: Colors.black),
                                labelText: 'Date',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              onTap: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(3000),
                                );
                                if (newDate == null) {
                                  return;
                                } else {
                                  setState(() {
                                    date = newDate;
                                  });
                                }
                              },
                            ),
                          ),
                          SizedBox(width: 5.0),
                          Expanded(
                            child: TextField(
                              controller: controller,
                              decoration: InputDecoration(
                                border: OutlineInputBorder(),
                                enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                focusedBorder: OutlineInputBorder(
                                    borderSide: BorderSide(color: Colors.grey)),
                                prefixIcon: Icon(
                                  Icons.access_time,
                                  color: Colors.grey,
                                ),
                                hintText: '${time.hour}:${time.minute}',
                                hintStyle: TextStyle(color: Colors.black),
                                labelText: 'Time',
                                labelStyle: TextStyle(color: Colors.grey),
                              ),
                              onTap: () async {
                                TimeOfDay? newTime = await showTimePicker(
                                    context: context, initialTime: time);
                                if (newTime == null) return;
                                if (newTime != null) {
                                  setState(() {
                                    time = newTime;
                                  });
                                }
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Divider(
                      height: 40,
                      thickness: 1.0,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildText(text1: 'Flight',text2: 'IN 230'),
                        buildText(text1: 'Gate',text2: '22'),
                        buildText(text1: 'Seat',text2: '2B'),
                        buildText(text1: 'Class',text2: 'Economy'),
                      ],
                    ),
                    SizedBox(height: 20,),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: 40,
                        width: size.width,
                        margin: EdgeInsets.symmetric(horizontal: 15),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.0),
                          color: Color(0xffEC441E),
                        ),
                        child: Center(
                          child: Text(
                            'Modify',
                            style: TextStyle(color: Colors.white, fontSize: 18.0),
                          ),
                        ),
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
  Widget buildText({String? text1,String? text2}){
    return Column(
      children: [
        Text(
          text1!,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.grey,
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
        ),
        const SizedBox(height: 5.0),
        Text(
          text2!,
          style: GoogleFonts.inter(
            textStyle: const TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 16.0,
            ),
          ),
        ),
      ],
    );
  }
}
