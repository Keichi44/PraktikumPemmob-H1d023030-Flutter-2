

import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          const UserAccountsDrawerHeader(
            accountName: Text("User Kreatif"),
            accountEmail: Text("user.kreatif@email.com"),
            currentAccountPicture: CircleAvatar(
              backgroundColor: Colors.white,
              child: Icon(Icons.person, color: Colors.blueAccent),
            ),
            decoration: BoxDecoration(color: Colors.blueAccent),
          ),
          ListTile(
            leading: const Icon(Icons.home),
            title: const Text('Home'),
            onTap: () {
              Navigator.pop(context);
              if (ModalRoute.of(context)!.settings.name != '/home') {
                Navigator.pushReplacementNamed(context, '/home');
              }
            },
          ),
          ListTile(
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
            onTap: () {
              Navigator.pop(context);
              if (ModalRoute.of(context)!.settings.name != '/about') {
                Navigator.pushReplacementNamed(context, '/about');
              }
            },
          ),
          const Divider(),

          ListTile(
            leading: const Icon(Icons.logout),
            title: const Text('Logout'),
            onTap: () async {

              final prefs = await SharedPreferences.getInstance();


              await prefs.setBool('isLoggedIn', false);


              if (context.mounted) {

                Navigator.of(context).pushNamedAndRemoveUntil('/login', (Route<dynamic> route) => false);
              }
            },
          ),
        ],
      ),
    );
  }
}

