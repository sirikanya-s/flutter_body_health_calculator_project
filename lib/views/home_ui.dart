import 'package:flutter/material.dart';
import 'package:flutter_body_health_calculator_project/views/about.ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmi_ui.dart';
import 'package:flutter_body_health_calculator_project/views/bmr_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeUi extends StatefulWidget {
  const HomeUi({super.key});

  @override
  State<HomeUi> createState() => _HomeUiState();
}

class _HomeUiState extends State<HomeUi> {
// สร้างตัวแปรเก็บ Index ของรายการที่เลือก
  int _currentIndex = 1;

  // สร้างตัวแปรแบบ List คือ ตัวแปร 1 ตัวเก็บได้มากกว่า 1 ข้อมูลเหมือน Array
  List subViewShow = [
    BmiUi(),
    AboutUI(),
    BmrUi(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      //  ส่วนของ App Bar
      appBar: AppBar(
        backgroundColor: Colors.lightGreen,
        title: Text(
          'Body ว้าว',
          style: TextStyle(),
        ),
        centerTitle: true,
      ),
      //  ส่วนของ BottomNavigationBar ()
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          // ** โค้ดอะไรก็ตามที่มีผลต่อการแสดงผลบนหน้าจอ
          setState(() {
            _currentIndex = value;
          });
        },
        currentIndex: _currentIndex,
        selectedItemColor: Colors.lightGreen,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'BMI',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: FaIcon(FontAwesomeIcons.heartCircleCheck),
            label: 'BMR',
          )
        ],
      ),
      //  ส่วนของ body
      body: subViewShow[_currentIndex], // ส่วนของ body จะแสดงตามค่าที่เลือกใน BottomNavigationBar
    );
  }
}
