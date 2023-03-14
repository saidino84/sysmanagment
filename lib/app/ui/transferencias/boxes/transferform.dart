import 'package:flutter/material.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/transferencias/inputs/input_add.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

class TranferForm extends StatelessWidget {
  const TranferForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      // color: Colors.black54,
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  AddInput(
                    title: 'Numero',
                    input_width: 200,
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  AddInput(
                    title: 'Destino',
                    input_width: 350,
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  AddInput(
                    title: 'Data',
                    input_width: 200,
                  ),
                ],
              ),
              SizedBox(
                height: defaultPadding,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AddInput(
                    title: 'Subtotal',
                    input_width: 200,
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  AddInput(
                    title: 'Iva',
                    input_width: 170,
                    hint: '16%',
                  ),
                  SizedBox(
                    width: defaultPadding / 2,
                  ),
                  AddInput(
                    title: 'Tranporte',
                    hint: '10%',
                    input_width: 170,
                  ),
                  SizedBox(
                    width: defaultPadding,
                  ),
                  AddInput(
                    title: 'Total',
                    input_width: 200,
                  ),
                ],
              ),
            ],
          ),
          SizedBox(
            width: defaultPadding,
          ),
          Expanded(
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
                    maxLines: 10,
                    decoration: InputDecoration(
                        hintText: 'descricao...',
                        hintStyle:
                            TextStyle(color: Colors.grey.withOpacity(0.2)),
                        border:
                            OutlineInputBorder(borderSide: BorderSide.none)),
                  ))
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
