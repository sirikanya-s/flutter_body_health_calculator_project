// ignore_for_file: sort_child_properties_last
 
import 'package:flutter/material.dart';
 
class BmiUI extends StatefulWidget {
  const BmiUI({super.key});
 
  @override
  State<BmiUI> createState() => _BmiUIState();
}
 
class _BmiUIState extends State<BmiUI> {
  // สร้างตัวควบคุม TextField
  TextEditingController weightCtrl = TextEditingController();
  TextEditingController heightCtrl = TextEditingController();
 
  // สร้างตัวแปรแสดงค่า BMI กับการแปลผล
  String showBMI = '0.00';
  String showResult = 'การแปรผล';
 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(55),
          child: Center(
            child: Column(
              children: [
                Text(
                  'คำนวณหาค่าดัชนีมวลกาย (BMI)',
                  style: TextStyle(
                    fontSize: MediaQuery.of(context).size.width * 0.055,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Image.asset(
                  'assets/images/bmi.png',
                  width: MediaQuery.of(context).size.width * 0.35,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'น้ำหนัก (kg.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: weightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'กรอกน้ำหนักของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'ส่วนสูง (cm.)',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.01,
                ),
                TextField(
                  controller: heightCtrl,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: 'กรอกส่วนสูงของคุณ',
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.028,
                ),
                ElevatedButton(
                  onPressed: () {
                      // Validate input ก่อนแล้วค่อยคำนวณและแสดงผล
                      // ตรวจสอบป้อนน้ำหนัก
                      if (weightCtrl.text.isEmpty == true) {
                        // แสดงข้อความเตือนด้วย SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('กรุณากรอกน้ำหนักของคุณด้วย !!!'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      // ตรวจสอบป้อนส่วนสูง
                      if (heightCtrl.text.isEmpty == true) {
                        // แสดงข้อความเตือนด้วย SnackBar
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(
                            content: Text('กรุณากรอกส่วนสูงของคุณด้วย !!!'),
                            backgroundColor: Colors.red,
                            duration: Duration(seconds: 2),
                          ),
                        );
                        return;
                      }
                      // คำนวณ BMI และแสดงผลพร้อมแปลผล
                      // แปลงน้ำหนักและส่วนสูงเป็นค่าเป็นตัวเลขก่อน
                      double weight = double.parse( weightCtrl.text );
                      double height = double.parse( heightCtrl.text );
                      double bmi = weight / ((height/100) * (height/100));
                      // นำค่า BMI ที่คำนวณได้ไปแสดงพร้อมกับการแปรผล
                      // *** โค้ดคำสั่งการทำงานที่มีผลต่อการแสดงผลต้องเขียนอยู่ภายใต้คำสั่ง setState() ***
                      setState(() {
                          // เอาค่า BMI ที่คำนวณได้ไปกำหนดให้กับตัวแปร showBMI แต่ต้องเป็น string และกำหนดทศนิยมก่อน
                          showBMI = bmi.toStringAsFixed(2);
                          // แปรผล BMI
                          if(bmi < 18.5){
                            showResult = 'น้ำหนักต่ำกว่าเกณฑ์';
                          }else if(bmi < 22.9){
                            showResult = 'น้ำหนักสมส่วน';
                          }else if(bmi < 24.9){
                            showResult = 'น้ำหนักเกิน';
                          }else if(bmi < 29.9){
                            showResult = 'โรคอ้วนระดับ 1';
                          }else{
                            showResult = 'โรคอ้วนระดับ 2';
                          }
                      });
                  },
                  child: Text(
                    'คำนวณ BMI',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.015,
                ),
                ElevatedButton(
                  onPressed: () {
                    // เคลียร์ข้อมูล ให้หน้าจอเหมือนกับตอนที่เปิดเข้ามาใหม่
                    setState(() {
                      weightCtrl.text = '';
                      heightCtrl.text = '';
                      showBMI = '0.00';
                      showResult = 'การแปรผล';
                    });
 
                  },
                  child: Text(
                    'ล้างข้อมูล',
                    style: TextStyle(
                      fontSize: MediaQuery.of(context).size.width * 0.045,
                      color: Colors.white,
                    ),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.grey,
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      MediaQuery.of(context).size.height * 0.07,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.025,
                ),
                // แสดงผล BMI
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.18,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.green[100],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'BMI',
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        showBMI,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.1,
                          fontWeight: FontWeight.bold,
                          color: Colors.lightGreen,
                        ),
                      ),
                      Text(
                        showResult,
                        style: TextStyle(
                          fontSize: MediaQuery.of(context).size.width * 0.045,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}