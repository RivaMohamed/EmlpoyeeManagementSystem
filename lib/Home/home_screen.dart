import 'package:employee/Home/home_controller.dart';
import 'package:employee/leave_request_screen.dart';
import 'package:flutter/material.dart';
import 'package:employee/attendance_screen.dart';
import 'package:get/get.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;
  var controller = Get.put(HomeController());

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff0B88BE);
    return AnimatedContainer(
      transform: Matrix4.translationValues(xOffset, yOffset, 0)
        ..scale(isDrawerOpen ? 0.85 : 1.00)
        ..rotateZ(isDrawerOpen ? -50 : 0),
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius:
            isDrawerOpen ? BorderRadius.circular(40) : BorderRadius.circular(0),
      ),
      child: Container(
        child: Column(
          children: <Widget>[
            const SizedBox(height: 50),
            Container(
              margin: const EdgeInsets.fromLTRB(20, 10, 0, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  isDrawerOpen
                      ? GestureDetector(
                          child: const Icon(Icons.arrow_back_ios),
                          onTap: () {
                            setState(() {
                              xOffset = 0;
                              yOffset = 0;
                              isDrawerOpen = false;
                            });
                          },
                        )
                      : GestureDetector(
                          child: const Icon(Icons.menu),
                          onTap: () {
                            setState(() {
                              xOffset = 290;
                              yOffset = 80;
                              isDrawerOpen = true;
                            });
                          },
                        ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: color,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: [
                              BoxShadow(
                                color: color.withOpacity(0.7),
                                spreadRadius: 5,
                                blurRadius: 5,
                                offset: const Offset(0, 0),
                              )
                            ]),
                        child: Column(
                          children: [
                             Row(
                              children: [
                                Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: CircleAvatar(
                                      radius: 60,
                                      backgroundImage:
                                          AssetImage('assets/profile.png'),
                                    )),
                                SizedBox(height: 16.0),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${controller.userName}',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white),
                                    ),
                                    Text(
                                      '${controller.department}',
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white60,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Padding(
                                padding: const EdgeInsets.all(15.0),
                                child: Container(
                                    child:  Column(
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Emp Code',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                        SizedBox(width: 20.0),
                                        Text('${controller.empCode}',
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),
                                    SizedBox(height: 10.0),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text('Email',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                        SizedBox(width: 20.0),
                                        Text('${controller.email}',
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 16,
                                            )),
                                      ],
                                    ),
                                  ],
                                )))
                          ],
                        ),
                      )),
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 5, 0, 5),
                    alignment: Alignment.centerLeft,
                    child: const Text('Categories',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 20)),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: InkWell(
                          onTap: () {
                            print("Leave Request");
                            Get.to(LeaveRequestScreen());
                          },
                          child: Container(
                            width: 170,
                            height: 150,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: color.withOpacity(0.7),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(0, 0),
                                  )
                                ]),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('assets/leave.png'),
                                ),
                                const SizedBox(height: 8.0),
                                const Text('Leave Request',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 15),
                        child: InkWell(
                          onTap: () {
                            print("Attendance");
                            Get.to(AttendanceScreen());
                          },
                          child: Container(
                            width: 170,
                            height: 150,
                            decoration: BoxDecoration(
                                color: color,
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: color.withOpacity(0.7),
                                    spreadRadius: 5,
                                    blurRadius: 5,
                                    offset: const Offset(0, 0),
                                  )
                                ]),
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              children: [
                                Container(
                                  width: 80,
                                  height: 80,
                                  child: Image.asset('assets/attend.png'),
                                ),
                                const SizedBox(height: 8.0),
                                const Text('Attendance',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
