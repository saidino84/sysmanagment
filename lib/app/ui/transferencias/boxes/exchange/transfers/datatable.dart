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
                  DataColumn(label: Text('Action')),
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
  if (trans.hasError) {
    print('ERROR...');
    print('*************  err ***********');
    print(trans.error);
    print('*************  err ***********');
  }
  if (trans.hasData) {
    print('*******FROM API TO LIST ********');
    print(trans.data);
    var dados = trans.data ?? [];
    var rows = List.generate(dados.length, (index) {
      Transferencia transfer = dados[index];
      var data = DateTime.fromMicrosecondsSinceEpoch(
          transfer.date ?? DateTime.now().microsecondsSinceEpoch);
      return DataRow(cells: [
        DataCell(Text('${index}')),
        DataCell(Text('${transfer.number}')),
        DataCell(Text('${data}')),
        DataCell(Icon(
          transfer.delivered ? Icons.done : Icons.highlight_remove_rounded,
          color: transfer.delivered ? Colors.greenAccent : Colors.redAccent,
        )),
        DataCell(Text("${transfer.taxRate ?? 16}%")),
        DataCell(Text("${transfer.subtotal ?? 0.0}")),
        DataCell(Text("${transfer.transport ?? 0.0}%")),
        DataCell(Text("${transfer.total ?? 0.0}%")),
        DataCell(IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.download,
              color: Colors.blueAccent,
            ))),
        DataCell(Text("${transfer.username ?? 'admin'}")),
        DataCell(Text("${transfer.description}")),
      ]);
    });
    return rows;
  }
  return [];
}
