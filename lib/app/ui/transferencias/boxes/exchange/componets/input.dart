import 'package:flutter/material.dart';

class MyInput extends StatelessWidget {
  const MyInput({Key? key, this.controller, this.hint}) : super(key: key);
  final TextEditingController? controller;
  final String? hint;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10),
      height: 45,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          Expanded(
              child: Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: TextFormField(
              controller: controller,
              decoration: InputDecoration(
                focusColor: Colors.transparent,
                hintText: hint,
                contentPadding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 20.0,
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  // borderRadius: BorderRadius.circular(32.0),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          )),
          Divider(
            color: Colors.red,
          ),
          Container(
              width: 60,
              // child: Text('ADD'),
              // color: Colors.black12,
              decoration: BoxDecoration(
                  border: Border(left: BorderSide(color: Colors.white12))))
        ],
      ),
    );
  }
}
