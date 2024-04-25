import 'package:flutter/material.dart';
import 'package:food/sidebar_menu.dart'; // Import the sidebar_menu.dart file
import 'main.dart';
import 'notifications.dart';
import 'mngjailfacility.dart';
import 'styles.dart';

class DashboardScreen extends StatelessWidget {
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
      body: Expanded(
        child: Row(
          children: [
            Sidebar(),
            Expanded(
              child: Container(
                margin: EdgeInsets.all(50.0),
                padding: EdgeInsets.all(20.0),
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 255, 255, 255),
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
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // New container with rounded edges for "Hello, Admin!" and admin image
                    Container(
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 20.0, top: 10.0),
                      padding: EdgeInsets.all(20.0),
                      decoration: BoxDecoration(
                        color: Color.fromARGB(255, 153, 153, 153),
                        borderRadius: BorderRadius.circular(20),
                      ),
                      child: Row(
                        children: [
                          Image.asset(
                            'icons/admin.png',
                            width: 70,
                            height: 70,
                          ),
                          SizedBox(width: 8),
                          Text(
                            'Hello, Admin!',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            print('Left box clicked');
                          },
                          child: Container(
                            width: 450,
                            height: 450,
                            color: Colors.lightBlue,
                            child: Center(
                              child: Text(
                                'View Facilities',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Middle box clicked');
                          },
                          child: Container(
                            width: 450,
                            height: 450,
                            color: Color.fromARGB(255, 86, 40, 214),
                            child: Center(
                              child: Text(
                                'Facility Requests',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            print('Right box clicked');
                          },
                          child: Container(
                            width: 450,
                            height: 450,
                            color: Color.fromARGB(255, 248, 175, 38),
                            child: Center(
                              child: Text(
                                'View Feedbacks',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 40,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// This class declaration was missing in your original code
class Sidebar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
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
    );
  }
}
