import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:selecteat_app/utils/constants.dart';

class ScannerScreen extends StatefulWidget {
  const ScannerScreen({Key? key}) : super(key: key);

  @override
  State<ScannerScreen> createState() => _ScannerScreenState();
}

class _ScannerScreenState extends State<ScannerScreen> {
  final GlobalKey qrKey = GlobalKey(debugLabel: 'QR');
  Barcode? result;
  ProductResult? product;
  QRViewController? controller;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  @override
  void dispose() {
    controller?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Stack(
      children: [
        QRView(
          key: qrKey,
          onQRViewCreated: onQRViewCreated,
          overlay: QrScannerOverlayShape(
            borderColor: result != null ? brandPrimaryColor : Colors.white,
            borderLength: 30,
            borderWidth: 15,
            borderRadius: 10,
          ),
        ),
        (result != null)
            ? Positioned(
                child: Container(
                  width: size.width,
                  // height: size.height / 3,
                  padding:
                      const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(30.0),
                        topLeft: Radius.circular(30.0),
                      ),
                      boxShadow: [
                        BoxShadow(color: Colors.black12, blurRadius: 10),
                      ]),
                  child: product != null
                      ? Row(
                          children: [
                            Container(
                              width: size.width / 2.5,
                              height: size.height / 5,
                              padding: const EdgeInsets.all(20),
                              decoration: const BoxDecoration(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(5)),
                                  boxShadow: [
                                    BoxShadow(
                                        color: Colors.black12, blurRadius: 10)
                                  ]),
                              child: Center(
                                child: CachedNetworkImage(
                                  width: size.width / 3,
                                  imageUrl: product!.product!.imageFrontUrl
                                      .toString(),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: size.width / 20,
                            ),
                            Expanded(
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    product!.product!.brands.toString(),
                                    style: const TextStyle(
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  const SizedBox(height: 10),
                                  Text(product!.product!.productName.toString(),
                                      style: Theme.of(context)
                                          .textTheme
                                          .headline6!
                                          .copyWith(
                                              fontWeight: FontWeight.bold)),
                                  const SizedBox(height: 10),
                                  Image(image: Svg(
                                      "https://static.openfoodfacts.org/images/attributes/nutriscore-"+ product!.product!.nutriscore.toString() + ".svg",
                                      source: SvgSource.network,
                                    )
                                  ),
                                ],
                              ),
                            ),
                          ],
                        )
                      : const Spacer(),
                ),
                bottom: 0,
              )
            : Positioned(
                child: const Text(
                  "Scan BARCODE",
                  style: TextStyle(fontSize: 24, color: Colors.white),
                ),
                bottom: size.height / 8,
              ),
      ],
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
      });
      getProductNutriscore();
    });
  }

  void getProductNutriscore() async {
    ProductQueryConfiguration configurations = ProductQueryConfiguration(
        result!.code.toString(),
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL]);

    ProductResult productResult =
        await OpenFoodAPIClient.getProduct(configurations);

    product = productResult;

    if (productResult.status == 1) {
      // setState(() {
      //   product = productResult;
      // });
      print(productResult.product!.toJson());
    }

    if (productResult.status != 1) {
      throw Exception('product could not be added');
    }
  }
}
