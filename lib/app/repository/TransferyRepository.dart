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

  Future deleteTransfe(Transferencia transfer) async {
    await provider.deleteTransferById(transfer);
  }

  Future upateTransfer(Transferencia transfer) async {
    provider.updateTransferById(transfer);
  }

  List<String> meses = [];
}
