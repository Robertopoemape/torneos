import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_datagrid/datagrid.dart';

import '../../../core/style/style.dart';
import '../widgets/my_data_source.dart';
import 'table_result_vball_vm.dart';

@RoutePage()
class TableResultVoleyScreen extends StatelessWidget {
  const TableResultVoleyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => TableResultVoleyVm(),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: ComColors.succ500,
          foregroundColor: ComColors.gsWhite,
          centerTitle: true,
          title: Text(
            'Resultados',
            style: ComTextStyle.h6.gsWhite,
          ),
        ),
        body: Consumer<TableResultVoleyVm>(
          builder: (context, vm, _) {
            return _buildBody(context, vm);
          },
        ),
      ),
    );
  }

  Widget _buildBody(BuildContext context, TableResultVoleyVm vm) {
    if (vm.isLoading) {
      return _buildLoading();
    }

    if (vm.error != null) {
      return _buildError(vm.error!);
    }

    if (vm.matches.isEmpty) {
      return _buildEmpty();
    }

    return _buildDataGrid(vm);
  }

  Widget _buildLoading() {
    return const Center(
      child: CircularProgressIndicator(),
    );
  }

  Widget _buildError(String error) {
    return Center(
      child: Text(
        error,
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildEmpty() {
    return const Center(
      child: Text('No hay datos disponibles'),
    );
  }

  Widget _buildDataGrid(TableResultVoleyVm vm) {
    return LayoutBuilder(
      builder: (context, constraints) {
        return SfDataGrid(
          source: MyDataSource(vm.rowData),
          columnWidthMode: constraints.maxWidth > 600
              ? ColumnWidthMode.fill
              : ColumnWidthMode.auto,
          frozenColumnsCount: 2,
          gridLinesVisibility: GridLinesVisibility.both,
          headerGridLinesVisibility: GridLinesVisibility.both,
          columns: vm.gridColumns,
        );
      },
    );
  }
}
