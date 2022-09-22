import 'package:flight_booking/views/home/boarding_pass.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}

class _PaymentState extends State<Payment> {
  DateTime date = DateTime.now();
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
          'Payment',
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
      body: SingleChildScrollView(
        child: SizedBox(
          height: size.height,
          width: size.width,
          child: Column(
            children: [
              Container(
                height: size.height * 0.28,
                width: size.width,
                color: const Color(0xffEEEFEF),
                padding: EdgeInsets.all(15.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 24,
                          width: 48,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage('assets/indigo.png'),
                                  fit: BoxFit.cover)),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.calendar_today,
                              color: Colors.grey,
                            ),
                            TextButton(
                              onPressed: () async {
                                DateTime? newDate = await showDatePicker(
                                  context: context,
                                  initialDate: date,
                                  firstDate: DateTime(2000),
                                  lastDate: DateTime(2100),
                                );
                                if (newDate == null) return;
                                if (newDate != null) {
                                  setState(() {
                                    date = newDate;
                                  });
                                }
                              },
                              child: Text(
                                '${date.day}/${date.month}/${date.year}',
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Divider(height: size.height * 0.03, thickness: 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: const [
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
                          children: const [
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
                    Divider(height: 30.0, thickness: 1.0),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Total',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Color(0xff191919),
                              fontWeight: FontWeight.w400,
                              fontSize: 14.0,
                            ),
                          ),
                        ),
                        Text(
                          '\$230',
                          style: GoogleFonts.inter(
                            textStyle: TextStyle(
                              color: Color(0xffEC441E),
                              fontWeight: FontWeight.w600,
                              fontSize: 22.0,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    buildTextField(
                      labelText: 'Card Number',
                      hintText: '1234 5678 9',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    buildTextField(
                      labelText: 'Card holder name',
                      hintText: 'John Doe',
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: buildTextField(
                            labelText: 'CCV',
                            hintText: '000',
                          ),
                        ),
                        const SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          child: buildTextField(
                            labelText: 'Expiry date',
                            hintText: '10/22',
                          ),
                        ),
                      ],
                    ),
                     SizedBox(
                      height: size.height * 0.03,
                    ),
                    Container(
                      height: 20,
                      width: size.width * 0.36,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/Payment options.png'),
                              fit: BoxFit.contain)),
                    ),
                     SizedBox(
                      height: size.height * 0.03,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => BoardingPass(),
                          ),
                        );
                      },
                      child: Container(
                        height: size.height * 0.075,
                        width: size.width,
                        decoration: BoxDecoration(
                          color: const Color(0xffEC441E),
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
                    SizedBox(
                      height: size.height * 0.015,
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        height: size.height * 0.075,
                        width: size.width,
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color(0xffEC441E),
                          ),
                          borderRadius: BorderRadius.circular(8.0),
                        ),
                        child: const Center(
                          child: Text(
                            'Cancel',
                            style: TextStyle(
                                color: const Color(0xffEC441E),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w500),
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

  Widget buildTextField({String? labelText, String? hintText}) {
    return TextFormField(
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        focusedBorder: const UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelText: labelText,
        labelStyle: const TextStyle(color: Colors.black),
        hintText: hintText,
      ),
    );
  }
}
