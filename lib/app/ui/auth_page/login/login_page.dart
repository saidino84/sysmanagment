import 'package:sysmanagment/app/controllers/auth_controller.dart';
import 'package:sysmanagment/app/ui/auth_page/login/otp_page.dart';
import 'package:sysmanagment/shared.dart';

class LoginPage extends StatelessWidget {
  var controller = AuthController.instance;
  LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Visibility(
              visible: AuthController.instance.otpFieldVisibility.value,
              child: Text(
                'Insira O codigo OTP Que enviei te para ao numero ${AuthController.instance.usernumber}',
                style: Theme.of(context).textTheme.bodyMedium,
              ),
            ),
            Container(
              constraints: BoxConstraints.tight(Size(320, 400)),
              // decoration: BoxDecoration(
              //     border: Border.all(color: AppColors.bluedownswatch)),
              child: Column(
                children: [
                  Container(
                    height: 340,
                    child: Obx(() {
                      return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Visibility(
                              visible: !AuthController
                                  .instance.otpFieldVisibility.value,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 68,
                                    width: 300,
                                    child: TextFormField(
                                        validator: (value) {
                                          if (value!.length > 9) {
                                            return 'os campos esta cheios';
                                          }
                                          return null;
                                        },
                                        onFieldSubmitted: (e) {
                                          print('submited');
                                        },
                                        onChanged: (value) {
                                          if (value.length <= 9) {
                                            FocusScope.of(context).nextFocus();
                                          }
                                        },
                                        onSaved: (value) {
                                          print('savedd');
                                        },
                                        decoration: InputDecoration(
                                            label: Text('Seu Nome'))),
                                  ),
                                  SizedBox(
                                    height: 68,
                                    width: 300,
                                    child: TextFormField(
                                      onFieldSubmitted: (value) {
                                        FocusScope.of(context).nextFocus();
                                      },
                                      onChanged: (value) {
                                        if (value.length == 9) {
                                          print('COMPLETE');
                                          controller.usernumber.value =
                                              '+258${value}';
                                          controller.phone_number_controller
                                              .text = '+258 ${value}';
                                        } else {
                                          controller.usernumber.value = '';
                                        }
                                      },
                                      decoration: InputDecoration(
                                          label: Text('Telefone')),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Visibility(
                                visible: AuthController
                                    .instance.otpFieldVisibility.value,
                                child: OTPPage())
                          ]);
                    }),
                  ),
                  Obx(() {
                    return SizedBox(
                      height: 36,
                      width: 300,
                      child: ElevatedButton(
                        onPressed:
                            AuthController.instance.usernumber.value != ''
                                ? () async {
                                    if (AuthController
                                        .instance.otpFieldVisibility.value) {
                                      AuthController.instance.verifyOTPCode();
                                    } else {
                                      AuthController.instance
                                          .verifyUserPhoneNumber();
                                    }
                                  }
                                : null,
                        child: Text(controller.otpFieldVisibility.value
                            ? 'Verificar & Prosseguir'
                            : 'Entrar'),
                      ),
                    );
                  })
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
