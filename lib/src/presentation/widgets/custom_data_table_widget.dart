import 'package:flutter/material.dart';
import 'package:frproteses/data_table/custom_data_table.dart';
import 'package:frproteses/src/presentation/helpers/responsive_widget.dart';

class CustomDataTableWidget extends StatelessWidget {
  final List<CustomDataTableColumn> columns;
  final DataTableSource source;
  final String emptyText;
  final bool isLoading;
  final Widget? header;
  final List<Widget>? actions;
  final int? sortColumnIndex;
  final bool sortAscending;

  CustomDataTableWidget({
    Key? key,
    required this.columns,
    required this.source,
    required this.emptyText,
    this.isLoading = false,
    this.header,
    this.actions,
    this.sortColumnIndex,
    this.sortAscending = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomPaginatedDataTable(
      columns: _getDataColumnList(context),
      source: source,
      sortColumnIndex: sortColumnIndex,
      sortAscending: sortAscending,
      autoRowsToHeight: true,
      showFirstLastButtons: true,
      header: header,
      actions: actions,
      empty: Padding(
        padding: EdgeInsets.symmetric(vertical: 20),
        child: isLoading ? CircularProgressIndicator() : Text(emptyText),
      ),
      showCheckboxColumn: false,
      minWidth: mediumScreenSize.toDouble(),
    );
  }

  List<DataColumn> _getDataColumnList(BuildContext context) {
    final _columns = columns;

    return _buildListOfDataColumn(context, _columns);
  }

  List<DataColumn> _buildListOfDataColumn(
    BuildContext context,
    List<CustomDataTableColumn> columns,
  ) {
    return columns.map((column) => column.build(context)).toList();
  }
}

class CustomDataTableColumn {
  final String title;
  final ColumnSize size;
  final String? tooltip;
  final bool numeric;
  final Function(int, bool)? onSort;

  CustomDataTableColumn({
    required this.title,
    this.size = ColumnSize.L,
    this.tooltip,
    this.numeric = false,
    this.onSort,
  });

  DataColumn build(BuildContext context) {
    return CustomDataColumn(
      label: Text(title),
      size: size,
      tooltip: tooltip,
      numeric: numeric,
      onSort: onSort,
    );
  }
}

class CustomDataTableActionButtonWidget extends StatelessWidget {
  final IconData icon;
  final Function()? onPressed;
  final Color? iconColor;
  final String? tooltip;

  CustomDataTableActionButtonWidget({
    Key? key,
    required this.icon,
    this.onPressed,
    this.iconColor,
    this.tooltip,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      tooltip: tooltip,
      icon: Icon(
        icon,
        color: iconColor,
      ),
      splashRadius: 20,
      splashColor: Theme.of(context).splashColor,
      hoverColor: Theme.of(context).splashColor.withOpacity(0.1),
      highlightColor: Theme.of(context).splashColor.withOpacity(0.4),
    );
  }
}
