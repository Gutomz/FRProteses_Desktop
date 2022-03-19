import 'package:flutter/material.dart';
import 'package:frproteses/src/presentation/config/style.dart';

class CustomDataTableSource<T> extends DataTableSource {
  final List<T> _data;
  final BuildContext _context;
  final Function(T)? _onPressedRow;
  final List<DataCell> Function(T) _buildCells;

  CustomDataTableSource({
    required BuildContext context,
    required List<T> data,
    required List<DataCell> Function(T) buildCell,
    Function(T)? onPressedRow,
  })  : _context = context,
        _data = data,
        _buildCells = buildCell,
        _onPressedRow = onPressedRow;

  @override
  DataRow? getRow(int index) {
    final _entity = _data[index];

    final onTap = _onPressedRow != null
        ? (bool? _) => _onPressedRow?.call(_entity)
        : null;

    return DataRow.byIndex(
      index: index,
      color: tableRowColor(_context),
      onSelectChanged: onTap,
      cells: _buildCells(_entity),
    );
  }

  @override
  bool get isRowCountApproximate => false;

  @override
  int get rowCount => _data.length;

  @override
  int get selectedRowCount => 0;
}
