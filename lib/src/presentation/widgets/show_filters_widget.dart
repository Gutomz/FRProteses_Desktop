import 'package:flutter/material.dart';

class Filter {
  final String name;
  final String value;
  final Function() onDeleted;

  Filter({
    required this.name,
    required this.value,
    required this.onDeleted,
  });
}

class ShowFiltersWidget extends StatelessWidget {
  final List<Filter> filters;
  final Function() onPressedClearFilters;
  final Widget? empty;

  ShowFiltersWidget({
    Key? key,
    required this.filters,
    required this.onPressedClearFilters,
    this.empty,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (filters.isEmpty) {
      if (empty != null) {
        return empty!;
      }

      return Container();
    }

    return Row(
      children: [
        _buildClearFiltersButton(context),
        SizedBox(width: 10),
        _buildFiltersList(context),
      ],
    );
  }

  Widget _buildFiltersList(BuildContext context) {
    return Expanded(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 15, bottom: 15, left: 5, right: 10),
          child: Row(
            children: [
              ...filters.map((filter) => Row(
                    children: [
                      _buildFilterChip(context, filter),
                      SizedBox(width: 10),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildFilterChip(BuildContext context, Filter filter) {
    return Chip(
      label: Text("${filter.name}: ${filter.value}"),
      backgroundColor: Theme.of(context).shadowColor.withOpacity(.02),
      elevation: 2,
      onDeleted: filter.onDeleted,
      deleteIconColor: Theme.of(context).errorColor,
      deleteButtonTooltipMessage: "Excluir filtro",
    );
  }

  Widget _buildClearFiltersButton(BuildContext context) {
    return ActionChip(
      label: Text("Limpar Filtros"),
      avatar: Icon(
        Icons.filter_alt_off_outlined,
        size: 14,
      ),
      tooltip: "Remover todos os filtros ativos",
      onPressed: onPressedClearFilters,
      backgroundColor: Theme.of(context).shadowColor.withOpacity(.02),
      elevation: 2,
    );
  }
}
