import 'dart:io';
import 'package:printing/printing.dart';

import 'package:fetch_data/models/detailfetch.dart';
import 'package:fetch_data/screens/pdfstorage.dart';
import 'package:fetch_data/widgets/userdetail_screen.dart';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserDetailPage extends StatefulWidget {
  var name;
  var w;
  var s1;
  var s2;
  var a1;
  var a2;
  var a3;
  var a4;
  var tracking;
  var tracking2;
  var billing;
  var desc;
  var refno1;
  var refno2;
  var lastD1;
  var lastD2;
  var maxi;
  var country;

  UserDetailPage(
      {super.key,
      this.tracking,
      this.a4,
      this.name,
      this.w,
      this.a1,
      this.a2,
      this.a3,
      this.s1,
      this.s2,
      this.tracking2,
      this.billing,
      this.desc,
      this.refno1,
      this.refno2,
      this.lastD1,
      this.lastD2,
      this.maxi,
      this.country});

  @override
  State<UserDetailPage> createState() => _UserDetailPageState();
}

class _UserDetailPageState extends State<UserDetailPage> {
  Future _createPdf() async {
    final PdfColor;
    var FontWeight;
    final maxinet = await networkImage(widget.maxi);
    final countrynet = await networkImage(widget.country);
    final assetsimage = await (rootBundle.load('assets/images/gift.jpg'));
    final imageass = pw.MemoryImage(assetsimage.buffer.asUint8List());

    final bar = pw.BarcodeWidget(
        drawText: false,
        barcode: pw.Barcode.fromType(
          pw.BarcodeType.Code128,
        ),
        data: widget.tracking2);
    final font = await rootBundle.load('assets/fonts/Consolas-Regular.ttf');
    final fontBold = await rootBundle.load('assets/fonts/Consolas-Bold.ttf');
    final fontArialB = await rootBundle.load('assets/fonts/Arial-Bold.ttf');
    final fonthel = await rootBundle.load('assets/fonts/Helvetica-Regular.ttf');
    final fontcalibribold =
        await rootBundle.load('assets/fonts/calibri-bold.ttf');
    final fontcali = await rootBundle.load('assets/fonts/calibri-regular.ttf');

    final ttf = pw.Font.ttf(font);
    final ttfbold = pw.Font.ttf(fontBold);
    final ArialB = pw.Font.ttf(fontArialB);
    final calibriBold = pw.Font.ttf(fontcalibribold);
    final calibri = pw.Font.ttf(fontcali);
    final halv = pw.Font.ttf(fonthel);
    final pdf = pw.Document();
    pdf.addPage(pw.Page(
      pageFormat: PdfPageFormat(700, 1026),
      build: (context) {
        return pw.Flexible(
            child: pw.Container(
          padding: pw.EdgeInsets.only(top: 5, left: 5),
          width: double.infinity,
          decoration: pw.BoxDecoration(
            border: pw.Border.all(),
          ),
          child: pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          widget.name,
                          style: pw.TextStyle(
                              fontBold: ttfbold,
                              fontSize: 22,
                              font: ttf,
                              height: 0.2),
                        ),
                        pw.Text(
                          widget.s1,
                          style: pw.TextStyle(
                            height: 0.2,
                            fontBold: ttfbold,
                            fontSize: 22,
                            font: ttf,
                          ),
                        ),
                        pw.Text(
                          widget.s2,
                          style: pw.TextStyle(
                              height: 0.2,
                              fontSize: 22,
                              font: ttf,
                              fontWeight: pw.FontWeight.bold),
                        )
                      ],
                    ),
                    pw.Text('${widget.w}LBS',
                        style: pw.TextStyle(
                            //font: ttfbold,
                            fontSize: 30,
                            fontWeight: pw.FontWeight.bold)),
                    pw.Text('1 OF 1',
                        style: pw.TextStyle(fontSize: 28, font: ttfbold))
                  ]),
              pw.SizedBox(height: 35),
              pw.Container(
                  height: 190,
                  alignment: pw.Alignment.bottomLeft,
                  width: double.infinity,
                  child: pw.Column(
                      crossAxisAlignment: pw.CrossAxisAlignment.start,
                      children: [
                        pw.Text(
                          'SHIP TO:',
                          style: pw.TextStyle(
                            fontWeight: pw.FontWeight.bold,
                            fontSize: 31,
                            font: calibriBold,
                            //fontWeight: pw.FontWeight.bold
                          ),
                        ),
                        pw.Container(
                            child: pw.Row(
                                mainAxisAlignment: pw.MainAxisAlignment.start,
                                children: [
                              pw.Container(width: 44.5),
                              pw.Column(
                                  crossAxisAlignment:
                                      pw.CrossAxisAlignment.start,
                                  children: [
                                    pw.Text(
                                      "${widget.a1}\n${widget.a2}\n${widget.a3}\n",
                                      style: pw.TextStyle(
                                          height: 0.9,
                                          //fontBold: ttfbold,
                                          fontSize: 25,
                                          font: ttf,
                                          fontWeight: pw.FontWeight.bold),
                                    ),
                                    pw.Text(
                                      widget.a4,
                                      style: pw.TextStyle(
                                        letterSpacing: 0.0,
                                        wordSpacing: 0.6,
                                        height: 0.50,
                                        fontSize: 40,
                                        font: ttfbold,
                                        //fontWeight: pw.FontWeight.bold
                                      ),
                                    ),
                                  ])
                            ])),
                      ])),
              pw.Divider(thickness: 4),
              pw.Container(
                height: 190,
                width: double.maxFinite,
                child: pw.Row(
                  //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Container(
                        padding: pw.EdgeInsets.all(3),
                        //margin: pw.EdgeInsets.all(5),
                        height: 190,
                        width: 200,
                        child: pw.Center(
                            child: maxinet == null
                                ? null
                                : pw.Image(maxinet, fit: pw.BoxFit.fill))),
                    pw.VerticalDivider(thickness: 3),
                    pw.Container(
                      padding: const pw.EdgeInsets.only(left: 30, right: 70),
                      height: 200,
                      width: 400,
                      child: pw.Center(
                          child:
                              countrynet == null ? null : pw.Image(countrynet)),
                    )
                  ],
                ),
              ),
              pw.Divider(thickness: 12),
              pw.Container(
                alignment: pw.Alignment.centerLeft,
                decoration: pw.BoxDecoration(
                    border: pw.Border.symmetric(
                        horizontal: pw.BorderSide(
                  width: 4,
                ))),
                child: pw.Row(
                    mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                    children: [
                      pw.Column(
                        crossAxisAlignment: pw.CrossAxisAlignment.start,
                        children: [
                          pw.Text('UPS GROUND',
                              style: pw.TextStyle(
                                  font: ArialB,
                                  height: 1.5,
                                  fontWeight: pw.FontWeight.bold,
                                  fontBold: ArialB,
                                  fontSize: 43)),
                          pw.SizedBox(height: 5),
                          pw.Text('TRACKING #:${widget.tracking}',
                              //${widget.tracking}'
                              style: pw.TextStyle(
                                font: halv,
                                fontBold: calibriBold,
                                //fontWeight: pw.FontWeight.bold,
                                fontSize: 25,
                              )),
                        ],
                      ),
                      pw.Container(
                          height: 100,
                          width: 120,
                          decoration: pw.BoxDecoration(color: PdfColors.black))
                    ]),
              ),
              pw.Container(
                  padding: pw.EdgeInsets.only(
                    left: 50,
                    right: 160,
                  ),
                  margin: pw.EdgeInsets.only(top: 12, bottom: 12),
                  alignment: pw.Alignment.topCenter,
                  height: 180,
                  //width: 450,
                  child: bar),
              pw.Divider(thickness: 6, height: 0),
              pw.Container(
                height: 190,
                width: double.infinity,
                //decoration: pw.BoxDecoration(border: pw.Border.all()),
                alignment: pw.Alignment.centerLeft,
                child: pw.Row(
                  mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                  children: [
                    pw.Column(
                      //mainAxisAlignment: pw.MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: pw.CrossAxisAlignment.start,

                      children: [
                        pw.SizedBox(height: 6),
                        pw.Text(
                          'BILLING: ${widget.billing}',
                          style: pw.TextStyle(
                              font: ttf,
                              fontSize: 25,
                              fontBold: ttfbold,
                              fontWeight: pw.FontWeight.bold),
                        ),
                        pw.Text('DESC: ${widget.desc}',
                            style: pw.TextStyle(
                                font: ttf,
                                fontBold: ttfbold,
                                fontSize: 25,
                                fontWeight: pw.FontWeight.bold)),
                        pw.SizedBox(
                          height: 85,
                        ),
                        pw.Text(widget.refno1,
                            style: pw.TextStyle(
                                font: ttf,
                                fontBold: ttfbold,
                                fontSize: 24,
                                fontWeight: pw.FontWeight.bold)),
                        pw.Text(widget.refno2,
                            style: pw.TextStyle(
                                font: ttf,
                                fontBold: ttfbold,
                                fontSize: 24,
                                fontWeight: pw.FontWeight.bold)),
                      ],
                    ),
                    pw.Align(
                        alignment: pw.Alignment.bottomRight,
                        child: pw.Container(
                            height: 70,
                            width: 100,
                            child: assetsimage != null
                                ? pw.Image(imageass, fit: pw.BoxFit.cover)
                                : null))
                  ],
                ),
              ),
              pw.Container(
                  width: double.infinity,
                  child: pw.Align(
                      alignment: pw.Alignment.center,
                      child: pw.Text('${widget.lastD1}       ${widget.lastD2}',
                          style: pw.TextStyle(
                              fontBold: ttfbold,
                              fontSize: 14,
                              fontWeight: pw.FontWeight.bold))))
            ],
          ),
        ));
      },
    ));
    final bytes = await pdf.save();
    saveandLaunchFile(bytes, '${widget.tracking2}.pdf');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "USER DETAILS",
          style: TextStyle(color: Colors.black, fontSize: 20),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10),
          margin: const EdgeInsets.all(10),
          width: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              userinfo(
                name: widget.name,
                weight: widget.w,
                s1: widget.s1,
                s2: widget.s2,
                a1: widget.a1,
                a2: widget.a2,
                a3: widget.a3,
                a4: widget.a4,
                tracking: widget.tracking,
                billing: widget.billing,
                desc: widget.desc,
                refno1: widget.refno1,
                refno2: widget.refno2,
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                children: [
                  const Text(
                    'Maxi',
                    style: TextStyle(fontSize: 20),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                          height: 140,
                          width: 150,
                          decoration: BoxDecoration(
                              border: Border.all(),
                              borderRadius: BorderRadius.circular(12)),
                          child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.network(widget.maxi))),
                    ],
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Column(
                    children: [
                      const SizedBox(
                        height: 10,
                      ),
                      const Text(
                        'Country',
                        style: TextStyle(fontSize: 20),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Container(
                            height: 140,
                            width: 150,
                            decoration: BoxDecoration(
                                border: Border.all(),
                                borderRadius: BorderRadius.circular(12)),
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(12),
                                child: Image.network(
                                  widget.country,
                                )),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 78, 76, 76),
        onPressed: _createPdf,
        child: const Icon(Icons.picture_as_pdf),
      ),
    );
  }
}
