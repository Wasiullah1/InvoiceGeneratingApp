import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';

class BarcodeScan extends StatefulWidget {
  const BarcodeScan({super.key});

  @override
  State<BarcodeScan> createState() => _BarcodeScanState();
}

class _BarcodeScanState extends State<BarcodeScan> {
  String? scanResult;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                  primary: Colors.amber, onPrimary: Colors.black),
              onPressed: scanBarcode,
              icon: Icon(Icons.camera_alt_outlined),
              label: Text('Start Scan')),
          SizedBox(height: 20),
          Text(
            scanResult == null ? 'Scan a code' : 'Scan result : $scanResult',
            style: TextStyle(fontSize: 18),
          )
        ],
      ),
    );
  }

  Future scanBarcode() async {
    String scanResult;
    try {
      scanResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666",
        "Cancel",
        true,
        ScanMode.BARCODE,
      );
    } on PlatformException {
      scanResult = 'Failed to get platform version';
    }
    if (!mounted) return;

    setState(() {
      this.scanResult = scanResult;
    });
  }
}
