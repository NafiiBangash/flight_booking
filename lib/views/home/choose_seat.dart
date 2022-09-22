import 'dart:core';
import 'package:flight_booking/models/seat_model.dart';
import 'package:flight_booking/utils/appColors.dart';
import 'package:flight_booking/views/home/profile_info.dart';
import 'package:flight_booking/widgets/home_widgets/seat_widget.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ChooseSeat extends StatefulWidget {
  const ChooseSeat({Key? key}) : super(key: key);

  @override
  State<ChooseSeat> createState() => _ChooseSeatState();
}

class _ChooseSeatState extends State<ChooseSeat> {
  int current = 0;
  int seatvalue = 0;
  List<String> items = ['Selected', 'Emergency Exit', 'Reserved'];
  List<SeatModel> SeatNo = [
    SeatModel(SNO: '1A'),
    SeatModel(SNO: '1B'),
    SeatModel(SNO: '1C'),
    SeatModel(SNO: '1D'),
    SeatModel(SNO: '2A'),
    SeatModel(SNO: '2B'),
    SeatModel(SNO: '2C'),
    SeatModel(SNO: '2D'),
    SeatModel(SNO: '3A'),
    SeatModel(SNO: '3B'),
    SeatModel(SNO: '3C'),
    SeatModel(SNO: '3D'),
    SeatModel(SNO: '4A'),
    SeatModel(SNO: '4B'),
    SeatModel(SNO: '4C'),
    SeatModel(SNO: '4D'),
    SeatModel(SNO: '5A'),
    SeatModel(SNO: '5B'),
    SeatModel(SNO: '5C'),
    SeatModel(SNO: '5D'),
    SeatModel(SNO: '6A'),
    SeatModel(SNO: '6B'),
    SeatModel(SNO: '6C'),
    SeatModel(SNO: '6D'),
    SeatModel(SNO: '7A'),
    SeatModel(SNO: '7B'),
    SeatModel(SNO: '7C'),
    SeatModel(SNO: '7D'),
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
          'Choose Seat',
          style: GoogleFonts.inter(
            textStyle: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 20.0,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: SizedBox(
        height: size.height,
        width: size.width,
        child: Column(
          children: [
            const SizedBox(height: 20),
            Container(
              height: size.height * 0.06,
              width: size.width,
              padding: EdgeInsets.symmetric(horizontal: 15.0),
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: items.length,
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      current = index;
                    });
                  },
                  child: Container(
                    height: 25,
                    width: size.width * 0.3,
                    margin: EdgeInsets.only(
                        left: index == 0 ? 5.0 : size.width * 0.032),
                    child: Row(
                      children: [
                        Container(
                          height: 12,
                          width: 12,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6.0),
                            color: current == index
                                ? Color(0xffEC441E)
                                : Colors.black26,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Expanded(
                          child: Text(
                            items[index],
                            style: TextStyle(
                              color: Colors.grey,
                              fontSize: 14,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                width: size.width,
                child: Stack(
                  children: [
                    Positioned(
                      child: Container(
                        width: size.width,
                        child: Image.asset('assets/Intersect.png'),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.05,
                      left: size.width * 0.28,
                      child: Container(
                        height: size.height * 0.1,
                        width: size.width * 0.43,
                        child: Image.asset('assets/Frame 2294.png'),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.18,
                      left: size.width * 0.2,
                      child: SizedBox(
                        height: size.height,
                        width: size.width * 0.6,
                        child: GridView.builder(
                          shrinkWrap: true,
                          scrollDirection: Axis.vertical,
                          itemCount: SeatNo.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  ),
                          itemBuilder: (context, index) {
                            final No = SeatNo[index];
                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  seatvalue = index;
                                });
                              },
                              child: Container(
                                margin: const EdgeInsets.all(5.0),
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8.0),
                                    color: seatvalue == index
                                        ? AppColors.primaryColor
                                        : Colors.black12),
                                child: buildText(seatNo: No.SNO),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.4,
                      left: size.width * 0.01,
                      child: Container(
                        height: size.height * 0.23,
                        width: size.width * 0.1,
                        child: Image.asset('assets/Rectangle 594.png'),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.4,
                      right: size.width * 0.01,
                      child: Container(
                        height: size.height * 0.23,
                        width: size.width * 0.1,
                        child: Image.asset('assets/Rectangle 593.png'),
                      ),
                    ),
                    Positioned(
                      top: size.height * 0.7,
                      left: size.width * 0.2,
                      right: size.width * 0.2,
                      child: GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ProfileInfo(),
                            ),
                          );
                        },
                        child: Container(
                          height: size.height * 0.075,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: Color(0xffEC441E),
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                          child: const Center(
                            child: Text(
                              'Confirm',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w500),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
