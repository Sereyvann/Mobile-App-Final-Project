import 'package:final_project/screens/update_pf.dart';
import 'package:final_project/utils/global.colors.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/utils.dart';

import '../widgets/bottom_navbar.dart';

class ProfileScreen extends StatelessWidget {
  ProfileScreen({Key? key}) : super(key: key);
  final user = FirebaseAuth.instance.currentUser!;

  // sign user out method
  void signUserOut() {
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: GlobalColors.bgColor,
        leading: IconButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => MyBottomNavbar()),
            );
          },
          icon: const Icon(Icons.arrow_back_ios_new),
          color: GlobalColors.textColor,
        ),
        centerTitle: true,
        title: Text(
          "Profile",
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.w600,
            color: GlobalColors.textColor,
          ),
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: Icon(Icons.more_horiz),
            color: Colors.black,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            children: [
              Stack(
                children: [
                  SizedBox(
                    width: 120,
                    height: 120,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: new Image.asset("images/PF.png"),
                    ),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 35,
                      height: 35,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: GlobalColors.primaryLightColor),
                      child: const Icon(
                        CupertinoIcons.pencil,
                        color: Colors.black,
                        size: 25,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 0),
              Text(
                "Sereyvann Ros",
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: GlobalColors.textColor),
              ),
              Text(
                "rossereyvann20@kit.edu.kh",
                style: TextStyle(
                    fontWeight: FontWeight.w500, color: GlobalColors.textColor),
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 45,
                width: 200,
                child: ElevatedButton(
                  onPressed: () => Get.to(() => UpdateProfileScreen()),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: GlobalColors.primaryLightColor,
                      side: BorderSide.none,
                      shape: const StadiumBorder()),
                  child: Text(
                    "Edit Profile",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              const SizedBox(height: 30),
              const Divider(),
              ProfileMenuWidget(
                title: "Setting",
                icon: Icons.settings,
                onPress: (() {}),
              ),
              ProfileMenuWidget(
                title: "Payment",
                icon: Icons.payment,
                onPress: (() {}),
              ),
              ProfileMenuWidget(
                title: "Term of Use",
                icon: Icons.file_copy,
                onPress: (() {}),
              ),
              const Divider(),
              ProfileMenuWidget(
                title: "Log Out",
                icon: Icons.logout_rounded,
                textColor: Colors.red,
                endIcon: false,
                onPress: signUserOut,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileMenuWidget extends StatelessWidget {
  const ProfileMenuWidget({
    Key? key,
    required this.title,
    required this.icon,
    required this.onPress,
    this.endIcon = true,
    this.textColor,
  }) : super(key: key);

  final String title;
  final IconData icon;
  final VoidCallback onPress;
  final bool endIcon;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onPress,
      leading: Container(
        width: 40,
        height: 40,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(100),
          color: GlobalColors.primaryMainColor.withOpacity(0.1),
        ),
        child: Icon(
          icon,
          color: GlobalColors.primaryLightColor,
        ),
      ),
      title: Text(
        title,
        style: TextStyle(color: textColor, fontSize: 20),
      ),
      trailing: endIcon
          ? Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                color: Colors.grey.withOpacity(0.1),
              ),
              child: Icon(
                Icons.arrow_forward_ios,
                size: 18.0,
                color: Colors.grey,
              ))
          : null,
    );
  }
}
