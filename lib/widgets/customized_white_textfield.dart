import 'package:flutter/material.dart';
import 'package:vip_chat_app/constants.dart';

class CustomizedWhiteTextField extends StatelessWidget {
  CustomizedWhiteTextField({
    @required this.hintText,
    @required this.onChanged,
    this.icon,
    this.obscureText,
  });

  final String hintText;
  final void Function(String) onChanged;
  final Widget icon;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0),
      child: Container(
        constraints: BoxConstraints(maxWidth: 400.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              color: Colors.black54,
              blurRadius: 12.0,
              offset: Offset(0.0, 5.0),
            ),
          ],
        ),
        child: TextField(
          obscureText: obscureText ?? false,
          onChanged: onChanged,
          style: TextStyle(
            color: Colors.black,
          ),
          decoration: InputDecoration(
            prefixIcon: icon ?? null,
            filled: true,
            fillColor: Colors.white,
            hintText: hintText,
            hintStyle: TextStyle(
              fontFamily: kFontSourceSansPro,
              fontWeight: FontWeight.normal,
              color: Colors.black45,
            ),
            contentPadding:
                EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.white, width: 0.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
              borderRadius: BorderRadius.all(Radius.circular(32.0)),
            ),
          ),
        ),
      ),
    );
  }
}