// ignore_for_file: avoid_web_libraries_in_flutter

import 'dart:html';

import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_animated_button/flutter_animated_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hafedh_gunichi/utils/functions.dart';
import 'package:syncfusion_flutter_barcodes/barcodes.dart';
import 'package:syncfusion_flutter_maps/maps.dart';

import '../utils/custom_classes.dart';
import '../utils/global_variables.dart';

final class Model {
  Model(this.state, this.color);

  String state;
  Color color;
}

class GeneralInformation extends StatefulWidget {
  const GeneralInformation({super.key});

  @override
  State<GeneralInformation> createState() => _GeneralInformationState();
}

class _GeneralInformationState extends State<GeneralInformation> {
  late final MapShapeSource _mapSource;
  late final List<Model> data;

  @override
  void initState() {
    data = <Model>[
      Model('Tunisia', blue),
    ];
    _mapSource = MapShapeSource.asset(
      'assets/geo_maps/world_map.json',
      shapeDataField: 'name',
      dataCount: data.length,
      primaryValueMapper: (int index) => data[index].state,
      dataLabelMapper: (int index) => data[index].state,
      shapeColorValueMapper: (int index) => data[index].color,
    );
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
          const CustomizedText(text: "ABOUT ME", color: reddish, fontWeight: FontWeight.bold, letterSpacing: 3).animate().slide().fade(),
          const SizedBox(height: 20),
          const CustomizedText(text: "General Info", fontSize: 50, fontWeight: FontWeight.bold, letterSpacing: 2).animate().slide().fade(),
          const SizedBox(height: 30),
          Flexible(
            child: Center(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Flexible(
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(25),
                        child: SfMaps(
                          layers: <MapLayer>[
                            MapShapeLayer(
                              source: _mapSource,
                              zoomPanBehavior: MapZoomPanBehavior(zoomLevel: 5, focalLatLng: const MapLatLng(35.108500603895118, 10.293342800422188)),
                              color: reddish.withOpacity(.6),
                              strokeColor: grey,
                              strokeWidth: 2,
                              showDataLabels: true,
                              dataLabelSettings: MapDataLabelSettings(textStyle: GoogleFonts.roboto(color: Colors.amber, fontSize: 16)),
                            ),
                          ],
                        ),
                      ).animate().slide().fade(),
                    ),
                    const SizedBox(height: 10),
                    Flexible(child: Center(child: const CustomizedText(text: how, color: grey, letterSpacing: 2).animate().slide().fade())),
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
                          ).animate().slide().fade(),
                      ],
                    ),
                    const SizedBox(height: 10),
                    AnimatedButton(
                      text: "DOWNLOAD CV",
                      animatedOn: AnimatedOn.onHover,
                      animationDuration: 1500.ms,
                      borderColor: reddish,
                      borderRadius: 0,
                      borderWidth: .3,
                      onPress: () {
                        final AnchorElement anchorElement = AnchorElement(href: 'assets/assets/files/Hafedh GUENICHI.pdf');
                        anchorElement.setAttribute('download', 'Hafedh GUENICHI.pdf');
                        anchorElement.click();
                        showToast("CV HAS BEEN DOWNLOADED SUCCESSFULLY");
                      },
                      selectedBackgroundColor: white,
                      backgroundColor: reddish.withOpacity(.8),
                      selectedTextColor: Colors.black,
                      height: 50,
                      width: 150,
                      transitionType: TransitionType.CENTER_ROUNDER,
                      textStyle: GoogleFonts.roboto(color: white, fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
