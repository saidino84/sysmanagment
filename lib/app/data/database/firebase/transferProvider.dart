import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';
import 'package:sysmanagment/app/data/models/transfer.dart';
import 'package:sysmanagment/app/ui/global/flash_msg.dart';

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

  deleteTransferById(Transferencia transfer) {
    firestoredbRef.doc(transfer.id).delete().then((value) {
      SnackMessager.showMessage(Get.context!, MessageType.ERROR,
          "Transfer ${transfer.number} DELETADO COM SUCESSO");
    }).onError((error, stackTrace) {
      SnackMessager.showMessage(Get.context!, MessageType.SUCESSULL,
          "Transfer ${transfer.number} FALHA AO REMOVER");
    });
  }

  updateTransferById(Transferencia transfer) {
    print('ID S ${transfer.id}');
    firestoredbRef.doc(transfer.id).update(transfer.toJson).then((value) {
      SnackMessager.showMessage(Get.context!, MessageType.SUCESSULL,
          "Transfer ${transfer.number} Actualizado Com Sucesso");
    }).onError((error, stackTrace) {
      SnackMessager.showMessage(Get.context!, MessageType.ERROR,
          "Transfer ${transfer.number} FALHA AO NA ACTUALIZACOA $error");
      print(error);
    });
  }

  Stream<List<Transferencia>> getTransfersAsStream() {
    return firestoredbRef.snapshots().map((getTransferQuery));
  }
}
