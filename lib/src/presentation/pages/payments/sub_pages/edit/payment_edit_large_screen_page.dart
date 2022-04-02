import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/edit/store/payment_edit_page_store.dart';
import 'package:frproteses/src/presentation/widgets/area_text_field.dart';
import 'package:frproteses/src/presentation/widgets/date_picker_text_field.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class PaymentEditLargeScreenPage extends StatelessWidget {
  final PaymentEditPageStore store;
  final bool readOnly;
  final List<CustomerEntity> customers;
  final String id;
  final Function()? onPressedSaveButton;
  final TextEditingController customerFieldController;
  final TextEditingController dateFieldController;
  final MoneyMaskedTextController paidValueFieldController;
  final TextEditingController methodFieldController;
  final TextEditingController checkNumFieldController;
  final TextEditingController goodForDateFieldController;
  final TextEditingController notesFieldController;

  PaymentEditLargeScreenPage({
    Key? key,
    required this.store,
    required this.id,
    required this.customers,
    this.onPressedSaveButton,
    this.readOnly = false,
    required this.customerFieldController,
    required this.dateFieldController,
    required this.paidValueFieldController,
    required this.methodFieldController,
    required this.checkNumFieldController,
    required this.goodForDateFieldController,
    required this.notesFieldController,
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
              child: Observer(builder: (_) {
                return DropDownTextField<CustomerEntity>(
                  label: "Cliente",
                  controller: customerFieldController,
                  data: store.customers,
                  buildMenuItemText: (e) => e.fullName,
                  errorText: store.customerFieldErrorMessage,
                  onChanged: store.setCustomer,
                  enabled: !readOnly,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return DatePickerTextField(
                  label: "Data do Pagamento",
                  controller: dateFieldController,
                  onChanged: store.setDate,
                  errorText: store.dateFieldErrorMessage,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now(),
                  enabled: !readOnly,
                );
              }),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Observer(builder: (_) {
                return DropDownTextField<PaymentMethodType>(
                  label: "Método de Pagamento",
                  controller: methodFieldController,
                  data: PaymentMethodType.values,
                  buildMenuItemText: (e) => e.title,
                  onChanged: store.setMethod,
                  errorText: store.methodFieldErrorMessage,
                  enabled: !readOnly,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Valor Pago",
                  controller: paidValueFieldController,
                  onChanged: (_) => store.setPaidValue(
                      paidValueFieldController.numberValue.toString()),
                  errorText: store.paidValueFieldErrorMessage,
                  enabled: !readOnly,
                );
              }),
            ),
          ],
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Flexible(
              flex: 2,
              child: Observer(builder: (_) {
                return UnderlinedTextField(
                  label: "Número do Cheque",
                  controller: checkNumFieldController,
                  onChanged: store.setCheckNum,
                  errorText: store.checkNumFieldErrorMessage,
                  enabled: store.isCheckNumFieldEnabled && !readOnly,
                );
              }),
            ),
            SizedBox(width: kFormHorizontalSpacing),
            Flexible(
              child: Observer(builder: (_) {
                return DatePickerTextField(
                  label: "Bom Para",
                  controller: goodForDateFieldController,
                  onChanged: store.setGoodForDate,
                  errorText: store.goodForDateFieldErrorMessage,
                  firstDate: DateTime(2000),
                  lastDate: DateTime.now().add(Duration(days: 60)),
                  enabled: store.isGoodForDateFieldEnabled && !readOnly,
                );
              }),
            ),
          ],
        ),
        Observer(builder: (_) {
          return AreaTextField(
            label: "Observações",
            controller: notesFieldController,
            onChanged: store.setNotes,
            errorText: store.notesFieldErrorMessage,
          );
        }),
      ],
    );
  }
}
