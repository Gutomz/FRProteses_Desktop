import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/payments/store/payment_filter_store.dart';
import 'package:frproteses/src/presentation/widgets/date_range_picker_text_field.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class PaymentFilterSelectionLargeScreenPage extends StatelessWidget {
  final PaymentFilterStore store;
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final TextEditingController customerFieldController;
  final TextEditingController dateRangeFieldController;
  final TextEditingController paymentMethodFieldController;
  final MoneyMaskedTextController paidValueFieldController;

  PaymentFilterSelectionLargeScreenPage({
    Key? key,
    required this.store,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.customerFieldController,
    required this.dateRangeFieldController,
    required this.paymentMethodFieldController,
    required this.paidValueFieldController,
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
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: UnderlinedTextField(
                label: "Valor Pago",
                controller: paidValueFieldController,
                onChanged: (_) => store.setPaidValue(
                    paidValueFieldController.numberValue.toString()),
              ),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: DateRangePickerTextField(
                label: "Período",
                controller: dateRangeFieldController,
                onChanged: store.setDateRange,
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
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: DropDownTextField<PaymentMethodType?>(
                label: "Método de Pagamento",
                controller: paymentMethodFieldController,
                data: [null, ...PaymentMethodType.values],
                buildMenuItemText: (e) => e?.title ?? "Todos",
                onChanged: store.setPaymentMethod,
              ),
            ),
          ],
        ),
        Spacer(),
      ],
    );
  }
}
