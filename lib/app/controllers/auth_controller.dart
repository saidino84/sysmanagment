import 'package:firebase_auth/firebase_auth.dart';
import 'package:sysmanagment/app/ui/auth_page/login/login_page.dart';
import 'package:sysmanagment/app/ui/home/home_page.dart';
import 'package:sysmanagment/shared.dart';

class AuthController extends GetxController {
  static AuthController instance = Get.find<AuthController>();
  FirebaseAuth auth = FirebaseAuth.instance;
  TextEditingController phone_number_controller = TextEditingController();
  TextEditingController otp_number_controller = TextEditingController();

  RxString usernumber = ''.obs;
  String _receivedID = '';
  var otpFieldVisibility = false.obs;

  late Rx<User?> firebaseUser;

  @override
  void onReady() {
    super.onReady();
    firebaseUser = Rx<User?>(auth.currentUser);
    firebaseUser.bindStream(auth.userChanges());

    //Verifies if user has loged in to change screen /loged out
    ever(firebaseUser, _setInitialPage);
  }

  _setInitialPage(User? user) {
    if (user != null) {
      Get.offAll(() => HomePage());
    } else {
      Get.offAll(() => LoginPage());
    }
  }

  // =============LOGIN WITH PHONENUMBER =============================

  void verifyUserPhoneNumber() {
    auth.verifyPhoneNumber(
      phoneNumber: usernumber.value,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await auth.signInWithCredential(credential).then(
              (value) => print('Logado com sucessso '),
            );
      },
      verificationFailed: (FirebaseAuthException e) {
        print(e.message);
      },
      codeSent: (String verifictionId, int? resentToken) {
        _receivedID = verifictionId;
        otpFieldVisibility.value = true;
        update();
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  Future<void> verifyOTPCode() async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: _receivedID,
      smsCode: otp_number_controller.text,
    );
    await auth.signInWithCredential(credential).then(
          (value) => print('User Login in Sucessull'),
        );
  }

  // ================================================================

  void register(String email, String password) {}

  signWithPhone() async {
    await auth
        .signInWithPhoneNumber(
      phone_number_controller.text,
    )
        .then((ConfirmationResult confirm) {
      print('TRYIN TO CONFIRM');
      // confirm.confirm('123456');
      print('${confirm.verificationId}');
    }).catchError((ERR) {
      print('falhoe=u login\n ERROR: ${ERR},');
    }).whenComplete(() {
      print('Print completed');
    });
  }

  loginWithPhoneNumber() async {
    try {
      var number = phone_number_controller.text;
      print('Numero do Telefone : ${number}');
      auth.verifyPhoneNumber(
          timeout: Duration(minutes: 2),
          phoneNumber: number,
          verificationCompleted: (PhoneAuthCredential credential) async {
            await auth.signInWithCredential(credential).then((value) {
              Get.snackbar('Logado', 'Logado com sucesso',
                  backgroundColor: Colors.blueAccent);
            }).catchError((err) {
              Get.snackbar('ERRO', 'fAILED TO CONFIRM');
            });
          },
          verificationFailed: (FirebaseAuthException e) {
            Get.snackbar('Falhou', e.toString());
            print(e);
          },
          codeSent: (String verificationId, int? resendToken) {
            print(
                'Codigo ENviado...  VERIFY:${verificationId}\n Reset: ${resendToken}');
          },
          codeAutoRetrievalTimeout: (String verificationId) {
            print('REcebido {}');
          });
    } catch (e) {
      print('ERRO DE COMPILCOA');
    }

    // ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber(
    //     phone_number,
    //     RecaptchaVerifier(
    //       // auth: FirebaseAuthPlatform,
    //         container: 'recaptcha',
    //         size: RecaptchaVerifierSize.compact,
    //         theme: RecaptchaVerifierTheme.dark));
    // UserCredential userCredential = await confirmationResult.confirm('123456');
  }
}
// ConfirmationResult confirmationResult = await auth.signInWithPhoneNumber('+44 7123 123 456', RecaptchaVerifier(
//   container: 'recaptcha',
//   size: RecaptchaVerifierSize.compact,
//   theme: RecaptchaVerifierTheme.dark,
// ));