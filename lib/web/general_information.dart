import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  late final MapShapeSource _mapSource;
  @override
  void initState() {
    _mapSource = const MapShapeSource.asset('assets//geo_maps/world_map.json', shapeDataField: 'Tunisia');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(48),
      width: MediaQuery.sizeOf(context).width,
      height: MediaQuery.sizeOf(context).height,
      color: backgroundColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const CustomizedText(text: "ABOUT ME", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3),
          const SizedBox(height: 20),
          const CustomizedText(text: "General Info", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2),
          const SizedBox(height: 30),
          Flexible(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Flexible(child: SfMaps(layers: <MapLayer>[MapShapeLayer(source: _mapSource, color: reddish, strokeColor: white, strokeWidth: 2)])),
                  const SizedBox(height: 10),
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 20,
                    runSpacing: 20,
                    runAlignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: <Widget>[
                      for (final String data in qrCodes)
                        Tooltip(
                          preferBelow: false,
                          message: data,
                          child: SizedBox(
                            width: 100,
                            height: 100,
                            child: SfBarcodeGenerator(value: data, symbology: QRCode(inputMode: QRInputMode.alphaNumeric), barColor: reddish),
                          ),
                        )
                    ],
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}

class Model {
  Model(this.state, this.color, this.stateCode);

  String state;
  Color color;
  String stateCode;
}
