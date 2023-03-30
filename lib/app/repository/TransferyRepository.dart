import 'dart:core';

import 'package:sysmanagment/app/data/database/firebase/transferProvider.dart';
import 'package:sysmanagment/app/data/models/transfer.dart';

class TransferRepository {
  TransferProvider provider = TransferProvider();

  Stream<List<Transferencia>> get getTransfers =>
      provider.getTransfersAsStream();

  Future addTransfer(Transferencia transfer) async {
    provider.addTransfer(transfer);
  }

  List<String> meses = [];
}
