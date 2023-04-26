import 'package:flutter/services.dart';
import 'package:sysmanagment/app/controllers/auth_controller.dart';
import 'package:sysmanagment/shared.dart';

class OTPPage extends StatelessWidget {
  OTPPage({super.key});
  var controller = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      width: 300,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          OTPtextInputField(),
          OTPtextInputField(),
          OTPtextInputField(),
          OTPtextInputField(),
          OTPtextInputField(),
          OTPtextInputField(),
        ],
      ),
    );
  }
}

class OTPtextInputField extends StatelessWidget {
  OTPtextInputField({super.key, this.onsaved});
  Function(String?)? onsaved;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 68,
      width: 40,
      child: TextFormField(
        validator: (value) {
          if (!AuthController.instance.otpFieldVisibility.value &&
              value == null) {
            return 'FILL YOUR CODE';
          }
          return null;
        },
        onEditingComplete: () {
          print('EDITADO');
        },
        decoration: InputDecoration(
          hintText: '0',
        ),
        onChanged: (value) {
          AuthController.instance.otpvalue += value;
          print(AuthController.instance.otpvalue);
          if (value.length == 1) FocusScope.of(context).nextFocus();
        },
        style: Theme.of(context).textTheme.headline6,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        inputFormatters: [
          LengthLimitingTextInputFormatter(1),
          FilteringTextInputFormatter.digitsOnly,
        ],
      ),
    );
  }
}
