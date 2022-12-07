import 'package:flutter/material.dart';
import 'package:hms_16/utils/constant.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.transparent,
        title: Text(
          'Profile',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 60,
                    width: 60,
                    child: CircleAvatar(
                      backgroundImage: AssetImage("assets/images/avatar.png"),
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Nastasya",
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 16),
                      ),
                      Text("+6287788546976"),
                      Text("nastasyan46@gmail.com"),
                    ],
                  )
                ],
              ),
              const SizedBox(
                height: 25.0,
              ),
              Row(
                children: const [
                  Icon(Icons.person),
                  Text(
                    "Account",
                    style: TextStyle(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const SizedBox(
                height: 10.0,
              ),
              const CardTile(
                title: 'Edit Profile',
                subtitle: Text('Edit your account profile'),
                icon: Icons.edit,
              ),
              const SizedBox(
                height: 10.0,
              ),
              const CardTile(
                title: 'Change Password',
                subtitle: Text('Change your password'),
                icon: Icons.lock,
              ),
            ],
          ),
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
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
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
    );
  }
}
