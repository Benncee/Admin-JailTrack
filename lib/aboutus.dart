import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food/settings.dart';
import 'package:food/sidebar_menu.dart';
import 'main.dart';
import 'notifications.dart';
import 'mngjailfacility.dart';
import 'styles.dart';

class AboutUsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'icons/JailTrackLogo.png', // Path to your JailTrack logo
              width: 60, // Adjust width as needed
              height: 60, // Adjust height as needed
            ),
            SizedBox(width: 8),
            Text(
              'JailTrack',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
        backgroundColor: Colors.grey[900],
        actions: [
          Container(
            padding: EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => MyApp()),
                );
              },
              child: Text(
                'Logout',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
        ],
      ),
      backgroundColor: const Color.fromARGB(255, 4, 14, 29),
      body: Row(
        children: [
          Sidebar(),
          Expanded(
            child: Container(
              width: 300,
              height: 950,
              margin: EdgeInsets.all(50.0),
              padding: EdgeInsets.all(20.0),
              decoration: BoxDecoration(
                color: Color.fromARGB(255, 211, 211, 211),
                borderRadius: BorderRadius.circular(20.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3),
                  ),
                ],
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: 300,
                    right: 0,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'icons/jail1.png',
                        width: 500,
                        height: 500,
                      ),
                    ),
                  ),
                  Positioned(
                    top: 300,
                    left: 0,
                    child: Opacity(
                      opacity: 0.3,
                      child: Image.asset(
                        'icons/jail2.png',
                        width: 500,
                        height: 500,
                      ),
                    ),
                  ),
                  SingleChildScrollView(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.pushReplacement(
                              context,
                              PageRouteBuilder(
                                pageBuilder:
                                    (context, animation1, animation2) =>
                                        SettingsPage(),
                                transitionDuration: Duration(seconds: 0),
                              ),
                            );
                          },
                          child: Container(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Icon(Icons.arrow_back),
                                SizedBox(width: 8),
                                Text(
                                  'Back',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'ABOUT US',
                            style: TextStyle(
                              fontSize: 100,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'JAILTRACK: A Face Recognition-Based Solution for Shift Scheduling and Attendance Monitoring of Jail Officers\n\n',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 20),
                        Center(
                          child: Text(
                            'Welcome to JAILTRACK, a cutting-edge face recognition-based solution designed to revolutionize shift scheduling\n and attendance monitoring for jail officers. Our innovative system harnesses the power of advanced facial technology\n to streamline and enhance the management of jail personnel, ensuring a secure and efficient facility environment.',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        width: 300,
        color: Color.fromARGB(255, 4, 14, 29),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            SidebarMenuItem(text: 'Dashboard', iconPath: 'icons/dashboard.png'),
            SidebarMenuItem(
                text: 'Notifications', iconPath: 'icons/notification.png'),
            SidebarMenuItem(
                text: 'Approve Facilities', iconPath: 'icons/facilities.png'),
            SidebarMenuItem(
                text: 'Manage Accounts', iconPath: 'icons/accounts.png'),
            SidebarMenuItem(text: 'Settings', iconPath: 'icons/settings.png'),
          ],
        ),
      ),
    );
  }
}
