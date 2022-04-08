import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/data_table/src/custom_data_table.dart';
import 'package:frproteses/data_table/src/custom_data_table_source.dart';
import 'package:frproteses/src/core/enums/payment_method_type.dart';
import 'package:frproteses/src/core/utils/extensions.dart';
import 'package:frproteses/src/domain/entities/payment_entity.dart';
import 'package:frproteses/src/presentation/pages/payments/store/payments_page_store.dart';
import 'package:frproteses/src/presentation/widgets/custom_data_table_widget.dart';
import 'package:frproteses/src/presentation/widgets/data_cell_simple_text.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';

class PaymentsLargeScreenPage extends StatelessWidget {
  final PaymentsPageStore store;

  final Function()? onPressedCreate;
  final Function(PaymentEntity)? onPressedEdit;
  final Function()? onPressedFilters;

  PaymentsLargeScreenPage({
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
          emptyText: "Nenhum pagamento encontrado",
          isLoading: store.isLoading,
          source: CustomDataTableSource<PaymentEntity>(
            context: context,
            data: store.data,
            onPressedRow: onPressedEdit,
            buildCell: (e) => [
              DataCell(Text("${e.id}".padLeft(4, "0"))),
              DataCell(DataCellSimpleText(text: e.customerEntity.fullName)),
              DataCell(DataCellSimpleText(text: e.value.formatMoney())),
              DataCell(DataCellSimpleText(text: e.methodEntity.type.title)),
              DataCell(Text(e.date)),
            ],
          ),
          columns: [
            CustomDataTableColumn(
              title: "ID",
              size: ColumnSize.S,
              onSort: _onSort,
            ),
            CustomDataTableColumn(title: "Cliente", onSort: _onSort),
            CustomDataTableColumn(
              title: "Valor Pago",
              size: ColumnSize.S,
              onSort: _onSort,
            ),
            CustomDataTableColumn(
              title: "Método de Pagamento",
              size: ColumnSize.M,
              onSort: _onSort,
            ),
            CustomDataTableColumn(
              title: "Data",
              size: ColumnSize.S,
              onSort: _onSort,
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
