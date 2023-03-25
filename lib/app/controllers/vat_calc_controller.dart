import 'package:flutter/material.dart';
import 'package:get/get.dart';

class VatController extends GetxController {
  static var priceWithVatInput = TextEditingController(text: "1");
  static var priceWithotVatInput = TextEditingController(text: "1");

  static RxDouble _price_with_vat = 0.0.obs;
  static RxDouble _price_sem_iva = 0.0.obs;
  static RxDouble _totalVat = 0.0.obs;

  static double get price_vatset => _price_with_vat.value;
  static double get price_vatinset => _price_sem_iva.value;
  static double get vat_amount => _price_sem_iva.value;

  static var vat = 16;

  static double calcVatMaths() {
    try {
      // double iva_set = double.tryParse(priceWithotVatInput.text)! + (vat / 100);
      double iva_inset =
          double.tryParse(priceWithVatInput.text)! / (1 + vat / 100);

      // _price_with_vat.value = iva_set;
      _price_sem_iva.value = iva_inset;

      _totalVat.value = price_vatset - price_vatinset;

      priceWithotVatInput.text = _price_sem_iva.toString();
      // priceWithVatInput.text = _price_with_vat.toString();
    } on Exception {}
    return _totalVat.value;
  }

  static double getPriceWithoutVat(double price) {
    double price_without_vat = price / (1 + vat / 100);
    // double res = (price / (1 + vat / 100)) * price;
    // print('Second sink');
    priceWithotVatInput.text = price_without_vat.toStringAsFixed(2);
    return price_without_vat;
  }
}
