import 'package:flutter/material.dart';
import 'package:hms_16/Views/edit_profile_page.dart';
import 'package:hms_16/Views/profile_change_password.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/navpush_transition.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

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
      body: SingleChildScrollView(
        child: Column(
          children: [
            ListTile(
              leading: CircleAvatar(
                child: Image(image: AssetImage("assets/Ellipse 2.png")),
                backgroundColor: Colors.grey,
              ),
              title: Text(
                "Abed Nego",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                """
+6287788546976
abednego1@gmail.com
""",
                style: TextStyle(color: Colors.black),
              ),
              isThreeLine: true,
            ),
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.person)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            CardTile(
              onTap: () {
                navPushTransition(context, EditProfilePage());
              },
              title: 'Edit Profile',
              subtitle: Text('Edit your account profile'),
              icon: Icons.edit,
            ),
            CardTile(
              onTap: () {
                navPushTransition(context, ChangePasswordPage());
              },
              title: 'Change Password',
              subtitle: Text('Change your password'),
              icon: Icons.lock,
            ),
            SizedBox(
              height: 300,
            ),
            InkWell(
              onTap: () {},
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.logout_outlined,
                    size: 30,
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

class CardTile extends StatelessWidget {
  final IconData? icon;
  final String title;
  final Widget? subtitle;
  void Function()? onTap;
  CardTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: InkWell(
        onTap: onTap,
        child: Card(
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          elevation: 2,
          child: ListTile(
            leading: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(
                icon,
                color: Colors.black,
              ),
            ),
            title: Text(
              title,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 15),
            ),
            subtitle: subtitle,
            trailing: Container(
              padding: const EdgeInsets.all(5),
              child: Icon(
                Icons.arrow_forward_ios,
                color: Colors.grey.shade400,
                size: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
