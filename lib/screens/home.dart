
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:livestreaming/screens/metingScreen.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  int _page = 0;

List<Widget> pages=[
Metingscreen(),
const Center(
  child: Text('Page 2'),
),
Center(
  child: Text('Page 3'),
),
const Center(
  child: Text('Page 4'),
)
];
onPageChange(int page){
  setState(() {
    _page = page;
  });
}
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: const Text('Meet and Chat'),
        centerTitle: true,
      ),

      body:pages[_page],
      bottomNavigationBar:BottomNavigationBar(
        onTap:onPageChange,
        currentIndex: _page,
        type: BottomNavigationBarType.shifting,
        selectedFontSize: 14,
        selectedItemColor: Colors.yellow,
        unselectedItemColor: const Color.fromARGB(255, 155, 155, 14),
        backgroundColor: Colors.white,
        unselectedFontSize:14,


        items: const [
          
          
     BottomNavigationBarItem(icon: Icon(Icons.comment_bank),label: 'Meet & chat'),

     BottomNavigationBarItem(icon: Icon(Icons.lock_clock) ,label: '  Meeting'),
     BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: 'Contacts'),
     BottomNavigationBarItem(icon: Icon(Icons.settings),label: 'Settings'),
        ]
        
        )
      
    );
  }
}