class Transferencia {
  String? id;
  int? number;
  int? date;
  bool hasSent;
  bool delivered;
  double? taxRate;
  double? subtotal;
  double? transport;
  double? total;
  String? username;
  String? description;
  String? destine;
  String? fileurl;

  Transferencia({
    this.id,
    this.number,
    this.date,
    this.hasSent = true,
    this.delivered = false,
    this.taxRate,
    this.subtotal,
    this.transport,
    this.total,
    this.username,
    this.description,
    this.destine,
    this.fileurl,
  });

  factory Transferencia.fromJson(Map<String, dynamic> json) {
    return Transferencia(
      id: json['id'],
      number: json['number'],
      date: json['date'],
      hasSent: json['hasSent'],
      delivered: json['delivered'],
      taxRate: json['taxRate'],
      subtotal: json['subtotal'],
      transport: json['transport'],
      total: json['total'],
      username: json['usernme'],
      description: json['description'],
      destine: json['destine'],
      fileurl: json['fileUrl'],
    );
  }

  Transferencia copyWith({
    String? id,
    int? number,
    int? date,
    bool? hasSent,
    bool? delivered,
    double? taxRate,
    double? subtotal,
    double? transport,
    double? total,
    String? username,
    String? description,
    String? destine,
    String? fileurl,
  }) {
    return Transferencia(
        id: id ?? this.id,
        number: number ?? this.number,
        date: date ?? this.date,
        hasSent: hasSent ?? this.hasSent,
        delivered: delivered ?? this.delivered,
        taxRate: taxRate ?? this.taxRate,
        subtotal: subtotal ?? this.subtotal,
        transport: transport ?? this.transport,
        total: total ?? this.total,
        username: username ?? this.username,
        description: description ?? this.description,
        destine: destine ?? this.destine,
        fileurl: fileurl ?? this.fileurl);
  }

  Map<String, dynamic> get toJson => {
        'id': id,
        'number': number,
        'date': date,
        'hasSent': hasSent,
        'delivered': delivered,
        'taxRate': taxRate,
        'subtotal': subtotal,
        'transport': transport,
        'total': total,
        'usernme': username,
        'description': description,
        'destine': destine,
        'fileUrl': fileurl,
      };
}
