import 'package:flutter/material.dart';
import 'package:food/editprofile.dart'; // Import the edit profile page
import 'package:food/aboutus.dart'; // Import the about us page
import 'package:food/sidebar_menu.dart';
import 'package:food/userfeedback.dart'; // Import the user feedback page
import 'main.dart'; // Import the main.dart file for navigation purposes

class SettingsPage extends StatelessWidget {
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
              height: 900,
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(bottom: 10.0),
                    height: 80,
                    decoration: BoxDecoration(
                      color: Colors.lightBlue,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Center(
                      child: Text(
                        'Manage Settings',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              EditProfilePage(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return child;
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.edit),
                        SizedBox(width: 8),
                        Text(
                          'Edit Profile',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              AboutUsPage(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return child;
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.info),
                        SizedBox(width: 8),
                        Text(
                          'About Us',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  InkWell(
                    onTap: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              UserFeedbackPage(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return child;
                          },
                        ),
                      );
                    },
                    child: Row(
                      children: [
                        Icon(Icons.feedback),
                        SizedBox(width: 8),
                        Text(
                          'View User Feedbacks',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
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
