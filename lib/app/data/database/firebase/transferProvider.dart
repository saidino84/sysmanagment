import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sysmanagment/app/data/models/transfer.dart';

class TransferProvider {
  FirebaseFirestore get firestoredb => FirebaseFirestore.instance;
  CollectionReference get firestoredbRef =>
      firestoredb.collection('sysmanagment/transfers/transferencias');
  //JEITO MELHOR DE OBTER REFERENCIA ONDE POSSO USAR PRA OBTER DADOS E ADICIONAR ADOS
  // //ATRAVES DO MEU MODELO
  get _transfersRef => FirebaseFirestore.instance
      .collection('sysmanagment/transfers/transferencias')
      .withConverter<Transferencia>(
          fromFirestore: (transfer, _) =>
              Transferencia.fromJson(transfer.data()!),
          toFirestore: (transfer, _) => transfer.toJson);
  Future<void> addTransfer(Transferencia transfer) async {
    // _transfersRef.add(transfer);
    try {
      firestoredbRef
          .add(transfer.toJson)
          .then((value) => print('ADICIONADO'))
          .catchError((err) => print('FALOU $err'));
    } catch (e) {}
  }

  List<Transferencia> getTransferQuery(QuerySnapshot snapshot) {
    return snapshot.docs.map((json) {
      Map<String, dynamic> dados = json.data() as Map<String, dynamic>;
      Transferencia transfer =
          Transferencia.fromJson(dados).copyWith(id: json.id);
      return transfer;
    }).toList();
  }

  Stream<List<Transferencia>> getTransfersAsStream() {
    return firestoredbRef.snapshots().map((getTransferQuery));
  }
}
