import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/data_table/src/custom_data_table.dart';
import 'package:frproteses/data_table/src/custom_data_table_source.dart';
import 'package:frproteses/src/core/enums/order_status_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/order_entity.dart';
import 'package:frproteses/src/presentation/pages/orders/store/orders_page_store.dart';
import 'package:frproteses/src/presentation/widgets/custom_data_table_widget.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';

class OrdersLargeScreenPage extends StatelessWidget {
  final OrdersPageStore store;

  final Function()? onPressedCreate;
  final Function(OrderEntity)? onPressedEdit;
  final Function()? onPressedFilters;

  OrdersLargeScreenPage({
    Key? key,
    required this.store,
    this.onPressedCreate,
    this.onPressedEdit,
    this.onPressedFilters,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.loadAll(),
      builder: (context, _) => Observer(
        builder: (context) => CustomDataTableWidget(
          sortColumnIndex: store.sortColumnIndex,
          sortAscending: store.sortAscending,
          emptyText: "Nenhum pedido encontrado",
          isLoading: store.isLoading,
          source: CustomDataTableSource<OrderEntity>(
            context: context,
            data: store.data,
            onPressedRow: onPressedEdit,
            buildCell: (e) => [
              DataCell(Text("${e.id}".padLeft(4, "0"))),
              DataCell(Text(e.statusType.title)),
              DataCell(Text(e.customerEntity.fullName)),
              DataCell(Text(e.totalPrice.formatMoney())),
              DataCell(Text(e.orderDate.toDateTime()?.formatDate() ?? "-")),
              DataCell(Text(e.deliveryDate.toDateTime()?.formatDate() ?? "-")),
            ],
          ),
          columns: [
            CustomDataTableColumn(
              title: "ID",
              size: ColumnSize.S,
              onSort: _onSort,
            ),
            CustomDataTableColumn(
              title: "Status",
              size: ColumnSize.S,
            ),
            CustomDataTableColumn(title: "Cliente", onSort: _onSort),
            CustomDataTableColumn(
              title: "Preço Total",
              size: ColumnSize.S,
            ),
            CustomDataTableColumn(
              title: "Data",
              size: ColumnSize.S,
            ),
            CustomDataTableColumn(
              title: "Data Entrega",
              size: ColumnSize.S,
            ),
          ],
          header: Observer(builder: (context) {
            return ShowFiltersWidget(
              filters: store.filterStore.filters,
              onPressedClearFilters: store.filterStore.resetFilters,
            );
          }),
          actions: [
            CustomDataTableActionButtonWidget(
              icon: Icons.filter_alt_outlined,
              onPressed: onPressedFilters,
              tooltip: "Filtros",
            ),
            CustomDataTableActionButtonWidget(
              icon: Icons.add,
              onPressed: onPressedCreate,
              tooltip: "Adicionar Novo",
            ),
          ],
        ),
      ),
    );
  }

  void _onSort(int index, bool isAscending) {
    store.setSortColumnIndex(index, isAscending: isAscending);
  }
}
