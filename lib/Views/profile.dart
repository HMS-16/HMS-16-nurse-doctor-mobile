import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                "Nastasya",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
              ),
              subtitle: Text(
                """
+6287788546976
nastasyan46@gmail.com
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
            const CardTile(
              title: 'Edit Profile',
              subtitle: Text('Edit your account profile'),
              icon: Icons.edit,
            ),
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.settings)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Setting",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const CardTile(
              title: 'Notification',
              subtitle: Text('Turn on or of your notification'),
              icon: Icons.notifications,
            ),
            const CardTile(
              title: 'Language',
              subtitle: Text('Select your default language'),
              icon: Icons.language,
            ),
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.security)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "Security",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const CardTile(
              title: 'Change Password',
              subtitle: Text('Change your password'),
              icon: Icons.lock,
            ),
            const CardTile(
              title: 'Privacy Policy',
              subtitle: Text('Description of the privacy policy'),
              icon: Icons.privacy_tip,
            ),
            const CardTile(
              title: 'Terms and Conditions',
              subtitle: Text('Description of the terms & conditions'),
              icon: Icons.notes,
            ),
            Row(
              children: const [
                Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: Icon(Icons.people)),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    "About Us",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ),
              ],
            ),
            const CardTile(
              title: 'FAQ',
              subtitle: Text('Contains about Frequently Asked Question'),
              icon: Icons.question_answer,
            ),
            const CardTile(
              title: 'Contact Us',
              subtitle: Text('Contact us for more info'),
              icon: Icons.person_pin_rounded,
            ),
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
  const CardTile({
    Key? key,
    required this.icon,
    required this.title,
    required this.subtitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
        elevation: 8,
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
    );
  }
}
