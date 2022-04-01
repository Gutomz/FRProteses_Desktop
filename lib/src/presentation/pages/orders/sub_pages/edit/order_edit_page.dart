import 'package:extended_masked_text/extended_masked_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/injection_container.dart';
import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/presentation/helpers/printing.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/edit/order_edit_large_screen_page.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/edit/store/order_edit_page_store.dart';
import 'package:frproteses/src/presentation/stores/navigation_store.dart';
import 'package:mobx/mobx.dart';

class OrderEditPageArguments {
  final OrderEntity orderEntity;
  final bool isNew;

  OrderEditPageArguments({required this.orderEntity, this.isNew = false});
}

class OrderEditPage extends StatelessWidget {
  final OrderEditPageStore _store;
  final NavigationStore _navigationStore = sl();

  final OrderEditPageArguments arguments;

  final TextEditingController customerFieldController;
  final TextEditingController orderDateFieldController;
  final TextEditingController patientNameFieldController;
  final TextEditingController modelTypeFieldController;
  final TextEditingController scaleFieldController;
  final TextEditingController colorFieldController;
  final TextEditingController selectedProductFieldController;
  final TextEditingController selectedQuantityFieldController;
  final MoneyMaskedTextController selectedProductPriceFieldController;
  final MoneyMaskedTextController totalPriceFieldController;
  final TextEditingController notesFieldController;

  OrderEditPage({
    Key? key,
    required this.arguments,
  })  : _store = OrderEditPageStore(
          arguments.orderEntity,
          orderStore: sl(),
          customerStore: sl(),
          productStore: sl(),
        ),
        customerFieldController = TextEditingController(
            text: arguments.orderEntity.customerEntity.fullName),
        orderDateFieldController = TextEditingController(
            text: arguments.orderEntity.orderDate.toDateTime()?.formatDate() ??
                DateTime.now().formatDate()),
        patientNameFieldController =
            TextEditingController(text: arguments.orderEntity.patientName),
        modelTypeFieldController =
            TextEditingController(text: arguments.orderEntity.modelType?.title),
        scaleFieldController =
            TextEditingController(text: arguments.orderEntity.scale),
        colorFieldController =
            TextEditingController(text: arguments.orderEntity.color),
        selectedProductFieldController = TextEditingController(),
        selectedQuantityFieldController = TextEditingController(text: '1'),
        selectedProductPriceFieldController =
            MoneyMaskedTextController(leftSymbol: "R\$ "),
        totalPriceFieldController =
            MoneyMaskedTextController(leftSymbol: "R\$ "),
        notesFieldController =
            TextEditingController(text: arguments.orderEntity.notes),
        super(key: key) {
    reaction((_) => _store.selectedProduct, (_) {
      selectedProductFieldController.text = _store.selectedProduct?.name ?? "";

      if (_store.products.isEmpty) {
        selectedProductFieldController.text = "Nenhum produto disponível";
      }
    });

    reaction(
        (_) => _store.selectedQuantity,
        (_) => selectedQuantityFieldController.text =
            _store.selectedQuantity.toString());

    reaction(
        (_) => _store.selectedProductUnitPrice,
        (_) => selectedProductPriceFieldController
            .updateValue(_store.selectedProductUnitPrice ?? 0));

    reaction(
        (_) => _store.selectedProductTotalPrice,
        (_) => totalPriceFieldController
            .updateValue(_store.selectedProductTotalPrice ?? 0));
  }

  Future<void> saveForm(BuildContext context) async {
    final entity = await _store.saveForm();

    if (entity == null) {
      // ! TODO - Show error Message (customerStore.errorMessage)
      return;
    }

    _navigationStore.goBack();
  }

  Future<void> closeOrder(BuildContext context) async {
    if (await _store.closeOrder() == true) {
      final model = _store.convertFormData();
      await showOrderPrintPreview(context, model);
      // TODO - ask to print customer extract
      // TODO - case true - print customer extract and report bank account
    }
  }

  Future<void> printOrder(BuildContext context) async {
    if (_store.isFormValid) {
      final model = _store.convertFormData();
      await showOrderPrintPreview(context, model);
    }
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveWidget(
      largeScreenWidget: Observer(builder: (_) {
        return OrderEditLargeScreenPage(
          id: _store.id.toString(),
          isNew: arguments.isNew,
          closed: _store.statusType.isEqual(OrderStatusType.closed),
          onPressedSaveButton: () => saveForm(context),
          onPressedCloseButton: () => closeOrder(context),
          onPressedPrintButton: () => printOrder(context),
          store: _store,
          customerFieldController: customerFieldController,
          orderDateFieldController: orderDateFieldController,
          patientNameFieldController: patientNameFieldController,
          modelTypeFieldController: modelTypeFieldController,
          scaleFieldController: scaleFieldController,
          colorFieldController: colorFieldController,
          selectedProductFieldController: selectedProductFieldController,
          selectedQuantityFieldController: selectedQuantityFieldController,
          selectedProductPriceFieldController:
              selectedProductPriceFieldController,
          totalPriceFieldController: totalPriceFieldController,
          notesFieldController: notesFieldController,
        );
      }),
    );
  }
}
