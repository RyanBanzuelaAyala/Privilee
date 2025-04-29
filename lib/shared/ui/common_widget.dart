// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

TshowLoader() {
  return const SizedBox(
      height: 40,
      width: 40,
      child: Center(
          child: CircularProgressIndicator(
              strokeWidth: 2,
              valueColor: AlwaysStoppedAnimation<Color>(
                Color(0xff111827),
              ))));
}

TAppBar(BuildContext context, {String title = ""}) {
  return AppBar(
    backgroundColor: Colors.white,
    leading: IconButton(
      icon: const Icon(Icons.arrow_back),
      onPressed: () {
        Navigator.pop(context);
      },
    ),
    title: Center(
      child: title.isEmpty
          ? Image.asset(
              'assets/privilee.png',
              height: 15,
            )
          : Center(
              child: Text(title,
                  style: const TextStyle(color: Colors.black, fontSize: 12)),
            ),
    ),
    actions: [SizedBox(width: 50)],
  );
}

TButton(String title, IconData icon, Color? color,
    RoundedLoadingButtonController btn, void Function()? onPressed) {
  return RoundedLoadingButton(
    elevation: 1,
    color: color,
    valueColor: Colors.black,
    successColor: Colors.green,
    errorColor: Colors.red,
    height: 50,
    width: 45,
    controller: btn,
    onPressed: onPressed,
    child: Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Text(title,
                style: const TextStyle(color: Colors.black, fontSize: 14)),
          ),
          Padding(padding: const EdgeInsets.only(right: 10), child: Icon(icon)),
        ],
      ),
    ),
  );
}
