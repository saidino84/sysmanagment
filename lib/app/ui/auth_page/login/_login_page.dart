import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:sysmanagment/app/controllers/auth_controller.dart';
import 'package:sysmanagment/shared.dart';

class LoginPageX extends StatelessWidget {
  LoginPageX(
    int id, {
    super.key,
  });
  var controller = AuthController.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('User Login'),
            SizedBox(
              height: 300,
              width: 400,
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 36,
                        width: double.infinity,
                        child: TextField(
                          controller: controller.phone_number_controller,
                          textAlignVertical: TextAlignVertical.bottom,
                          decoration:
                              InputDecoration(hintText: '+258 872988328'),
                          onChanged: (value) {
                            if (value.length == 9) {
                              print('COMPLETE');
                              controller.usernumber.value = '+258${value}';
                              controller.phone_number_controller.text =
                                  '+258 ${value}';
                            } else {
                              controller.usernumber.value = '';
                            }
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: 36,
                        width: double.infinity,
                        child: Obx(() {
                          return Visibility(
                            visible: controller.otpFieldVisibility.value,
                            child: TextField(
                              textAlignVertical: TextAlignVertical.bottom,
                              controller:
                                  AuthController.instance.otp_number_controller,
                              decoration: InputDecoration(hintText: 'sms code'),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Obx(() {
                        return SizedBox(
                          height: 36,
                          width: double.infinity,
                          child: FilledButton(
                            onPressed: controller.usernumber.value != ''
                                ? () async {
                                    if (controller.otpFieldVisibility.value) {
                                      controller.verifyOTPCode();
                                    } else {
                                      controller.verifyUserPhoneNumber();
                                    }
                                  }
                                : null,
                            child: Text(controller.otpFieldVisibility.value
                                ? 'Entrar'
                                : 'VERIFY'),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
