import 'package:flutter/material.dart';

class FieldMedical extends StatelessWidget {
  FieldMedical({
    super.key,
    required this.title,
    required this.text,
    required this.controller,
    this.suffix,
    this.line,
    this.isRequired = true,
    this.isNumeric = true,
    // this.isSuffix = true,
  });
  String title;
  String text;
  String? suffix;
  int? line;
  TextEditingController controller;
  // bool isSuffix;
  bool isRequired;
  bool isNumeric;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      children: [
        Text.rich(
          TextSpan(
            text: title,
            style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            children: [
              if (isRequired) ...[
                TextSpan(
                  text: ' *',
                  style: TextStyle(color: Colors.red),
                ),
              ]
            ],
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          keyboardType: line != null ? TextInputType.multiline : null,
          maxLines: line ?? null,
          cursorColor: Colors.black12,
          controller: controller,
          validator: (value) {
            if (isRequired && value!.isEmpty) {
              return 'this field is required!';
            }
            if (isNumeric && !RegExp(r'^\d+/?.?\d+$').hasMatch(value!)) {
              return 'please input the correct format!';
            }
          },
          decoration: InputDecoration(
            contentPadding: line == null ? EdgeInsets.only(left: 13) : null,
            suffixIcon: suffix != null
                ? Align(
                    alignment: Alignment.center,
                    widthFactor: 1.0,
                    child: Text(
                      suffix!,
                      style: TextStyle(color: Colors.black45),
                    ),
                  )
                : null,
            hintText: text,
            border: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.grey,
              ),
              borderRadius: BorderRadius.circular(12),
            ),
            hintStyle: TextStyle(
              color: Colors.black45,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }
}
