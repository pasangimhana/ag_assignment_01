import 'package:flutter/material.dart';
import 'package:new_project/Diagnosisreport.dart';
import 'package:new_project/Searchpatient.dart';
import 'package:new_project/login.dart';
import 'package:new_project/patient.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({super.key});

  void _showLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("Logout"),
          content: Text("Are you sure you want to logout?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Close the dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                // Implement logout functionality here
                // After logout, you can navigate to the login screen or perform other actions
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => Loginpage())); // Close the dialog
              },
              child: Text("Logout"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      drawer: Drawer(
        child: ListView(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text("Your Name"),
              accountEmail: Text("your@email.com"),
              currentAccountPicture: CircleAvatar(
                backgroundImage: AssetImage("assets/man.png"),
              ),
            ),
            ListTile(
              leading: Icon(Icons.person),
              title: Text("Profile"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the profile page or perform other actions here
              },
            ),
            ListTile(
              leading: Icon(Icons.settings),
              title: Text("Manage Account"),
              onTap: () {
                Navigator.pop(context); // Close the drawer
                // Navigate to the settings page or perform other actions here
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.exit_to_app),
              title: Text("Logout"),
              onTap: () {
                Navigator.pop(context);
                _showLogoutDialog(context); // Close the drawer
                // Implement logout functionality here
              },
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Padding(
              padding: EdgeInsets.all(18.0),
              child: Text(
                "Dashboard Options",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold),
                textAlign: TextAlign.start,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: Center(
                child: Wrap(
                  spacing: 20.0,
                  runSpacing: 20.0,
                  children: [
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: Color.fromARGB(255, 94, 167, 193),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/medical.png", width: 64.0),
                                const SizedBox(height: 10.0),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  PatientDetails()));
                                    },
                                    child: Text(
                                      "Set Patient Details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: Color.fromARGB(255, 32, 101, 157),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("assets/research.png", width: 64.0),
                                const SizedBox(height: 10.0),
                                TextButton(
                                    onPressed: () {
                                      Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Searchpatient()));
                                    },
                                    child: Text(
                                      "Search Patient Details",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.0),
                                    )),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    /*SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("asset/manager.png", width: 64.0),
                                const SizedBox(height: 10.0),
                                const Text("Manage Account",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 160.0,
                      height: 160.0,
                      child: Card(
                        color: const Color.fromARGB(255, 21, 21, 21),
                        elevation: 2.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8.0)),
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Image.asset("asset/turn-off.png", width: 64.0),
                                const SizedBox(height: 10.0),
                                const Text("Log Out",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20.0)),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),*/
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
