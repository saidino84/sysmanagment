import 'package:flutter/material.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

import 'exchange/transfers/datatable.dart';
import 'transferform.dart';

class TransfersUi extends StatelessWidget {
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
          color: TransferPalet.secondary,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                  padding: EdgeInsets.all(defaultPadding / 2),
                  color: TransferPalet.darkcolor,
                  child: Text('TRANSFERENCIAS ')),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          TranferForm(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Text('TRANSFERENCIAS '),
              ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: TransferPalet.darkcolor,
                ),
                onPressed: () {},
                label: Text('SALVAR'),
                icon: Icon(Icons.add),
              )
            ],
          ),
          Divider(
            color: TransferPalet.primaryColor,
          ),
          TransferDataTable()
        ],
      ),
    );
  }
}
