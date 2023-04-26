import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/tranferencia_controller.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/shared/appColors.dart';

import 'exchange/transfers/datatable.dart';
import 'transferform/transferform.dart';

class TransfersUi extends GetView<TransFerenciaController> {
  const TransfersUi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.only(
        right: defaultPadding,
      ),
      decoration: BoxDecoration(
          color: AppColors.secondary, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(defaultPadding / 2),
                  color: AppColors.darkcolor,
                  child: Text('TRANSFERENCIAS ')),
              TextButton.icon(onPressed: () {
                controller.showtransferForm();
              }, icon: Obx(() {
                return Icon(
                    controller.showTransferenceForm ? Icons.close : Icons.add);
              }), label: Obx(() {
                return Text(controller.showTransferenceForm ? '' : 'NOVA');
              }))
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          Obx(() {
            return controller.showTransferenceForm
                ? TranferForm()
                : Container();
          }),
          Divider(
            color: AppColors.primaryColor,
          ),
          TransferDataTable()
        ],
      ),
    );
  }
}
