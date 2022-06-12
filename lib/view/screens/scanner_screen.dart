import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg_provider/flutter_svg_provider.dart';
import 'package:openfoodfacts/openfoodfacts.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:selecteat_app/utils/constants.dart';
import 'package:selecteat_app/view/components/bottomnav.dart';
import 'package:selecteat_app/view/screens/home_screen.dart';

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
  bool loading = false;
  String? errorMessage;

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller!.pauseCamera();
    } else if (Platform.isIOS) {
      controller!.resumeCamera();
    }
  }

  void _addProductToList() async {
    return null;
  }

  void _addProductToFavs() async {
    return null;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      bottomNavigationBar: const BottomNav(),
      body: Stack(
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
          (product != null && errorMessage == null)
              ? Positioned(
                  child: Container(
                      width: size.width,
                      // height: size.height / 3,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 40),
                      decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(30.0),
                            topLeft: Radius.circular(30.0),
                          ),
                          boxShadow: [
                            BoxShadow(color: Colors.black12, blurRadius: 10),
                          ]),
                      child: Column(
                        children: [
                          Row(
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
                                    Text(
                                        product!.product!.productName
                                            .toString(),
                                        style: Theme.of(context)
                                            .textTheme
                                            .headline6!
                                            .copyWith(
                                                fontWeight: FontWeight.bold)),
                                    const SizedBox(height: 10),
                                    Image(
                                        image: Svg(
                                      "https://static.openfoodfacts.org/images/attributes/nutriscore-" +
                                          product!.product!.nutriscore
                                              .toString() +
                                          ".svg",
                                      source: SvgSource.network,
                                    )),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: size.height / 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              SizedBox(
                                width: size.width / 1.4,
                                child: Flex(
                                  direction: Axis.horizontal,
                                  children: [
                                    Expanded(
                                      child: TextButton(
                                        style: TextButton.styleFrom(
                                            primary: Colors.white,
                                            backgroundColor: brandPrimaryColor,
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 40, vertical: 15)),
                                        onPressed: _addProductToList,
                                        child: const Text(
                                          'Add to list +',
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              TextButton(
                                onPressed: _addProductToFavs,
                                child: const Icon(
                                  Icons.favorite,
                                  color: Colors.grey,
                                  size: 24,
                                ),
                                style: TextButton.styleFrom(
                                  backgroundColor: brandLightGreyColor,
                                  padding: EdgeInsets.zero,
                                  minimumSize: const Size(46, 46),
                                  shape: const RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(5)),
                                  ),
                                ),
                              ),
                            ],
                          )
                        ],
                      )),
                  bottom: 0,
                )
              : const SizedBox(),
          loading == true
              ? Positioned(
                  child: SizedBox(
                    width: size.width,
                    child: const Center(
                      child:
                          CircularProgressIndicator(color: brandPrimaryColor),
                    ),
                  ),
                  bottom: size.height / 6,
                )
              : const SizedBox(),
          errorMessage != null
              ? AlertDialog(
                  title: Text(errorMessage!),
                  content:
                      const Text('This product was not found in our catalog.'),
                  actions: [
                    TextButton(
                      onPressed: () => Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ScannerScreen(),
                          )),
                      child: const Text('Try again'),
                    ),
                  ],
                )
              : const SizedBox(),
        ],
      ),
    );
  }

  void onQRViewCreated(QRViewController controller) {
    setState(() => this.controller = controller);

    controller.scannedDataStream.listen((scanData) {
      setState(() {
        result = scanData;
        loading = true;
      });
      getProductNutriscore();
    });
  }

  @override
  void dispose() {
    controller!.dispose();
    super.dispose();
  }

  void getProductNutriscore() async {
    loading = true;
    ProductQueryConfiguration configurations = ProductQueryConfiguration(
        result!.code.toString(),
        language: OpenFoodFactsLanguage.ENGLISH,
        fields: [ProductField.ALL]);

    ProductResult productResult =
        await OpenFoodAPIClient.getProduct(configurations);

    product = productResult;

    if (productResult.status == 1) {
      setState(() {
        loading = false;
        // product = productResult;
      });
      // print(productResult.toJson());
      print('LOADING: $loading');
    }

    if (productResult.status != 1) {
      setState(() {
        errorMessage = productResult.statusVerbose.toString();
      });
      // throw Exception('product could not be added');
    }

    print('PRODUCT: $product');
    print('ERROR: $errorMessage');
  }
}
