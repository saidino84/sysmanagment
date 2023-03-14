import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/ui/responsive/desktop_layout.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

import 'app/bindings/app_bindings.dart';
import 'app/ui/responsive/mobile_layout.dart';
import 'app/ui/responsive/tablet_layout.dart';
import 'app/ui/transferencias/components.dart';

void main(List<String> args) {
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
