import 'package:flutter/material.dart';
import 'package:sysmanagment/app/shared/constants.dart';
import 'package:sysmanagment/app/ui/responsive/responsive.dart';
import 'package:sysmanagment/app/ui/transferencias/inputs/input_add.dart';
import 'package:sysmanagment/app/ui/transferencias/wallet_pallets.dart';

class TranferForm extends StatelessWidget {
  const TranferForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: ResponsiveLayout.isMobile(context) ? null : 250,
      // color: Colors.black54,
      constraints: BoxConstraints(minHeight: 280, maxHeight: 450),
      padding: EdgeInsets.all(defaultPadding / 2),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: AddInput(
                  title: 'Numero',
                  input_width: 200,
                ),
              ),
              SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                child: AddInput(
                  title: 'Data',
                ),
              ),
              if (!ResponsiveLayout.isMobile(context))
                SizedBox(
                  width: defaultPadding,
                ),
              if (ResponsiveLayout.isTable(context) ||
                  ResponsiveLayout.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: AddInput(
                    title: 'Destino',
                    // input_width: 200,
                  ),
                ),
            ],
          ),
          SizedBox(
            height: defaultPadding,
          ),
          if (ResponsiveLayout.isMobile(context) ||
              ResponsiveLayout.islargeMobile(context))
            AddInput(
              title: 'Destino',
              // input_width: 200,
            ),
          SizedBox(
            height: defaultPadding,
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                flex: 2,
                child: AddInput(
                  title: 'Subtotal',
                ),
              ),
              SizedBox(
                width: defaultPadding,
              ),
              Expanded(
                flex: 2,
                child: AddInput(
                  title: 'Iva',
                  hint: '16%',
                ),
              ),
              if (!ResponsiveLayout.isMobile(context))
                SizedBox(
                  width: defaultPadding / 2,
                ),
              if (ResponsiveLayout.isTable(context) ||
                  ResponsiveLayout.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: AddInput(
                    title: 'Tranporte',
                    hint: '10%',
                  ),
                ),
              if (!ResponsiveLayout.isMobile(context))
                SizedBox(
                  width: defaultPadding,
                ),
              if (ResponsiveLayout.isTable(context) ||
                  ResponsiveLayout.isDesktop(context))
                Expanded(
                  flex: 2,
                  child: AddInput(
                    title: 'Total',
                    // input_width: 200,
                  ),
                ),
            ],
          ),
          if (ResponsiveLayout.isMobile(context) ||
              ResponsiveLayout.islargeMobile(context))
            Expanded(
              child: Column(
                children: [
                  SizedBox(
                    height: defaultPadding,
                  ),
                  Expanded(
                    flex: 2,
                    child: AddInput(
                      title: 'Transporte',
                      // input_width: 200,
                      hint: '10%',
                    ),
                  ),
                  SizedBox(
                    height: defaultPadding / 2,
                  ),
                  Expanded(
                    flex: 2,
                    child: AddInput(
                      title: 'Total',
                    ),
                  ),
                ],
              ),
            ),
          SizedBox(
            height: defaultPadding,
          ),
          Expanded(
            child: AddInput(
              title: 'Descricao',
              maxLine: 5,
              multiline: true,
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionInput extends StatelessWidget {
  const DescriptionInput({
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
