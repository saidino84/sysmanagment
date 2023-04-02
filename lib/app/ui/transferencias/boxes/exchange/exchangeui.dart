import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/controllers/vat_calc_controller.dart';
import 'package:sysmanagment/app/ui/global/flash_msg.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

import 'componets/input.dart';

class ExchangeUi extends StatelessWidget {
  const ExchangeUi({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxHeight: 260, minHeight: 200),
      padding: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: TransferPalet.secondary,
          borderRadius: BorderRadius.circular(8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Calcule Preco sem Iva e:'),
          MyInput(
            controller: VatController.priceWithVatInput,
            hint: '0.0',
          ),
          Container(
            margin: EdgeInsets.only(top: 8.0),
            height: 38,
            width: double.infinity,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(
                  Icons.currency_exchange_sharp,
                  color: Colors.white30,
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'SEM IVA',
                        style: TextStyle(fontSize: 8),
                      ),
                      Obx(() {
                        return Text(
                            VatController.price_vatinset.toStringAsFixed(2));
                      }),
                    ],
                  ),
                )
              ],
            ),
          ),
          // MyInput(
          //   controller: VatController.priceWithotVatInput,
          // ),
          SizedBox(
            height: 12,
          ),
          Center(
            child: Container(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  VatController.calcVatMaths();
                  SnackMessager.showMessage(
                      context, MessageType.SUCESSULL, 'SETTING DONE !');
                },
                child: Text('Exchange Rate'),
                style: TextButton.styleFrom(
                    padding: EdgeInsets.all(18), alignment: Alignment.center),
              ),
            ),
          )
        ],
      ),
    );
  }
}
