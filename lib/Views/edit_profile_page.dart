import 'package:flutter/material.dart';
import 'package:hms_16/style/theme.dart';
import 'package:hms_16/widget/duration_dialog.dart';

class EditProfilePage extends StatelessWidget {
  const EditProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        iconTheme: IconThemeData(color: cBlack),
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Edit Profile',
          style: textStyle.copyWith(
              fontSize: 20, fontWeight: FontWeight.w600, color: cBlackBase),
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
            child: Text("Name"),
          ),
          BuildFormField(
            hint: "natasyan46",
            icon: Icons.person,
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(30, 0, 5, 0),
            child: Text("Email"),
          ),
          BuildFormField(
            hint: "nastasyan46@gmail",
            icon: Icons.mail,
          ),
          Container(
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
            padding: EdgeInsets.symmetric(horizontal: 10),
            margin: EdgeInsets.only(top: 30),
            alignment: Alignment.center,
            child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20)),
                    backgroundColor: cPrimaryBase,
                    minimumSize: Size(MediaQuery.of(context).size.width, 50)),
                onPressed: () {
                  // showDialog(
                  //   context: context,
                  //   builder: (context) => AlertDialog(
                  //     shape: RoundedRectangleBorder(
                  //         borderRadius: BorderRadius.circular(20)),
                  //     title: Text("Confirm To Change Password ?"),
                  //     actions: [
                  //       Row(
                  //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //         children: [
                  //           ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   shape: RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(20)),
                  //                   backgroundColor: cPrimaryBase,
                  //                   minimumSize: Size(130, 50)),
                  //               onPressed: () {
                  //                 durationDialog(context,
                  //                     "Password Changed Successfully!");
                  //               },
                  //               child: Text("Yes")),
                  //           ElevatedButton(
                  //               style: ElevatedButton.styleFrom(
                  //                   side: BorderSide(color: cPrimaryBase),
                  //                   shape: RoundedRectangleBorder(
                  //                       borderRadius:
                  //                           BorderRadius.circular(20)),
                  //                   backgroundColor: Colors.white,
                  //                   minimumSize: Size(130, 50)),
                  //               onPressed: () {
                  //                 Navigator.pop(context);
                  //               },
                  //               child: Text(
                  //                 "No",
                  //                 style: TextStyle(color: Colors.black),
                  //               )),
                  //         ],
                  //       ),
                  //     ],
                  //   ),
                  // );
                },
                child: Text("Submit")),
          )
        ],
      )),
    );
  }
}

class BuildFormField extends StatelessWidget {
  final String hint;
  final IconData icon;
  const BuildFormField({
    Key? key,
    required this.hint,
    required this.icon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
          hintText: hint,
          prefixIcon: Icon(
            icon,
            color: cBlack,
          ),
        ),
      ),
    );
  }
}
