import 'package:flutter/material.dart';
import 'package:food/dashboard.dart';
import 'package:food/mngaccounts.dart';
import 'package:food/mngjailfacility.dart';
import 'package:food/notifications.dart';
import 'package:food/settings.dart';

class SidebarMenuItem extends StatefulWidget {
  final String text;
  final String iconPath;

  const SidebarMenuItem({super.key, required this.text, required this.iconPath});

  @override
  _SidebarMenuItemState createState() => _SidebarMenuItemState();
}

class _SidebarMenuItemState extends State<SidebarMenuItem> {
  Color hoverColor = Colors.transparent; // Define hover color here

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: MouseRegion(
        onHover: (_) {
          // Set the color to the desired hover color
          setState(() {
            hoverColor =
                const Color.fromARGB(255, 184, 184, 184); // Example hover color
          });
        },
        onExit: (_) {
          // Set the color back to the original color when mouse exits
          setState(() {
            hoverColor = Colors.transparent; // Original color
          });
        },
        child: Material(
          color: hoverColor, // Use hoverColor as the color
          child: InkWell(
            onTap: () {
              switch (widget.text) {
                case 'Dashboard':
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const DashboardScreen(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder:
                          (context, animation1, animation2, child) {
                        return child;
                      },
                    ),
                  );
                  break;
                case 'Notifications':
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const NotificationsPage(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder:
                          (context, animation1, animation2, child) {
                        return child;
                      },
                    ),
                  );
                  break;
                case 'Approve Facilities':
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const ManageJailFacilityPage(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder:
                          (context, animation1, animation2, child) {
                        return child;
                      },
                    ),
                  );
                case 'Manage Accounts':
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const ManageJailAccountsPage(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder:
                          (context, animation1, animation2, child) {
                        return child;
                      },
                    ),
                  );
                  break;
                case 'Settings':
                  Navigator.push(
                    context,
                    PageRouteBuilder(
                      pageBuilder: (context, animation1, animation2) =>
                          const SettingsPage(),
                      transitionDuration: const Duration(seconds: 0),
                      transitionsBuilder:
                          (context, animation1, animation2, child) {
                        return child;
                      },
                    ),
                  );
                  break;
                default:
                  print('${widget.text} clicked');
              }
            },
            child: Ink(
              color: Colors.transparent, // Transparent ink splash color
              child: Row(
                children: [
                  Image.asset(
                    widget.iconPath,
                    width: 24,
                    height: 24,
                  ),
                  const SizedBox(width: 8),
                  Text(
                    widget.text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
