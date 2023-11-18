import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final color;
  final textcolor;
  final buttontext;
  final buttontap;
  const Button(
      {super.key, this.color, this.buttontext, this.textcolor, this.buttontap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: buttontap,
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: Container(
              color: color,
              child: Center(
                child: Text(
                  buttontext,
                  style: TextStyle(color: textcolor, fontSize: 25),
                ),
              ),
            )),
      ),
    );
  }
}
