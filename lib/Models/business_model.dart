import 'dart:typed_data';

import 'package:get/get.dart';

class Business {
  String? name;
  String? address;
  String? phone;
  String? email;
  Uint8List? logo;
  RxString? scanResult;
  Business({
    this.name,
    this.address,
    this.phone,
    this.email,
    this.logo,
    this.scanResult,
  });
}
