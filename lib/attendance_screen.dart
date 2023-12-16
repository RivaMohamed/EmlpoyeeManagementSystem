import 'package:flutter/material.dart';

class AttendanceScreen extends StatefulWidget {
  const AttendanceScreen({super.key});

  @override
  State<AttendanceScreen> createState() => _AttendanceScreenState();
}

class _AttendanceScreenState extends State<AttendanceScreen> {
  final List<Map<String, String>> data = [
    {"Day": "01", "Time": "10:10", "Attend": "Yes", "Late": "-"},
    {"Day": "02", "Time": "10:20", "Attend": "Yes", "Late": "-"},
    {"Day": "03", "Time": "10:20", "Attend": "Yes", "Late": "-"},
    {"Day": "04", "Time": "10:30", "Attend": "Yes", "Late": "-"},
    {"Day": "05", "Time": "10:40", "Attend": "-", "Late": "Yes"},
    {"Day": "06", "Time": "10:00", "Attend": "Yes", "Late": "-"},
    {"Day": "07", "Time": "10:33", "Attend": "-", "Late": "Yes"},
    {"Day": "08", "Time": "10:00", "Attend": "Yes", "Late": "-"},
    {"Day": "09", "Time": "10:43", "Attend": "-", "Late": "Yes"},
    {"Day": "10", "Time": "10:10", "Attend": "Yes", "Late": "-"},
    {"Day": "11", "Time": "10:07", "Attend": "Yes", "Late": "-"},
    {"Day": "12", "Time": "10:00", "Attend": "Yes", "Late": "-"},
    {"Day": "13", "Time": "10:31", "Attend": "-", "Late": "Yes"},
    {"Day": "14", "Time": "10:05", "Attend": "Yes", "Late": "-"},
    {"Day": "15", "Time": "10:32", "Attend": "-", "Late": "Yes"},
    {"Day": "16", "Time": "10:05", "Attend": "Yes", "Late": "-"},
  ];

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff0B88BE);
    const boldWhiteTextStyle = TextStyle(
        fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white);
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Attendance",
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        actions: const [
          CircleAvatar(
            radius: 30,
            backgroundImage: AssetImage('assets/profile.png'),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height -
              MediaQuery.of(context).padding.top,
          child: Column(
            children: [
              const SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Container(
                  height: 90,
                  decoration: BoxDecoration(
                      color: color,
                      borderRadius: BorderRadius.circular(10),
                      boxShadow: [
                        BoxShadow(
                          color: color.withOpacity(0.3),
                          spreadRadius: 5,
                          blurRadius: 5,
                          offset: const Offset(0, 0),
                        )
                      ]),
                  child: const Column(
                    children: [
                      const SizedBox(height: 3),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'December',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 5),
                          Text(
                            '2023',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            children: [
                              Text('Fri', style: boldWhiteTextStyle),
                              Text('01', style: boldWhiteTextStyle),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Sat', style: boldWhiteTextStyle),
                              Text('02', style: boldWhiteTextStyle),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Sun', style: boldWhiteTextStyle),
                              Text('03', style: boldWhiteTextStyle),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Mon', style: boldWhiteTextStyle),
                              Text('04', style: boldWhiteTextStyle),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Tue', style: boldWhiteTextStyle),
                              Text('05', style: boldWhiteTextStyle),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Wed', style: boldWhiteTextStyle),
                              Text('06', style: boldWhiteTextStyle),
                            ],
                          ),
                          Column(
                            children: [
                              Text('Thu', style: boldWhiteTextStyle),
                              Text('07', style: boldWhiteTextStyle),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 10, 15, 10),
                child: Column(
                  children: [
                    const Text(
                      'Monthly Attendance Details',
                      style: TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 20),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: color.withOpacity(0.3),
                              spreadRadius: 5,
                              blurRadius: 5,
                              offset: const Offset(0, 0),
                            )
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Container(
                          child: SingleChildScrollView(
                            child: Column(
                              children: [
                                Table(
                                    border:
                                        TableBorder.all(color: Colors.white),
                                    children: const [
                                      TableRow(children: [
                                        Text('Day',
                                            style: boldWhiteTextStyle,
                                            textAlign: TextAlign.center),
                                        Text('Time',
                                            style: boldWhiteTextStyle,
                                            textAlign: TextAlign.center),
                                        Text('Attend',
                                            style: boldWhiteTextStyle,
                                            textAlign: TextAlign.center),
                                        Text('Late',
                                            style: boldWhiteTextStyle,
                                            textAlign: TextAlign.center),
                                      ]),
                                    ]),
                                Column(
                                  children: [
                                    for (var item in data)
                                      Table(
                                        border: TableBorder.all(
                                            color: Colors.white),
                                        children: [
                                          TableRow(children: [
                                            Text(item["Day"]!,
                                                style: boldWhiteTextStyle,
                                                textAlign: TextAlign.center),
                                            Text(item["Time"]!,
                                                style: boldWhiteTextStyle,
                                                textAlign: TextAlign.center),
                                            Text(item["Attend"]!,
                                                style: boldWhiteTextStyle,
                                                textAlign: TextAlign.center),
                                            Text(item["Late"]!,
                                                style: boldWhiteTextStyle,
                                                textAlign: TextAlign.center),
                                          ]),
                                        ],
                                      ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
