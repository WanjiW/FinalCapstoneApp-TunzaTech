import 'package:flutter/material.dart';


class MyBottomNavigationBar extends StatefulWidget {

  // key features of the constructor, for when its declared a part of the bottomnavbar feature of the scaffold
  final int currentIndex;
  final Function onTap;

  MyBottomNavigationBar({
    required this.currentIndex,
    required this.onTap,
  });


  @override
  State<MyBottomNavigationBar> createState() => _MyBottomNavigationBarState();

}


class _MyBottomNavigationBarState extends State<MyBottomNavigationBar> {

  // initialise current index like this so that it can highlight the section you're on and not default to one
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    _currentIndex = widget.currentIndex;
  }

  // int index is VERY important, it lets it change page by page
  // prev: I did _currentIndex = _currentIndex, which meant my indexes were not updating so I couldn't move between pages

  void _onItemTapped(int index) {

    setState(() {
      _currentIndex = index;
    });

    switch (_currentIndex) {
      case 0:
        Navigator.pushNamed(context, '/pwdinfo');
        break;
      case 1:
        Navigator.pushNamed(context, '/homepage');
        break;
      case 2:
        Navigator.pushNamed(context, '/importantcontacts');
        break;
      default:
        break;
    }

    }



  // design of the nav bar
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: _currentIndex,
      onTap: _onItemTapped,
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.info_rounded, color: Colors.black),
          label: 'Info',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.home_rounded, color: Colors.black),
          label: 'Home',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.contacts_rounded, color: Colors.black),
          label: 'Important Contacts',
        ),
      ],
    );
  }
}


