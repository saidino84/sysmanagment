import 'package:sysmanagment/app/data/models/transfer.dart';
import 'package:sysmanagment/app/repository/TransferyRepository.dart';
import 'package:sysmanagment/shared.dart';

class TransFerenciaController extends GetxController {
  final repository = TransferRepository();
  final numberctl = TextEditingController();
  TextEditingController get datectl =>
      TextEditingController(text: "${today.day}/${today.month}/${today.year}");
  final subtotalctl = TextEditingController();
  final destinectl = TextEditingController();
  final vatctl = TextEditingController();
  final transportctl = TextEditingController();
  final usernamectl = TextEditingController();
  final descriptionctl = TextEditingController();
  final transfersent = true.obs;
  final transferhaseturn = false.obs;
  TextEditingController get total {
    // subtotal.text ?? 0.0;
    return TextEditingController(text: '');
  }

  bool get transferHassent => transfersent.value;
  bool get transferReturn => transferhaseturn.value;

  void changeTransferSent(bool? value) {
    print(value);
    transfersent.value = !transfersent.value;
  }

  void changeTransferReturn(bool? value) {
    print(value);
    transferhaseturn.value = !transferhaseturn.value;
  }

  var _show_transfer_forn = false.obs;

  DateTime get today => DateTime.now();
  bool get showTransferenceForm => _show_transfer_forn.value;

  void showtransferForm() {
    _show_transfer_forn.value = !_show_transfer_forn.value;
  }

  Future adicionar() async {
    final taxRate = double.tryParse(vatctl.text) ?? 16.0;
    final transport = double.tryParse(transportctl.text) ?? 0.0;
    final subtotal = double.tryParse(subtotalctl.text) ?? 1.0;
    double total = (taxRate / 100) * subtotal + subtotal;
    if (transport > 0.0) {
      total = (transport / 100) * total + total;
    }
    try {
      repository.addTransfer(Transferencia(
        number: int.tryParse(numberctl.text),
        destine: destinectl.text,
        date: today.microsecondsSinceEpoch, //datectl.text,
        subtotal: subtotal,
        transport: transport,
        taxRate: taxRate,
        username: 'root',
        total: total,
        description: descriptionctl.text,
        delivered: transferReturn,
        hasSent: transferHassent,
      ));
      print('EDED');
    } catch (e) {
      print('ERROR');
    }
  }

  Stream<List<Transferencia>> getTransfersAstream() {
    return repository.getTransfers;
  }
}
