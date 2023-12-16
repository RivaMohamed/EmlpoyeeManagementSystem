import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:intl/intl.dart';

class LeaveRequestScreen extends StatefulWidget {
  const LeaveRequestScreen({Key? key});

  @override
  State<LeaveRequestScreen> createState() => _LeaveRequestScreenState();
}

class _LeaveRequestScreenState extends State<LeaveRequestScreen> {
  DateTime today = DateTime.now();
  DateTime staticToday = DateTime.now();
  TimeOfDay? selectedTime;
  TimePickerEntryMode entryMode = TimePickerEntryMode.dial;
  Orientation? orientation;
  MaterialTapTargetSize tapTargetSize = MaterialTapTargetSize.padded;
  bool use24HourTime = false;
  bool isLeaveRequestSubmitted = false;

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    setState(() {
      today = day;
    });
  }

  void _onTimeSelected(TimeOfDay time) {
    setState(() {
      selectedTime = time;
    });
  }

  void _onViewPressed() {
    openDialog();
  }

  void _onLeaveRequestSubmitted() {
    setState(() {
      isLeaveRequestSubmitted = true;
    });
    openDialog();
  }

  @override
  Widget build(BuildContext context) {
    const color = Color(0xff0B88BE);
    bool hasLeaveRequest = selectedTime != null;

    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: Text(
            "Leave Request",
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
        child: Column(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  'Rahma Mohamed',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                Text(
                  'CS Department',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Text("Selected Day is ${DateFormat('yyyy-MM-dd').format(today)}"),
            TableCalendar(
              calendarStyle: CalendarStyle(
                selectedDecoration: const BoxDecoration(
                  color: color,
                  shape: BoxShape.circle,
                ),
                todayDecoration: BoxDecoration(
                  color: color.withOpacity(0.5),
                  shape: BoxShape.circle,
                ),
              ),
              locale: "en_US",
              rowHeight: 45,
              headerStyle: const HeaderStyle(
                formatButtonVisible: false,
                titleCentered: true,
              ),
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, today),
              focusedDay: today,
              firstDay: DateTime.utc(2023, 9, 1),
              lastDay: DateTime.utc(2025, 7, 30),
              onDaySelected: _onDaySelected,
            ),
            const SizedBox(height: 20),
            InkWell(
              onTap: isLeaveRequestSubmitted ? null : _onLeaveRequestSubmitted,
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(50),
                  boxShadow: [
                    BoxShadow(
                      color: color.withOpacity(0.3),
                      spreadRadius: 5,
                      blurRadius: 5,
                      offset: const Offset(0, 0),
                    )
                  ],
                ),
                child: const Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(12.0),
                      child: Text(
                        'Create leave request',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            if (hasLeaveRequest)
              Column(
                children: [
                  const Text(
                    'My leave request',
                    style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      height: 70,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade600,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.white12.withOpacity(0.9),
                            spreadRadius: 5,
                            blurRadius: 5,
                            offset: const Offset(0, 0),
                          )
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(
                                  DateFormat('EEE dd MMM, yyyy')
                                      .format(staticToday),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                                Text(
                                  selectedTime != null
                                      ? selectedTime!.format(context)
                                      : '',
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 16,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextButton(
                              onPressed: _onViewPressed,
                              child: const Text(
                                'View',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Future openDialog() => showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Apply Leave'),
          content: InkWell(
            onTap: () async {
              final TimeOfDay? time = await showTimePicker(
                context: context,
                initialTime: selectedTime ?? TimeOfDay.now(),
                initialEntryMode: entryMode,
                orientation: orientation,
                builder: (BuildContext context, Widget? child) {
                  return Theme(
                    data: Theme.of(context).copyWith(
                      materialTapTargetSize: tapTargetSize,
                    ),
                    child: MediaQuery(
                      data: MediaQuery.of(context).copyWith(
                        alwaysUse24HourFormat: use24HourTime,
                      ),
                      child: child!,
                    ),
                  );
                },
              );
              _onTimeSelected(time!);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.5),
              ),
              child: const Padding(
                padding: EdgeInsets.fromLTRB(10, 5, 10, 5),
                child: Row(
                  children: [
                    Text('Leave At'),
                    SizedBox(width: 5),
                    Icon(Icons.access_time_outlined),
                  ],
                ),
              ),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                showDialog(
                  context: context,
                  builder: (context) => AlertDialog(
                    title: Center(child: Text('Request Submitted')),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        child: Text('OK'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text('SUBMIT'),
            )
          ],
        ),
      );
}
