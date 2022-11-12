import 'package:codigo2_alerta/ui/general/colors.dart';
import 'package:codigo2_alerta/ui/widgets/general_widget.dart';
import 'package:flutter/material.dart';

class TextFieldCustomWidget extends StatelessWidget {
  TextEditingController controller;

  TextFieldCustomWidget({
    required this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tu número de DNI",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: kFontPrimaryColor.withOpacity(0.75),
          ),
        ),
        spacing10,
        TextFormField(
          controller: controller,
          style: TextStyle(
            color: kFontPrimaryColor.withOpacity(0.80),
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            hintText: "Ingrese su DNI",
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: kFontPrimaryColor.withOpacity(0.5),
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontPrimaryColor.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontPrimaryColor.withOpacity(0.12),
                width: 0.9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class TextFieldCustomPasswordWidget extends StatefulWidget {
  TextEditingController controller;
  TextFieldCustomPasswordWidget({required this.controller});

  @override
  State<TextFieldCustomPasswordWidget> createState() =>
      _TextFieldCustomPasswordWidgetState();
}

class _TextFieldCustomPasswordWidgetState
    extends State<TextFieldCustomPasswordWidget> {
  bool isInvisible = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Tu contraseña",
          style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.bold,
            color: kFontPrimaryColor.withOpacity(0.75),
          ),
        ),
        spacing10,
        TextFormField(
          controller: widget.controller,
          obscureText: isInvisible,
          style: TextStyle(
            color: kFontPrimaryColor.withOpacity(0.80),
            fontSize: 14.0,
          ),
          decoration: InputDecoration(
            hintText: "Ingrese su contraseña",
            hintStyle: TextStyle(
              fontSize: 14.0,
              color: kFontPrimaryColor.withOpacity(0.5),
            ),
            suffixIcon: IconButton(
              icon: Icon(
                Icons.remove_red_eye_outlined,
                size: 18.0,
                color: kFontPrimaryColor.withOpacity(0.50),
              ),
              onPressed: () {
                isInvisible = !isInvisible;
                setState(() {});
              },
            ),
            contentPadding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 15.0),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontPrimaryColor.withOpacity(0.12),
                width: 0.9,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(30),
              borderSide: BorderSide(
                color: kFontPrimaryColor.withOpacity(0.12),
                width: 0.9,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
