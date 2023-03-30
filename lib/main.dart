import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:sysmanagment/shared.dart';

import 'firebase_options.dart';

Future<void> main(List<String> args) async {
  const firebaseConfig = FirebaseOptions(
      apiKey: "AIzaSyBvNqXkPUH-djEpZtXctwKnZKZwDr2XKTY",
      authDomain: "flutter-login-cfbd7.firebaseapp.com",
      databaseURL:
          "https://flutter-login-cfbd7-default-rtdb.europe-west1.firebasedatabase.app",
      projectId: "flutter-login-cfbd7",
      storageBucket: "flutter-login-cfbd7.appspot.com",
      messagingSenderId: "342292747100",
      appId: "1:342292747100:web:ebdb6541b5c0ec5bfea799",
      measurementId: "G-KHDH00GVMF");

// Initialize Firebase
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
    // options: firebaseConfig,
  );

  //offline persistence
  // Web.

// All other platforms.
  FirebaseFirestore.instance.settings = Settings(persistenceEnabled: false);
  runApp(SysManagment());
}

class SysManagment extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          primaryColor: TransferPalet.primaryColor,
          scaffoldBackgroundColor: TransferPalet.bgcolor,
          canvasColor: TransferPalet.bgcolor,
          textTheme: Theme.of(context)
              .textTheme
              .apply(bodyColor: Colors.white)
              .copyWith(
                  bodyLarge: TextStyle(color: TransferPalet.bodyTextcolor),
                  bodyMedium: TextStyle(color: TransferPalet.bodyTextcolor))),
      getPages: [
        GetPage(
            page: () => ResponsiveLayout(
                  mobile: MobileLayout(),
                  desktop: DesktopLayout(),
                  tablet: TabletLayout(),
                ),
            name: '/',
            bindings: [AppBindings()]),
      ],
    );
  }
}
