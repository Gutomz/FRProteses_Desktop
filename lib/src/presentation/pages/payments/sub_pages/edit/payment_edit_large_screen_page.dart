import 'package:flutter/material.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/widgets/area_text_field.dart';
import 'package:frproteses/src/presentation/widgets/date_picker_text_field.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class PaymentEditLargeScreenPage extends StatelessWidget {
  final bool readOnly;
  final List<CustomerEntity> customers;
  final String id;
  final Function()? onPressedSaveButton;
  final TextEditingController customerFieldController;
  final Function(CustomerEntity?)? onChangedCustomerField;
  final String? customerFieldErrorText;
  final TextEditingController dateFieldController;
  final Function(String)? onChangedDateField;
  final String? dateFieldErrorText;
  final TextEditingController paidValueFieldController;
  final Function(String)? onChangedPaidValueField;
  final String? paidValueFieldErrorText;
  final TextEditingController methodFieldController;
  final Function(PaymentMethodType?)? onChangedMethodField;
  final String? methodFieldErrorText;
  final TextEditingController checkNumFieldController;
  final Function(String)? onChangedCheckNumField;
  final String? checkNumFieldErrorText;
  final bool isCheckNumFieldEnabled;
  final TextEditingController goodForDateFieldController;
  final Function(String)? onChangedGoodForDateField;
  final String? goodForDateFieldErrorText;
  final bool isGoodForDateFieldEnabled;
  final TextEditingController notesFieldController;
  final Function(String)? onChangedNotesField;
  final String? notesFieldErrorText;

  PaymentEditLargeScreenPage({
    Key? key,
    required this.id,
    required this.customers,
    this.onPressedSaveButton,
    this.readOnly = false,
    required this.customerFieldController,
    required this.onChangedCustomerField,
    required this.customerFieldErrorText,
    required this.dateFieldController,
    required this.onChangedDateField,
    required this.dateFieldErrorText,
    required this.paidValueFieldController,
    required this.onChangedPaidValueField,
    required this.paidValueFieldErrorText,
    required this.methodFieldController,
    required this.onChangedMethodField,
    required this.methodFieldErrorText,
    required this.checkNumFieldController,
    required this.onChangedCheckNumField,
    required this.checkNumFieldErrorText,
    required this.isCheckNumFieldEnabled,
    required this.goodForDateFieldController,
    required this.onChangedGoodForDateField,
    required this.goodForDateFieldErrorText,
    required this.isGoodForDateFieldEnabled,
    required this.notesFieldController,
    required this.onChangedNotesField,
    required this.notesFieldErrorText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWidget(
      id: id,
      saveButtonLabel: "Salvar",
      onPressedSaveButton: onPressedSaveButton,
      children: [
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: DropDownTextField<CustomerEntity>(
                label: "Cliente",
                controller: customerFieldController,
                data: customers,
                buildMenuItemText: (e) => e.fullName,
                errorText: customerFieldErrorText,
                onChanged: onChangedCustomerField,
                enabled: !readOnly,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DatePickerTextField(
                label: "Data do Pagamento",
                controller: dateFieldController,
                onChanged: onChangedDateField,
                errorText: dateFieldErrorText,
                firstDate: DateTime(2000),
                lastDate: DateTime.now(),
                enabled: !readOnly,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: DropDownTextField<PaymentMethodType>(
                label: "Método de Pagamento",
                controller: methodFieldController,
                data: PaymentMethodType.values,
                buildMenuItemText: (e) => e.title,
                onChanged: onChangedMethodField,
                errorText: methodFieldErrorText,
                enabled: !readOnly,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: UnderlinedTextField(
                label: "Valor Pago",
                controller: paidValueFieldController,
                onChanged: onChangedPaidValueField,
                errorText: paidValueFieldErrorText,
                enabled: !readOnly,
              ),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: UnderlinedTextField(
                label: "Número do Cheque",
                controller: checkNumFieldController,
                onChanged: onChangedCheckNumField,
                errorText: checkNumFieldErrorText,
                enabled: isCheckNumFieldEnabled && !readOnly,
              ),
            ),
            SizedBox(width: 15),
            Flexible(
              child: DatePickerTextField(
                label: "Bom Para",
                controller: goodForDateFieldController,
                onChanged: onChangedGoodForDateField,
                errorText: goodForDateFieldErrorText,
                firstDate: DateTime(2000),
                lastDate: DateTime.now().add(Duration(days: 60)),
                enabled: isGoodForDateFieldEnabled && !readOnly,
              ),
            ),
          ],
        ),
        AreaTextField(
          label: "Observações",
          controller: notesFieldController,
          onChanged: onChangedNotesField,
          errorText: notesFieldErrorText,
        ),
      ],
    );
  }
}
