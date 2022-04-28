import 'package:flutter/material.dart';
import 'package:mini_project/widgets/components/setting_tile.dart';

class SettingsFragment extends StatelessWidget {
  const SettingsFragment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 40,
          ),
          Center(
            child: CircleAvatar(
              backgroundColor: Colors.blue[900],
              radius: 40,
            ),
          ),
          const SizedBox(height: 40),
          const Padding(
            padding: EdgeInsets.only(left: 20),
            child: Text(
              "Settings",
              style: TextStyle(fontSize: 32, color: Colors.white, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(height: 40),
          SettingTile(
            text: "Logout",
            icon: Icons.logout_outlined,
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
