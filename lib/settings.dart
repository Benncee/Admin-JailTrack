import 'package:flutter/material.dart';
import 'package:food/aboutus.dart';
import 'package:food/sidebar_menu.dart';
import 'package:food/userfeedback.dart';
import 'main.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key});

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
            const SizedBox(width: 8),
            const Text(
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
            padding: const EdgeInsets.only(right: 16.0),
            child: TextButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const MyApp()),
                );
              },
              child: const Text(
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
      body: Stack(
        children: [
          Row(
            children: [
              const Sidebar(),
              Expanded(
                child: Container(
                  width: 300,
                  height: 900,
                  margin: const EdgeInsets.all(50.0),
                  padding: const EdgeInsets.all(20.0),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255),
                    borderRadius: BorderRadius.circular(20.0),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.2),
                        spreadRadius: 5,
                        blurRadius: 7,
                        offset: const Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(bottom: 10.0),
                        height: 80,
                        decoration: BoxDecoration(
                          color: Colors.lightBlue,
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Center(
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
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const AboutUsPage(),
                              transitionDuration: const Duration(seconds: 0),
                              transitionsBuilder:
                                  (context, animation1, animation2, child) {
                                return child;
                              },
                            ),
                          );
                        },
                        child: const Row(
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
                      const SizedBox(height: 20),
                      InkWell(
                        onTap: () {
                          Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (context, animation1, animation2) =>
                                  const UserFeedbackPage(),
                              transitionDuration: const Duration(seconds: 0),
                              transitionsBuilder:
                                  (context, animation1, animation2, child) {
                                return child;
                              },
                            ),
                          );
                        },
                        child: const Row(
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
                      const Spacer(),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 50,
            right: 50,
            child: Opacity(
              opacity: 0.3,
              child: Image.asset(
                'icons/adminsettings.png',
                width: 500,
                height: 500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Sidebar extends StatelessWidget {
  const Sidebar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            spreadRadius: 5,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Container(
        width: 300,
        color: const Color.fromARGB(255, 4, 14, 29),
        child: const Column(
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
