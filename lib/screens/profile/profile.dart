import 'package:flutter/material.dart';
import 'package:hms_16/screens/profile/profile_change_password.dart';
import 'package:hms_16/utils/constant.dart';
import 'package:hms_16/view_model/auth_view_model.dart';
import 'package:hms_16/widget/dialog_validation.dart';
import 'package:hms_16/widget/listtile_profile.dart';
import 'package:hms_16/widget/navpush_transition.dart';
import 'package:provider/provider.dart';

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
      body: Consumer<AuthViewModel>(
        builder: (context, value, child) {
          return Column(
            children: [
              CircleAvatar(
                backgroundColor: cPrimaryBase,
                minRadius: 40,
                child: LayoutBuilder(builder: (context, constraints) {
                  if (value.profile!.role == 1) {
                    return const Image(
                      image: AssetImage("assets/images/doctor_icon.png"),
                    );
                  } else {
                    return const Image(
                      image: AssetImage("assets/images/nurse_icon.png"),
                    );
                  }
                }),
              ),
              ListTileProfile(
                title: "Name",
                subtitle: value.profile!.name,
              ),
              ListTileProfile(
                title: "Registration Number",
                subtitle: value.profile!.strNum,
              ),
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    border: Border(
                        bottom: BorderSide(width: 2, color: cWhiteDarker))),
                child: ListTile(
                  title: Text(
                    "Role",
                    style: TextStyle(color: cBlackLightest),
                  ),
                  subtitle: LayoutBuilder(
                    builder: (context, constraints) {
                      if (value.profile!.role == 1) {
                        return Text("Doctor",
                            style: TextStyle(fontSize: 16, color: cBlack));
                      } else {
                        return Text("Nurse",
                            style: TextStyle(fontSize: 16, color: cBlack));
                      }
                    },
                  ),
                ),
              ),
              ListTileProfile(
                title: "Email",
                subtitle: value.profile!.email,
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
                    color: cWhiteLast,
                  ),
                ),
              ),
              const Spacer(),
              Container(
                margin: const EdgeInsets.only(bottom: 15),
                child: InkWell(
                  onTap: () {
                    dialogValidation(
                      context: context,
                      onPressedYes: (() {
                        context.read<AuthViewModel>().logout(context);
                      }),
                      title: 'Are you sure?',
                    );
                  },
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: const [
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
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
