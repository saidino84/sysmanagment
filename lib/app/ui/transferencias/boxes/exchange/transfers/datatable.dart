import 'package:sysmanagment/app/data/models/transfer.dart';
import 'package:sysmanagment/shared.dart';

class TransferDataTable extends StatelessWidget {
  const TransferDataTable({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return DataStreamed();
  }
}

class DataStreamed extends GetView<TransFerenciaController> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SizedBox(
      width: double.infinity,
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.only(left: defaultPadding),
        child: StreamBuilder(
            stream: controller.getTransfersAstream(),
            builder: (ctx, snaps) {
              return DataTable(
                columns: const [
                  DataColumn(label: Text('ID')),
                  DataColumn(label: Text('Number')),
                  DataColumn(label: Text('Date')),
                  DataColumn(label: Text('Delivered')),
                  DataColumn(label: Text('TaxRate')),
                  DataColumn(label: Text('Subtotal')),
                  DataColumn(label: Text('Transport')),
                  DataColumn(label: Text('Total')),
                  DataColumn(label: Text('Delete & Edit')),
                  DataColumn(label: Text('user')),
                  DataColumn(label: Text('Description')),
                ],
                rows: _createDataRow(snaps),
              );
            }),
      ),
    );
  }
}

List<DataRow> _createDataRow(AsyncSnapshot<List<Transferencia>> trans) {
  TransFerenciaController controller = Get.find();
  if (trans.hasError) {
    print('ERROR...');
    print('*************  err ***********');
    print(trans.error);
    print('*************  err ***********');
  }
  if (trans.hasData) {
    print(
        '*****TRANSFERS FOUND NOW PUTTING THEM INTO DataTabe*****(ui/.../../transfers/datatable.dart)');
    var dados = trans.data ?? [];
    var rows = List.generate(dados.length, (index) {
      Transferencia transfer = dados[index];
      var data = DateTime.fromMicrosecondsSinceEpoch(
          transfer.date ?? DateTime.now().microsecondsSinceEpoch);
      return DataRow(
          selected: transfer.delivered,
          onSelectChanged: (value) {
            controller.updateTransfer(transfer.copyWith(
                hasSent: !transfer.hasSent, delivered: !transfer.delivered));
          },
          cells: [
            DataCell(Text('${index + 1}')),
            DataCell(Text('${transfer.number}')),
            DataCell(Text('${data}')),
            DataCell(Icon(
              transfer.delivered ? Icons.done : Icons.highlight_remove_rounded,
              color: transfer.delivered ? Colors.greenAccent : Colors.redAccent,
            )),
            DataCell(Text("${transfer.taxRate ?? 16}%")),
            DataCell(Text("${transfer.subtotal ?? 0.0}")),
            DataCell(Text("${transfer.transport ?? 0.0}%")),
            DataCell(Text("${transfer.total!.toStringAsFixed(2) ?? 0.0}")),
            DataCell(Row(
              children: [
                IconButton(
                    onPressed: () {
                      controller.deleteTransfer(transfer);
                    },
                    icon: const Icon(
                      Icons.delete_forever,
                      color: Colors.redAccent,
                    )),
                IconButton(
                    onPressed: () {
                      // controller.deleteTransfer(transfer);
                      controller.openToEditTransfer(transfer);
                    },
                    icon: const Icon(
                      Icons.edit,
                      color: Colors.blueAccent,
                    )),
              ],
            )),
            DataCell(Text("${transfer.username ?? 'admin'}")),
            DataCell(Text("${transfer.description}")),
          ]);
    });
    return rows;
  }
  return [];
}
