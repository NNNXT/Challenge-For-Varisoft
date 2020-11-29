import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:opentalk/src/screen/homePage.dart';
import 'package:opentalk/src/screen/listChatPage.dart';

class LandingPage extends StatefulWidget {
  final int selectedPage;
  LandingPage(
    this.selectedPage
  );
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  int _selectedIndex;
  @override
  void initState() {
    super.initState();
    _selectedIndex = this.widget.selectedPage;
  }
  static TextStyle optionStyle = TextStyle(fontSize: 30, fontWeight: FontWeight.bold);
  static List<Widget> _widgetOptions = <Widget>[
    HomePage(),
    ListChatPage(),
    Text(
      'Setting Page',
      style: optionStyle,
    ),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            activeIcon: imageIcon('assets/icons/homeActive.png'),
            icon: imageIcon('assets/icons/homeInactive.png'),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            activeIcon: imageIcon('assets/icons/chatActive.png'),
            icon: imageIcon('assets/icons/chatInactive.png'),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            activeIcon: imageIcon('assets/icons/settingActive.png'),
            icon: imageIcon('assets/icons/settingInactive.png'),
            label: 'Settings',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Color(0xFF007AFF),
        onTap: _onItemTapped,
      ),
    );
  }

  Widget imageIcon(path) {
    return Image.asset(path,width: MediaQuery.of(context).size.width * 0.06);
  }
}