import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/check_payment_method_entity.dart';
import 'package:frproteses/src/domain/entities/payment_method/pre_check_payment_method_entity.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/edit/payment_edit_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/payments/sub_pages/edit/store/payment_edit_page_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';

class PaymentEditPageArguments {
  final PaymentEntity paymentEntity;
  final bool isNew;

  PaymentEditPageArguments({required this.paymentEntity, this.isNew = false});
}

class PaymentEditPage extends StatelessWidget {
  final PaymentEditPageStore _store;
  final NavigationStore _navigationStore = sl();

  final PaymentEditPageArguments arguments;

  final TextEditingController customerFieldController;
  final TextEditingController dateFieldController;
  final TextEditingController methodFieldController;
  final MoneyMaskedTextController paidValueFieldController;
  final TextEditingController checkNumFieldController;
  final TextEditingController goodForDateFieldController;
  final TextEditingController notesFieldController;

  PaymentEditPage({Key? key, required this.arguments})
      : _store = PaymentEditPageStore(
          arguments.paymentEntity,
          paymentStore: sl(),
          customerStore: sl(),
        ),
        customerFieldController = TextEditingController(
          text: arguments.paymentEntity.customerEntity.fullName,
        ),
        dateFieldController = TextEditingController(
          text: arguments.paymentEntity.date.toDateTime()?.formatDate() ??
              DateTime.now().formatDate(),
        ),
        methodFieldController = TextEditingController(
            text: arguments.paymentEntity.methodEntity.type.title),
        paidValueFieldController = MoneyMaskedTextController(
          leftSymbol: "R\$ ",
          initialValue: arguments.paymentEntity.value,
        ),
        checkNumFieldController = TextEditingController(),
        goodForDateFieldController = TextEditingController(),
        notesFieldController =
            TextEditingController(text: arguments.paymentEntity.notes),
        super(key: key) {
    _setInitialValues(arguments.paymentEntity);
  }

  void _setInitialValues(PaymentEntity entity) {
    switch (entity.methodEntity.type) {
      case PaymentMethodType.check:
        final pm = entity.methodEntity as CheckPaymentMethodEntity;
        checkNumFieldController.text = pm.number;
        break;
      case PaymentMethodType.preCheck:
        final pm = entity.methodEntity as PreCheckPaymentMethodEntity;
        checkNumFieldController.text = pm.number;
        goodForDateFieldController.text = pm.goodForDate;
        break;
      default:
        break;
    }
  }

  Future<void> saveForm(BuildContext context) async {
    final entity = await _store.saveForm(isNew: arguments.isNew);

    if (entity == null) {
      // ! TODO - Show error Message (customerStore.errorMessage)
      return;
    }

    _navigationStore.goBack();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: PaymentEditLargeScreenPage(
        store: _store,
        id: _store.id.toString(),
        readOnly: !arguments.isNew,
        customers: _store.customers,
        onPressedSaveButton: () => saveForm(context),
        customerFieldController: customerFieldController,
        dateFieldController: dateFieldController,
        methodFieldController: methodFieldController,
        paidValueFieldController: paidValueFieldController,
        checkNumFieldController: checkNumFieldController,
        goodForDateFieldController: goodForDateFieldController,
        notesFieldController: notesFieldController,
      ),
    );
  }
}
