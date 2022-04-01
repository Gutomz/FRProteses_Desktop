import 'dart:async';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';

pw.TableRow _buildTableRow({
  required List<String> columns,
  bool repeat = false,
  pw.BoxDecoration? boxDecoration,
  pw.TableCellVerticalAlignment? verticalAlignment,
  bool isTitle = false,
}) {
  return pw.TableRow(
    repeat: repeat,
    decoration: boxDecoration,
    verticalAlignment: verticalAlignment,
    children: columns
        .map((e) => pw.Padding(
              padding: pw.EdgeInsets.symmetric(horizontal: 5, vertical: 5),
              child: pw.Text(
                e.isEmpty ? "-" : e,
                style: isTitle
                    ? pw.TextStyle(
                        fontWeight: pw.FontWeight.bold,
                      )
                    : null,
              ),
            ))
        .toList(),
  );
}

pw.RichText _buildTitleValue({
  required String title,
  required String value,
  pw.TextStyle? titleStyle,
  pw.TextStyle? valueStyle,
}) {
  return pw.RichText(
    text: pw.TextSpan(
      text: "$title: ",
      style: titleStyle,
      children: [
        pw.TextSpan(
          text: value.isEmpty ? "-" : value,
          style: valueStyle ??
              pw.TextStyle(
                fontWeight: pw.FontWeight.bold,
              ),
        )
      ],
    ),
  );
}

Future<void> requestPrint(
  BuildContext context,
  FutureOr<Uint8List> Function(PdfPageFormat) getBinary,
  PdfPageFormat format,
) async {
  try {
    final success = await Printing.layoutPdf(
      onLayout: getBinary,
    );

    if (success) {
      // ignore: use_build_context_synchronously
      Navigator.of(context).pop();
    }
  } catch (e) {/* do nothing */}
}

Future<void> showPrintPreview(BuildContext context, pw.Document doc) async {
  await showDialog(
    context: context,
    builder: (context) => LayoutBuilder(builder: (context, constraints) {
      final paddingHorizontal = constraints.maxWidth / 4;
      final paddingVertical = constraints.maxHeight / 6;

      return Stack(
        children: [
          Padding(
            padding: EdgeInsets.symmetric(
              horizontal: paddingHorizontal,
              vertical: paddingVertical,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.all(Radius.circular(5)),
              child: PdfPreview(
                allowPrinting: false,
                allowSharing: false,
                canChangeOrientation: false,
                canChangePageFormat: false,
                canDebug: false,
                build: (format) => doc.save(),
                actions: [
                  PdfPreviewAction(
                    icon: Tooltip(
                      message: "Imprimir",
                      child: Icon(
                        Icons.print_outlined,
                        color: Theme.of(context).colorScheme.outline,
                      ),
                    ),
                    onPressed: requestPrint,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            right: paddingHorizontal - 30,
            top: paddingVertical - 30,
            child: Material(
              color: Colors.transparent,
              child: Padding(
                padding: const EdgeInsets.all(15),
                child: CircleAvatar(
                  child: IconButton(
                    onPressed: Navigator.of(context).pop,
                    icon: Icon(Icons.close_outlined),
                  ),
                ),
              ),
            ),
          ),
        ],
      );
    }),
  );
}

Future<void> showOrderPrintPreview(
    BuildContext context, OrderEntity orderEntity) {
  return showPrintPreview(context, getOrderDocument(orderEntity));
}

pw.Document getOrderDocument(OrderEntity orderEntity) {
  final doc = pw.Document(title: "Pedido-${orderEntity.id}");

  doc.addPage(pw.Page(
    build: (pw.Context context) => pw.Column(
      crossAxisAlignment: pw.CrossAxisAlignment.start,
      children: [
        pw.Text(
          "Pedido ${orderEntity.id}",
          style: pw.TextStyle(fontSize: 18, fontWeight: pw.FontWeight.bold),
        ),
        pw.Divider(),
        _buildTitleValue(
          title: "Cliente",
          value: orderEntity.customerEntity.fullName,
        ),
        _buildTitleValue(
          title: "Paciente",
          value: orderEntity.patientName,
        ),
        _buildTitleValue(
          title: "Data do Pedido",
          value: orderEntity.orderDate,
        ),
        _buildTitleValue(
          title: "Data da Entrega",
          value: orderEntity.deliveryDate,
        ),
        pw.Divider(),
        pw.Table(
          border: pw.TableBorder.symmetric(inside: pw.BorderSide()),
          children: [
            _buildTableRow(
              columns: ["Descrição", "Qtd.", "Unidade", "Total"],
              repeat: true,
              isTitle: true,
            ),
            ...orderEntity.itemsEntity
                .map((e) => _buildTableRow(
                      columns: [
                        e.productEntity.name,
                        e.quantity.toString(),
                        e.unitPrice.formatMoney(),
                        e.totalPrice.formatMoney(),
                      ],
                    ))
                .toList(),
          ],
        ),
        pw.Divider(),
        pw.Row(
          mainAxisAlignment: pw.MainAxisAlignment.end,
          children: [
            _buildTitleValue(
              title: "Total",
              value: orderEntity.totalPrice.formatMoney(),
              titleStyle: pw.TextStyle(fontSize: 12),
              valueStyle:
                  pw.TextStyle(fontSize: 14, fontWeight: pw.FontWeight.bold),
            )
          ],
        ),
      ],
    ),
  ));

  return doc;
}
