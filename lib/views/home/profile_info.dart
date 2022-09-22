import 'package:flight_booking/views/home/payment.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProfileInfo extends StatefulWidget {
  const ProfileInfo({Key? key}) : super(key: key);

  @override
  State<ProfileInfo> createState() => _ProfileInfoState();
}

class _ProfileInfoState extends State<ProfileInfo> {
  var value ='Please choose a location';
  final items =[
    'Pakistan',
    'India',
    'USA'
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
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
          'Personal Info',
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
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(horizontal: 15.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 20,
              ),
              Container(
                height: 68,
                width: 68,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(34.0),
                    image: DecorationImage(
                        image: AssetImage('assets/Picture.png'),
                        fit: BoxFit.cover)),
              ),
              SizedBox(
                height: 5.0,
              ),
              Text(
                'Hello Traveller',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildTextField(
                  labelText: 'Name',
                  hintText: 'Enter your name here',
                  imgPth: 'assets/Name.png'),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildTextField(
                  labelText: 'Address',
                  hintText: 'Enter your address',
                  imgPth: 'assets/map.png'),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildTextField(
                  labelText: 'Passport',
                  hintText: 'ED 12345 678',
                  imgPth: 'assets/Group.png'),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildTextField(
                  labelText: 'DOB',
                  hintText: 'DD/MM/YYY',
                  imgPth: 'assets/Dob.png',
                  icon: Icons.calendar_today),
              SizedBox(
                height: size.height * 0.02,
              ),
              buildTextField(
                  labelText: 'Country',
                  hintText: 'Country',
                  imgPth: 'assets/globe.png',
              ),
              SizedBox(
                height: size.height * 0.02,
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Payment(),
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
              SizedBox(
                height: size.height * 0.01,
              ),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Skip',
                  style: TextStyle(
                      color: Color(0xffEC441E),
                      fontSize: 16,
                      fontWeight: FontWeight.w400),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(
      {String? labelText, String? hintText, String? imgPth, IconData? icon}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: hintText,
        labelText: labelText,
        suffixIcon: Icon(icon, color: Colors.grey),
        prefixIcon: Container(
          height: 8.0,
          width: 8.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgPth!),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
  Widget buildAnotherTextField(
      {String? labelText, String? hintText, String? imgPth}) {
    return TextFormField(
      decoration: InputDecoration(
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8.0),
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
            style: BorderStyle.solid,
          ),
        ),
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: hintText,
        labelText: labelText,
        suffix: DropdownButton<String>(
          onChanged: (newValue){
            setState(() {
              value = newValue.toString();
            });
          },
          items: items.map((String valueItem) {
            return DropdownMenuItem<String>(
              child: Text(valueItem),
              value: valueItem,
            );
          }).toList(),
        ),
        prefixIcon: Container(
          height: 8.0,
          width: 8.0,
          margin: EdgeInsets.all(10.0),
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(imgPth!),
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
