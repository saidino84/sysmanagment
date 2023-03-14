import 'package:get/get.dart';

class TransFerenciaController extends GetxController {
  var _show_transfer_forn = false.obs;

  bool get showTransferenceForm => _show_transfer_forn.value;

  void showtransferForm() {
    _show_transfer_forn.value = !_show_transfer_forn.value;
  }
}
