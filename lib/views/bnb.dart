import 'package:flight_booking/views/booking/booking.dart';
import 'package:flight_booking/views/home/home.dart';
import 'package:flight_booking/views/inbox/inbox.dart';
import 'package:flight_booking/views/offers/offer.dart';
import 'package:flight_booking/views/profile/profile.dart';
import 'package:flutter/material.dart';

import 'offers/offer.dart';

class BNB extends StatefulWidget {
  const BNB({Key? key}) : super(key: key);

  @override
  State<BNB> createState() => _BNBState();
}

class _BNBState extends State<BNB> {
  int _currentIndex = 0;
  // ignore: non_constant_identifier_names
  final Screens=[
    const HomePage(),
    const BookingPage(),
    const OfferPage(),
    const InboxPage(),
    const ProfilePage(),

  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
           BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.wysiwyg),
              label: 'Booking'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.local_offer),
              label: 'Offer'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.message),
              label: 'Inbox'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.person),
              label: 'Profile'
          ),
        ],
        elevation: 3.0,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Color(0xffEC441E),
        currentIndex: _currentIndex,
        onTap: (int index)=> setState(() {
          _currentIndex = index;
        }),
      ),
    );
  }
}
