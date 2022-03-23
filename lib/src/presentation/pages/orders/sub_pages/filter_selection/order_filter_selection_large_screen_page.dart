import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/orders/store/order_filter_store.dart';
import 'package:frproteses/src/presentation/widgets/date_range_picker_text_field.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class OrderFilterSelectionLargeScreenPage extends StatelessWidget {
  final OrderFilterStore store;
  final Function()? onPressedSaveButton;

  final TextEditingController idFieldController;
  final TextEditingController statusFieldController;
  final MoneyMaskedTextController totalPriceFieldController;
  final TextEditingController orderDateRangeFieldController;
  final TextEditingController customerFieldController;
  final TextEditingController deliveryDateRangeFieldController;

  OrderFilterSelectionLargeScreenPage({
    Key? key,
    required this.store,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.statusFieldController,
    required this.totalPriceFieldController,
    required this.orderDateRangeFieldController,
    required this.customerFieldController,
    required this.deliveryDateRangeFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FilterFormWidget(
      onPressedSaveButton: onPressedSaveButton,
      saveButtonLabel: "Aplicar Filtros",
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              child: UnderlinedTextField(
                label: "ID",
                controller: idFieldController,
                onChanged: store.setId,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DropDownTextField<OrderStatusType?>(
                label: "Status",
                controller: statusFieldController,
                data: [null, ...OrderStatusType.values],
                buildMenuItemText: (e) => e?.title ?? "Todos",
                onChanged: store.setStatus,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Preço Total",
                controller: totalPriceFieldController,
                onChanged: (_) => store.setTotalPriceValue(
                    totalPriceFieldController.numberValue.toString()),
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DateRangePickerTextField(
                label: "Data do Pedido",
                controller: orderDateRangeFieldController,
                onChanged: store.setOrderDateRange,
                firstDate: DateTime(2000),
                lastDate: DateTime(2500),
              ),
            ),
          ],
        ),
        SizedBox(height: kFormLineSpacing),
        Row(
          children: [
            Flexible(
              flex: 3,
              child: UnderlinedTextField(
                label: "Cliente",
                controller: customerFieldController,
                onChanged: store.setCustomer,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DateRangePickerTextField(
                label: "Data de Entrega",
                controller: deliveryDateRangeFieldController,
                onChanged: store.setDeliveryDateRange,
                firstDate: DateTime(2000),
                lastDate: DateTime(2500),
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
