import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/data_table/src/custom_data_table.dart';
import 'package:frproteses/data_table/src/custom_data_table_source.dart';
import 'package:frproteses/src/domain/entities/provider_entity.dart';
import 'package:frproteses/src/presentation/pages/providers/store/providers_page_store.dart';
import 'package:frproteses/src/presentation/widgets/custom_data_table_widget.dart';
import 'package:frproteses/src/presentation/widgets/data_cell_simple_text.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';

class ProvidersLargeScreenPage extends StatelessWidget {
  final ProvidersPageStore store;

  final Function()? onPressedCreate;
  final Function(ProviderEntity)? onPressedEdit;
  final Function()? onPressedFilters;

  ProvidersLargeScreenPage({
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
          emptyText: "Nenhum fornecedor encontrado",
          isLoading: store.isLoading,
          source: CustomDataTableSource<ProviderEntity>(
            context: context,
            data: store.data,
            onPressedRow: onPressedEdit,
            buildCell: (e) => [
              DataCell(Text("${e.id}".padLeft(4, "0"))),
              DataCell(DataCellSimpleText(text: e.fullName)),
              DataCell(DataCellSimpleText(text: e.email)),
              DataCell(DataCellSimpleText(text: e.phone)),
            ],
          ),
          columns: [
            CustomDataTableColumn(
              title: "ID",
              size: ColumnSize.S,
              onSort: _onSort,
            ),
            CustomDataTableColumn(title: "Nome", onSort: _onSort),
            CustomDataTableColumn(title: "Email"),
            CustomDataTableColumn(title: "Telefone", size: ColumnSize.M),
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
