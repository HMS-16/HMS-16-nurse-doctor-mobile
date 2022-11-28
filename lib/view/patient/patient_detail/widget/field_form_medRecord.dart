import 'package:flutter/material.dart';

class FieldMedRecord extends StatelessWidget {
  FieldMedRecord({
    super.key,
    required this.title,
    required this.text,
    this.suffix,
    this.line,
    this.isRequired = true,
    this.isSuffix = true,
  });
  String title;
  String text;
  String? suffix;
  int? line;
  bool isSuffix;
  bool isRequired;

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
                  text: '*',
                  style: TextStyle(color: Colors.red),
                ),
              ]
            ],
          ),
        ),
        SizedBox(height: 4),
        TextFormField(
          keyboardType: line != null ? TextInputType.multiline : null,
          maxLines: line ?? null,
          cursorColor: Colors.black12,
          decoration: InputDecoration(
            contentPadding: line == null ? EdgeInsets.only(left: 13) : null,
            suffixIcon: isSuffix
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
