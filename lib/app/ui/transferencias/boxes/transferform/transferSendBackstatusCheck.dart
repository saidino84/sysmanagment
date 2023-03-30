import 'package:sysmanagment/shared.dart';

class TransferSendBackStaus extends StatelessWidget {
  const TransferSendBackStaus({
    super.key,
    required this.controller,
  });

  final TransFerenciaController controller;

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Column(
        children: [
          CheckboxListTile(
            value: controller.transfersent.value,
            onChanged: controller.changeTransferSent,
            title: Row(
              children: [
                Text(controller.transfersent.value
                    ? 'Document Has Sent'
                    : 'Document Have Not sent yet'),
                Icon(
                  controller.transfersent.value
                      ? Icons.mark_as_unread
                      : Icons.question_mark_rounded,
                  color: Color(
                      controller.transfersent.value ? 0xff00ff00 : 0xffffff00),
                )
              ],
            ),
          ),
          CheckboxListTile(
            value: controller.transferhaseturn.value,
            onChanged: controller.changeTransferReturn,
            title: Row(
              children: [
                Text(controller.transferhaseturn.value
                    ? 'Document Has Received'
                    : 'Document Have Not Gotten Bck'),
                Icon(
                  controller.transferhaseturn.value
                      ? Icons.check
                      : Icons.question_mark_rounded,
                  color: Color(controller.transferhaseturn.value
                      ? 0xff00ff00
                      : 0xffffff00),
                )
              ],
            ),
          ),
        ],
      );
    });
  }
}
