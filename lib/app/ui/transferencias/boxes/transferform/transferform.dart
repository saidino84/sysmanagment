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
          Obx(
            () => Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Text('TRANSFERENCIAS '),
                ElevatedButton.icon(
                  style: ElevatedButton.styleFrom(
                      // backgroundColor: TransferPalet.darkcolor,
                      ),
                  onPressed: () async {
                    if (controller.editTransfer) {
                      await controller.adicionarOuActualizar(true);
                      print('UPDATED');
                      return;
                    } else {
                      await controller.adicionarOuActualizar(false);
                    }
                    print('****DICIONADO');
                  },
                  label:
                      Text(controller.editTransfer ? 'ACTUALIZAR' : 'SALVAR'),
                  icon: controller.editTransfer
                      ? Icon(Icons.update)
                      : Icon(Icons.add),
                )
              ],
            ),
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
          border: Border.all(color: AppColors.darkcolor),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Text('Descreva'),
              padding: EdgeInsets.all(defaultPadding / 2),
              color: AppColors.darkcolor,
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
