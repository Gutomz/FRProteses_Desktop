import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:frproteses/data_table/custom_data_table.dart';
import 'package:frproteses/data_table/src/custom_data_table_source.dart';
import 'package:frproteses/src/domain/entities/bank_account_entity.dart';
import 'package:frproteses/src/domain/entities/customer_entity.dart';
import 'package:frproteses/src/presentation/pages/customers/store/customers_page_store.dart';
import 'package:frproteses/src/presentation/widgets/balance_widget.dart';
import 'package:frproteses/src/presentation/widgets/custom_data_table_widget.dart';
import 'package:frproteses/src/presentation/widgets/data_cell_simple_text.dart';
import 'package:frproteses/src/presentation/widgets/show_filters_widget.dart';

class CustomersLargeScreenPage extends StatelessWidget {
  final CustomersPageStore store;

  final Function()? onPressedCreate;
  final Function(CustomerEntity)? onPressedEdit;
  final Function()? onPressedFilters;
  final Function(BuildContext, BankAccountEntity)? onPressedPrint;

  CustomersLargeScreenPage({
    Key? key,
    required this.store,
    this.onPressedCreate,
    this.onPressedEdit,
    this.onPressedFilters,
    this.onPressedPrint,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: store.loadAll(),
      builder: (context, _) => Observer(
        builder: (context) => CustomDataTableWidget(
          sortColumnIndex: store.sortColumnIndex,
          sortAscending: store.sortAscending,
          emptyText: "Nenhum cliente encontrado",
          isLoading: store.isLoading,
          source: CustomDataTableSource<CustomerEntity>(
            context: context,
            data: store.data,
            onPressedRow: onPressedEdit,
            buildCell: (e) => [
              DataCell(Text("${e.id}".padLeft(4, "0"))),
              DataCell(DataCellSimpleText(text: e.fullName)),
              DataCell(DataCellSimpleText(text: e.email)),
              DataCell(DataCellSimpleText(text: e.phone)),
              DataCell(Observer(
                  builder: (context) => _buildBalanceCellWidget(context, e))),
            ],
          ),
          columns: [
            CustomDataTableColumn(
              title: "ID",
              size: ColumnSize.S,
              onSort: _onSort,
            ),
            CustomDataTableColumn(title: "Nome", onSort: _onSort),
            CustomDataTableColumn(title: "Email", size: ColumnSize.M),
            CustomDataTableColumn(title: "Telefone", size: ColumnSize.M),
            CustomDataTableColumn(title: "Saldo", size: ColumnSize.M),
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

  Widget _buildBalanceCellWidget(BuildContext context, CustomerEntity e) {
    final bankAccount = store.getBankAccount(e);

    final isDebit = bankAccount.balance < 0;
    final isOutstanding = bankAccount.outstandingBalance > 0;

    return BalanceWidget(
      bankAccount: bankAccount,
      isDebit: isDebit,
      onPressedPrint: onPressedPrint,
      isOutstanding: isOutstanding,
    );
  }

  void _onSort(int index, bool isAscending) {
    store.setSortColumnIndex(index, isAscending: isAscending);
  }
}
