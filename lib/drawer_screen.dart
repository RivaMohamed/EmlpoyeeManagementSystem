import 'package:employee/attendance_screen.dart';
import 'package:employee/change_password_screen.dart';
import 'package:employee/leave_request_screen.dart';
import 'package:employee/profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  double xOffset = 0;
  double yOffset = 0;
  bool isDrawerOpen = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueGrey,
      child: Padding(
        padding: const EdgeInsets.only(top: 50, left: 40, bottom: 70),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Column(
              children: <Widget>[
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                   Get.to(ProfileScreen());
                  },
                  child: const NewRow(
                    text: 'Profile',
                    icon: Icons.person_outline,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(AttendanceScreen());
                  },
                  child: const NewRow(
                    text: 'Attendance',
                    icon: Icons.event_note_outlined,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    Get.to(LeaveRequestScreen());
                  },
                  child: const NewRow(
                    text: 'Leave Request',
                    icon: Icons.logout_outlined,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                   Get.to(ChangePasswordScreen());
                  },
                  child: const NewRow(
                    text: 'Change Password',
                    icon: Icons.lock_reset_outlined,
                  ),
                ),
                const SizedBox(height: 20),
                InkWell(
                  onTap: () {
                    print("Logout Tapped");
                  },
                  child: const NewRow(
                    text: 'Logout',
                    icon: Icons.cancel,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class NewRow extends StatelessWidget {
  final IconData icon;
  final String text;

  const NewRow({
    Key? key,
    required this.icon,
    required this.text,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          color: Colors.white,
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          text,
          style: const TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
