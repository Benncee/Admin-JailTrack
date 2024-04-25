import 'package:flutter/material.dart';
import 'package:food/settings.dart';
import 'package:food/sidebar_menu.dart'; // Import the sidebar_menu.dart file
import 'main.dart';
import 'notifications.dart';
import 'mngjailfacility.dart';
import 'styles.dart';

class EditProfilePage extends StatelessWidget {
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
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(Icons.admin_panel_settings), // Admin icon
                      SizedBox(width: 10),
                      Text(
                        'Edit Profile',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  // Form for editing profile information
                  EditProfileForm(),
                  SizedBox(height: 20),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (context, animation1, animation2) =>
                              SettingsPage(),
                          transitionDuration: Duration(seconds: 0),
                          transitionsBuilder:
                              (context, animation1, animation2, child) {
                            return child;
                          },
                        ),
                      );
                    },
                    child: Text('Back'),
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

class EditProfileForm extends StatefulWidget {
  @override
  _EditProfileFormState createState() => _EditProfileFormState();
}

class _EditProfileFormState extends State<EditProfileForm> {
  final _formKey = GlobalKey<FormState>();
  TextEditingController _firstNameController = TextEditingController();
  TextEditingController _lastNameController = TextEditingController();
  TextEditingController _middleNameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _contactNumberController = TextEditingController();
  TextEditingController _addressController = TextEditingController();
  TextEditingController _provinceController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _firstNameController,
                      decoration: InputDecoration(labelText: 'First Name'),
                      maxLength: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your first name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _lastNameController,
                      decoration: InputDecoration(labelText: 'Last Name'),
                      maxLength: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your last name';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _middleNameController,
                      decoration: InputDecoration(labelText: 'Middle Name'),
                      maxLength: 50,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _emailController,
                      decoration: InputDecoration(labelText: 'Email Address'),
                      maxLength: 100,
                      validator: (value) {
                        return null;
                      },
                    ),
                  ],
                ),
              ),
              SizedBox(width: 20),
              Expanded(
                child: Column(
                  children: [
                    TextFormField(
                      controller: _contactNumberController,
                      decoration: InputDecoration(labelText: 'Contact Number'),
                      maxLength: 20,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(labelText: 'Address'),
                      maxLength: 200,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _provinceController,
                      decoration: InputDecoration(labelText: 'Province'),
                      maxLength: 50,
                      validator: (value) {
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    TextFormField(
                      controller: _passwordController,
                      decoration: InputDecoration(labelText: 'Password'),
                      obscureText: true,
                      maxLength: 50,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your password';
                        }
                        return null;
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: () {
              if (_formKey.currentState!.validate()) {
                // Process the form data
                // For demonstration, print the entered values
                print('First Name: ${_firstNameController.text}');
                print('Last Name: ${_lastNameController.text}');
                print('Middle Name: ${_middleNameController.text}');
                print('Email: ${_emailController.text}');
                print('Contact Number: ${_contactNumberController.text}');
                print('Address: ${_addressController.text}');
                print('Province: ${_provinceController.text}');
                print('Password: ${_passwordController.text}');
              }
            },
            child: Text('Save Changes'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Greyed-out User ID field
              Text(
                'User ID: 123456',
                style: TextStyle(color: Colors.grey),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
