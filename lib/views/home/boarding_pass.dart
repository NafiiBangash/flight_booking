import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BoardingPass extends StatefulWidget {
  const BoardingPass({Key? key}) : super(key: key);

  @override
  State<BoardingPass> createState() => _BoardingPassState();
}

class _BoardingPassState extends State<BoardingPass> {
  var _value = 5.0;
  TextEditingController controller = TextEditingController();
  DateTime date = DateTime.now();
  TimeOfDay time = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    Size size= MediaQuery.of(context).size;
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
          'Boarding Pass',
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
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.symmetric(horizontal: 15.0),
          child: Column(
            children: [
              const SizedBox(height: 20,),
              Row(
                children: [
                  Container(
                    height: 50,
                    width: 50,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/Picture.png'),
                        fit: BoxFit.cover
                      )
                    ),
                  ),
                  const SizedBox(width: 10.0,),
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'Mr. John Doe',
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 16,
                                fontWeight: FontWeight.w600
                              ),
                            ),
                            Text(
                              'Passenger',
                              style: TextStyle(
                                  color: Colors.grey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 42,
                          width: 63,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage('assets/indigo.png'),
                              fit: BoxFit.contain
                            )
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              const Divider(height: 40.0,thickness: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
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
              const SizedBox(
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
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
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
                          color: Colors.black,
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
                          color: Colors.black,
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
              const SizedBox(
                height: 20,
              ),
              const Divider(height: 30.0,thickness: 1.0),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  buildText(text1: 'Flight',text2: 'IN 230'),
                  buildText(text1: 'Gate',text2: '22'),
                  buildText(text1: 'Seat',text2: '2B'),
                  buildText(text1: 'Class',text2: 'Economy'),
                ],
              ),
              const Divider(height: 40.0,thickness: 1.0),
              Container(
                height: 63.0,
                width: size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/Frame 2357.png'),
                    fit: BoxFit.fill
                  )
                ),
              ),
              SizedBox(height: 30.0,),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 56,
                  width: size.width,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: Color(0xffEC441E),
                  ),
                  child: Center(
                    child: Text(
                      'Download',
                      style: TextStyle(color: Colors.white, fontSize: 18.0),
                    ),
                  ),
                ),
              ),
              TextButton(onPressed: (){}, child: Text(
                'Book another flight',
                style: GoogleFonts.inter(
                  textStyle: const TextStyle(
                    color: Color(0xffEC441E),
                    fontWeight: FontWeight.w400,
                    fontSize: 16.0,
                  ),
                ),
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
