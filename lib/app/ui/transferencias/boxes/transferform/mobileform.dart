import 'package:sysmanagment/shared.dart';

import 'transferSendBackstatusCheck.dart';

class MobileandLargeMobileForm extends StatelessWidget {
  TransFerenciaController controller = Get.find<TransFerenciaController>();
  MobileandLargeMobileForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AddInput(
          title: 'Numero',
          // input_width: 200,
          controller: controller.numberctl,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        AddInput(
          title: 'Data',
          // input_width: 200,
          controller: controller.datectl,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        AddInput(
          title: 'Destino',
          // input_width: 200,
          controller: controller.destinectl,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        AddInput(
          title: 'Subtotal',
          // input_width: 200,
          controller: controller.subtotalctl,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        AddInput(
          title: 'Iva',
          // input_width: 200,
          controller: controller.vatctl,
        ),
        SizedBox(
          height: defaultPadding,
        ),
        AddInput(
          title: 'Transporte',
          // input_width: 200,
          controller: controller.transportctl,
        ),
        TransferSendBackStaus(
          controller: controller,
        ),
      ],
    );
  }
}
