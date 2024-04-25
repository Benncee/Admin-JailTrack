import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:food/settings.dart';
import 'package:food/sidebar_menu.dart';
import 'main.dart';
import 'notifications.dart';
import 'mngjailfacility.dart';
import 'styles.dart';

class UserFeedbackPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            Image.asset(
              'icons/JailTrackLogo.png',
              width: 60,
              height: 60,
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
              height: 900,
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
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GestureDetector(
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          PageRouteBuilder(
                            pageBuilder: (context, animation1, animation2) =>
                                SettingsPage(),
                            transitionDuration: Duration(seconds: 0),
                          ),
                        );
                      },
                    ),
                    SizedBox(height: 20),
                    Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 20, horizontal: 30),
                      decoration: BoxDecoration(
                        color: Colors.lightBlue,
                        borderRadius: BorderRadius.circular(20.0),
                      ),
                      child: Center(
                        child: Text(
                          'Viewing Users Feedback',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    // Add your feedback UI components here
                  ],
                ),
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
