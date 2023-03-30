import 'package:flutter/material.dart';
import 'package:sysmanagment/app/controllers/tranferencia_controller.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/responsive/responsive.dart';
import 'package:sysmanagment/app/ui/transferencias/inputs/input_add.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';
import 'package:sysmanagment/shared.dart';

import 'desktop_form.dart';
import 'mobileform.dart';
import 'transferSendBackstatusCheck.dart';

class TranferForm extends GetView<TransFerenciaController> {
  const TranferForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveLayout.isMobile(context) ||
              ResponsiveLayout.islargeMobile(context)
          ? 720
          : 480,
      // color: Colors.black54,
      // constraints: BoxConstraints(minHeight: 280, maxHeight: 450),
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (ResponsiveLayout.isTable(context) ||
              ResponsiveLayout.isDesktop(context))
            DeskTopandTabletForm(),

          SizedBox(
            height: defaultPadding,
          ),
          if (ResponsiveLayout.isTable(context)) Text('T A B L E T'),
          //Mobile e LargeMobile
          if (ResponsiveLayout.isMobile(context) ||
              ResponsiveLayout.islargeMobile(context))
            MobileandLargeMobileForm(),
          SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: Column(
              children: [
                if (ResponsiveLayout.isDesktop(context) ||
                    ResponsiveLayout.isTable(context))
                  TransferSendBackStaus(
                    controller: controller,
                  ),
                AddInput(
                  title: 'Descricao',
                  controller: controller.descriptionctl,
                  maxLine: 3,
                  multiline: true,
                ),
              ],
            ),
          ),
          SizedBox(height: defaultPadding / 2),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text('TRANSFERENCIAS '),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                    // backgroundColor: TransferPalet.darkcolor,
                    ),
                onPressed: () async {
                  print('ADICIONANDO...');
                  await controller.adicionar();
                  print('thread finished');
                },
                label: Text('SALVAR'),
                icon: Icon(Icons.add),
              )
            ],
          ),
        ],
      ),
    );
  }
}

class DescriptionInput extends StatelessWidget {
  TransFerenciaController controller = Get.find<TransFerenciaController>();
  DescriptionInput({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: TransferPalet.darkcolor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('Descreva'),
              padding: EdgeInsets.all(defaultPadding / 2),
              color: TransferPalet.darkcolor,
            ),
            Expanded(
                child: TextField(
              controller: controller.descriptionctl,
              maxLines: 10,
              decoration: InputDecoration(
                  hintText: 'descricao...',
                  hintStyle: TextStyle(color: Colors.grey.withOpacity(0.2)),
                  border: OutlineInputBorder(borderSide: BorderSide.none)),
            ))
          ],
        ),
      ),
    );
  }
}
