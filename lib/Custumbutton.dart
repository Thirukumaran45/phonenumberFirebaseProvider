import 'package:flutter/material.dart';

typedef custumfunc = void Function();

class CustumButton extends StatelessWidget {
  const CustumButton({super.key, required this.ontap, required this.text});
  final String text;
  final custumfunc ontap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: ontap,
        style: ButtonStyle(
            foregroundColor: MaterialStateProperty.all(Colors.white),
            backgroundColor: MaterialStateProperty.all(Colors.blue),
            shape: MaterialStateProperty.all(RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(40)))),
        child: Text(
          text,
          style: const TextStyle(fontSize: 23, fontStyle: FontStyle.normal),
        ));
  }
}
