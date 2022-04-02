import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/src/core/enums/dental_arch_type.dart';
import 'package:frproteses/src/core/enums/order_model_type.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/domain/entities/order_item_entity.dart';
import 'package:frproteses/src/domain/entities/product_entity.dart';
import 'package:frproteses/src/presentation/config/constants.dart';
import 'package:frproteses/src/presentation/pages/orders/sub_pages/edit/store/order_edit_page_store.dart';
import 'package:frproteses/src/presentation/widgets/area_text_field.dart';
import 'package:frproteses/src/presentation/widgets/date_picker_text_field.dart';
import 'package:frproteses/src/presentation/widgets/drop_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/form_widget.dart';
import 'package:frproteses/src/presentation/widgets/numeric_up_down_text_field.dart';
import 'package:frproteses/src/presentation/widgets/single_child_scroll_view_with_scrollbar.dart';
import 'package:frproteses/src/presentation/widgets/teeth_widget.dart';
import 'package:frproteses/src/presentation/widgets/underlined_text_field.dart';

class OrderEditLargeScreenPage extends StatelessWidget {
  final OrderEditPageStore store;

  final String id;
  final bool closed;
  final bool isNew;
  final Function()? onPressedSaveButton;
  final Function()? onPressedCloseButton;
  final Function()? onPressedPrintButton;

  final TextEditingController customerFieldController;
  final TextEditingController orderDateFieldController;
  final TextEditingController patientNameFieldController;
  final TextEditingController modelTypeFieldController;
  final TextEditingController scaleFieldController;
  final TextEditingController colorFieldController;
  final TextEditingController selectedProductFieldController;
  final TextEditingController selectedQuantityFieldController;
  final TextEditingController selectedProductPriceFieldController;
  final TextEditingController totalPriceFieldController;
  final TextEditingController notesFieldController;

  final ScrollController dentalArchScrollController = ScrollController();
  final ScrollController itemsTableHorizontalScrollController =
      ScrollController();
  final ScrollController itemsTableVerticalScrollController =
      ScrollController();

  OrderEditLargeScreenPage({
    Key? key,
    required this.id,
    this.closed = false,
    this.isNew = false,
    this.onPressedSaveButton,
    this.onPressedCloseButton,
    this.onPressedPrintButton,
    required this.store,
    required this.customerFieldController,
    required this.orderDateFieldController,
    required this.patientNameFieldController,
    required this.modelTypeFieldController,
    required this.scaleFieldController,
    required this.colorFieldController,
    required this.selectedProductFieldController,
    required this.selectedQuantityFieldController,
    required this.selectedProductPriceFieldController,
    required this.totalPriceFieldController,
    required this.notesFieldController,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FormWidget(
      id: id,
      status: closed
          ? "${store.statusType.title} em ${store.deliveryDate}"
          : store.statusType.title,
      saveButtonLabel: "Salvar",
      onPressedSaveButton: onPressedSaveButton,
      actions: [
        Observer(builder: (_) {
          return Text(
            "Total: ${store.orderTotalPrice.formatMoney()}",
            style: Theme.of(context).textTheme.titleSmall,
          );
        }),
        Observer(builder: (_) {
          if (store.statusType.isEqual(OrderStatusType.open) && !isNew) {
            return Row(
              children: [
                SizedBox(width: kFormHorizontalSpacing),
                OutlinedButton(
                  onPressed: onPressedCloseButton,
                  child: Text("Fechar Pedido"),
                ),
              ],
            );
          }

          if (store.statusType.isEqual(OrderStatusType.closed)) {
            return Row(
              children: [
                SizedBox(width: kFormHorizontalSpacing),
                OutlinedButton(
                  onPressed: onPressedPrintButton,
                  child: Text("Imprimir"),
                ),
              ],
            );
          }

          return Container();
        }),
      ],
      children: [
        Flexible(
          flex: 3,
          child: Row(
            children: [
              Expanded(
                child: Column(
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
                              enabled: !closed,
                            );
                          }),
                        ),
                        SizedBox(width: kFormHorizontalSpacing),
                        Flexible(
                          child: Observer(builder: (_) {
                            return DatePickerTextField(
                              label: "Data do Pedido",
                              controller: orderDateFieldController,
                              onChanged: store.setOrderDate,
                              errorText: store.orderDateFieldErrorMessage,
                              firstDate: DateTime(2000),
                              lastDate: DateTime.now(),
                              enabled: !closed,
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: kFormLineSpacing),
                    Observer(builder: (_) {
                      return UnderlinedTextField(
                        label: "Paciente",
                        controller: patientNameFieldController,
                        onChanged: store.setPatientName,
                        errorText: store.patientNameFieldErrorMessage,
                        enabled: !closed,
                      );
                    }),
                    SizedBox(height: kFormLineSpacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Observer(builder: (_) {
                            return DropDownTextField<OrderModelType>(
                              label: "Modelo",
                              controller: modelTypeFieldController,
                              data: OrderModelType.values,
                              buildMenuItemText: (e) => e.title,
                              errorText: store.modelTypeFieldErrorMessage,
                              onChanged: store.setModelType,
                              enabled: !closed,
                            );
                          }),
                        ),
                        SizedBox(width: kFormHorizontalSpacing),
                        Flexible(
                          child: Observer(builder: (_) {
                            return UnderlinedTextField(
                              label: "Escala",
                              controller: scaleFieldController,
                              onChanged: store.setScale,
                              errorText: store.scaleFieldErrorMessage,
                              enabled: !closed,
                            );
                          }),
                        ),
                        SizedBox(width: kFormHorizontalSpacing),
                        Flexible(
                          child: Observer(builder: (_) {
                            return UnderlinedTextField(
                              label: "Cor",
                              controller: colorFieldController,
                              onChanged: store.setColor,
                              errorText: store.colorFieldErrorMessage,
                              enabled: !closed,
                            );
                          }),
                        ),
                      ],
                    ),
                    SizedBox(height: kFormLineSpacing),
                    SingleChildScrollViewWithScrollbar(
                      controller: dentalArchScrollController,
                      thumbVisibility: true,
                      trackVisibility: true,
                      padding: EdgeInsets.only(bottom: 15),
                      scrollDirection: Axis.horizontal,
                      child: _buildDentalArch(),
                    ),
                  ],
                ),
              ),
              VerticalDivider(),
              Expanded(
                child: Column(
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 2,
                          child: Observer(builder: (_) {
                            return DropDownTextField<ProductEntity>(
                              label: "Produtos",
                              controller: selectedProductFieldController,
                              data: store.products,
                              buildMenuItemText: (e) => e.name,
                              errorText: store.itemsFieldErrorMessage,
                              onChanged: store.setSelectedProduct,
                              enabled: store.products.isNotEmpty && !closed,
                            );
                          }),
                        ),
                        SizedBox(width: kFormHorizontalSpacing),
                        Flexible(
                          child: UnderlinedTextField(
                            label: "Preço Unitário",
                            controller: selectedProductPriceFieldController,
                            enabled: false,
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: kFormLineSpacing),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          child: Observer(builder: (_) {
                            return NumericUpDownTextField(
                              label: "Quantidade",
                              controller: selectedQuantityFieldController,
                              onChanged: store.setSelectedQuantity,
                              min: 1,
                              max: 9999,
                              enabled: store.products.isNotEmpty && !closed,
                            );
                          }),
                        ),
                        SizedBox(width: kFormHorizontalSpacing),
                        Flexible(
                          child: UnderlinedTextField(
                            label: "Preço Total",
                            controller: totalPriceFieldController,
                            enabled: false,
                          ),
                        ),
                        SizedBox(width: kFormHorizontalSpacing),
                        Expanded(
                          child: Observer(builder: (_) {
                            return OutlinedButton(
                              onPressed:
                                  store.selectedProduct != null && !closed
                                      ? store.addSelectedProduct
                                      : null,
                              child: Text("Adicionar Produto"),
                            );
                          }),
                        ),
                      ],
                    ),
                    _buildItemsTable(),
                  ],
                ),
              ),
            ],
          ),
        ),
        SizedBox(height: kFormLineSpacing),
        Flexible(child: Observer(builder: (_) {
          return AreaTextField(
            label: "Observações",
            controller: notesFieldController,
            onChanged: store.setNotes,
            errorText: store.notesFieldErrorMessage,
          );
        })),
      ],
    );
  }

  Widget _buildItemsTable() {
    return Row(
      children: [
        Flexible(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Observer(builder: (_) {
                return SizedBox(
                  height: 210,
                  child: SingleChildScrollViewWithScrollbar(
                    controller: itemsTableHorizontalScrollController,
                    thumbVisibility: store.items.isNotEmpty,
                    trackVisibility: store.items.isNotEmpty,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.only(bottom: 10),
                    child: SingleChildScrollViewWithScrollbar(
                      controller: itemsTableVerticalScrollController,
                      thumbVisibility: store.items.isNotEmpty,
                      trackVisibility: store.items.isNotEmpty,
                      padding: EdgeInsets.only(right: 10),
                      child: Column(
                        children: [
                          Observer(builder: (_) {
                            return DataTable(
                              columns: _getColumns(),
                              rows: _getRows(context),
                            );
                          }),
                          Observer(builder: (_) {
                            if (store.items.isEmpty) {
                              return Center(
                                  child: Text("Nenhum item adicionado"));
                            }

                            return Container();
                          }),
                        ],
                      ),
                    ),
                  ),
                );
              });
            },
          ),
        ),
      ],
    );
  }

  List<DataColumn> _getColumns() {
    return [
      if (!closed) DataColumn(label: Text("")),
      DataColumn(label: Text("ID")),
      DataColumn(label: Text("Nome")),
      DataColumn(label: Text("Quantidade")),
      DataColumn(label: Text("Valor Unitário")),
      DataColumn(label: Text("Valor Total")),
    ];
  }

  List<DataRow> _getRows(BuildContext context) {
    return store.items
        .map((e) => DataRow(cells: _getCells(context, e)))
        .toList();
  }

  List<DataCell> _getCells(BuildContext context, OrderItemEntity e) {
    return [
      if (!closed)
        DataCell(
          IconButton(
            onPressed: () => store.removeItem(e.id),
            icon: Icon(Icons.delete_outline),
            iconSize: 16,
            splashRadius: 16,
            color: Theme.of(context).errorColor,
          ),
        ),
      DataCell(Text(e.id.toString())),
      DataCell(Text(e.productEntity.name)),
      DataCell(Text(e.quantity.toString())),
      DataCell(Text(e.unitPrice.formatMoney())),
      DataCell(Text(e.totalPrice.formatMoney())),
    ];
  }

  Column _buildDentalArch() {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTeethWidget(type: DentalArchType.tl18),
            _buildTeethWidget(type: DentalArchType.tl17),
            _buildTeethWidget(type: DentalArchType.tl16),
            _buildTeethWidget(type: DentalArchType.tl15),
            _buildTeethWidget(type: DentalArchType.tl14),
            _buildTeethWidget(type: DentalArchType.tl13),
            _buildTeethWidget(type: DentalArchType.tl12),
            _buildTeethWidget(type: DentalArchType.tl11),
            SizedBox(width: 5),
            _buildTeethWidget(type: DentalArchType.tr21),
            _buildTeethWidget(type: DentalArchType.tr22),
            _buildTeethWidget(type: DentalArchType.tr23),
            _buildTeethWidget(type: DentalArchType.tr24),
            _buildTeethWidget(type: DentalArchType.tr25),
            _buildTeethWidget(type: DentalArchType.tr26),
            _buildTeethWidget(type: DentalArchType.tr27),
            _buildTeethWidget(type: DentalArchType.tr28),
          ],
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _buildTeethWidget(type: DentalArchType.bl48, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl47, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl46, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl45, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl44, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl43, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl42, isBottom: true),
            _buildTeethWidget(type: DentalArchType.bl41, isBottom: true),
            SizedBox(width: 5),
            _buildTeethWidget(type: DentalArchType.br31, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br32, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br33, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br34, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br35, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br36, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br37, isBottom: true),
            _buildTeethWidget(type: DentalArchType.br38, isBottom: true),
          ],
        ),
      ],
    );
  }

  Widget _buildTeethWidget({
    required DentalArchType type,
    bool isBottom = false,
  }) {
    return TeethWidget(
      title: type.title,
      value: store.dentalArchEntity.arch[type],
      onChanged: (v) => store.setTeeth(type, value: v ?? false),
      isBottom: isBottom,
      enabled: !closed,
    );
  }
}
