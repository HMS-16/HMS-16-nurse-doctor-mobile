import 'package:flutter/material.dart';
import 'package:hms_16/screens/auth/sign_up_page.dart';
import 'package:hms_16/screens/profile/profile_change_password.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/widget/listtile_profile.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class ProfileNursePage extends StatelessWidget {
  const ProfileNursePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Profile',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            CircleAvatar(
              backgroundColor: cPrimaryBase,
              minRadius: 40,
              child: Image(image: AssetImage("assets/images/nurse_icon.png")),
            ),
            ListTileProfile(
              title: "Name",
              subtitle: "Bella Algama",
            ),
            ListTileProfile(
              title: "Registration Number",
              subtitle: "12345765",
            ),
            ListTileProfile(
              title: "Phone Number",
              subtitle: "083211189071",
            ),
            ListTileProfile(
              title: "Email",
              subtitle: "bellaalgama@gmail.com",
            ),
            ListTileProfile(
              title: "Change Password",
              subtitle: "Change your password",
              trailing: IconButton(
                  onPressed: () {
                    navPushTransition(context, ChangePasswordPage());
                  },
                  icon: Icon(
                    Icons.keyboard_arrow_right,
                    color: cWhiteDarker,
                  )),
            ),
            SizedBox(
              height: 150,
            ),
            InkWell(
              onTap: () {
                navPushTransition(context, SignUpPage());
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 30,
                  ),
                  SizedBox(
                    width: 16,
                  ),
                  Text("Sign out")
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}


