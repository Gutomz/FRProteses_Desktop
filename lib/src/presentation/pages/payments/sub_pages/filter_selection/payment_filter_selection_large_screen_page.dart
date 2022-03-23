import 'package:flutter/material.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/widgets/date_range_picker_text_field.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/filter_form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class PaymentFilterSelectionLargeScreenPage extends StatelessWidget {
  final Function()? onPressedSaveButton;
  final TextEditingController idFieldController;
  final Function(String)? onChangedIdField;
  final TextEditingController customerFieldController;
  final Function(String)? onChangedCustomerField;
  final TextEditingController dateRangeFieldController;
  final Function(String)? onChangedDateRangeField;
  final TextEditingController paymentMethodFieldController;
  final Function(PaymentMethodType?)? onChangedPaymentMethodField;
  final TextEditingController paidValueFieldController;
  final Function(String)? onChangedPaidValueField;

  PaymentFilterSelectionLargeScreenPage({
    Key? key,
    this.onPressedSaveButton,
    required this.idFieldController,
    required this.onChangedIdField,
    required this.customerFieldController,
    required this.onChangedCustomerField,
    required this.dateRangeFieldController,
    required this.onChangedDateRangeField,
    required this.paymentMethodFieldController,
    required this.onChangedPaymentMethodField,
    required this.paidValueFieldController,
    required this.onChangedPaidValueField,
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
                onChanged: onChangedIdField,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Valor Pago",
                controller: paidValueFieldController,
                onChanged: onChangedPaidValueField,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DateRangePickerTextField(
                label: "Período",
                controller: dateRangeFieldController,
                onChanged: onChangedDateRangeField,
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
                onChanged: onChangedCustomerField,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DropDownTextField<PaymentMethodType?>(
                label: "Método de Pagamento",
                controller: paymentMethodFieldController,
                data: [null, ...PaymentMethodType.values],
                buildMenuItemText: (e) => e?.title ?? "Todos",
                onChanged: onChangedPaymentMethodField,
              ),
            ),
          ],
        ),
        Expanded(child: SizedBox()),
      ],
    );
  }
}
