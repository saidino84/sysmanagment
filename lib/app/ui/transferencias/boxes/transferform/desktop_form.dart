import 'package:sysmanagment/shared.dart';

class DeskTopandTabletForm extends StatelessWidget {
  TransFerenciaController controller = Get.find<TransFerenciaController>();

  DeskTopandTabletForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Expanded(
              child: AddInput(
                title: 'Numero',
                input_width: 200,
                controller: controller.numberctl,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              child: AddInput(
                title: 'Data',
                controller: controller.datectl,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              flex: 2,
              child: AddInput(
                title: 'Destino',
                controller: controller.destinectl,
                // input_width: 200,
              ),
            ),
          ],
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
                controller: controller.subtotalctl,
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
                controller: controller.vatctl,
              ),
            ),
            SizedBox(
              width: defaultPadding / 2,
            ),
            Expanded(
              flex: 2,
              child: AddInput(
                title: 'Tranporte',
                hint: '10%',
                controller: controller.transportctl,
              ),
            ),
            SizedBox(
              width: defaultPadding,
            ),
            Expanded(
              flex: 2,
              child: AddInput(
                title: 'Total',
                controller: controller.total,
                // input_width: 200,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
