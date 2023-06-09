import 'package:flutter/material.dart';
import 'package:sysmanagment/app/shared/constants.dart';

class AddInput extends StatelessWidget {
  AddInput(
      {Key? key,
      this.maxLine,
      this.multiline = false,
      this.hint,
      this.controller,
      this.title,
      this.input_width})
      : super(key: key);
  final TextEditingController? controller;
  final String? title;
  final double? input_width;
  String? hint;
  bool multiline;
  int? maxLine;

  @override
  Widget build(BuildContext context) {
    return Container(
      // margin: EdgeInsets.only(top: 10),
      height: multiline ? null : 55,
      width: input_width ?? double.infinity,
      decoration: BoxDecoration(
          border: Border.all(
            color: Colors.white12,
          ),
          borderRadius: BorderRadius.circular(8)),
      child: Row(
        children: [
          if (!multiline)
            Container(
              padding: EdgeInsets.symmetric(horizontal: defaultPadding / 3),
              // color: Colors.black12,
              decoration: BoxDecoration(
                border: Border(right: BorderSide(color: Colors.white12)),
              ),
              child: Text(title!),
            ),
          // Divider(
          //   color: Colors.red,
          // ),
          Expanded(
              child: TextFormField(
            controller: controller,
            maxLines: multiline ? maxLine : 1,
            decoration: InputDecoration(
              focusColor: Colors.transparent,
              hintText: hint,
              contentPadding: multiline
                  ? null
                  : EdgeInsets.symmetric(
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
          )),
        ],
      ),
    );
  }
}
