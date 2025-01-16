// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i7;
import 'package:flutter/material.dart' as _i8;
import 'package:proyecto_torneos/presentation/drawer_header_options/drawer_menu_header.dart'
    as _i2;
import 'package:proyecto_torneos/presentation/end_drawer_add/end_drawer_add.dart'
    as _i1;
import 'package:proyecto_torneos/presentation/home/home_screen.dart' as _i3;
import 'package:proyecto_torneos/presentation/register_statistic/volleyball_matches_screen.dart'
    as _i6;
import 'package:proyecto_torneos/presentation/result_record/score_register_screen.dart'
    as _i4;
import 'package:proyecto_torneos/presentation/result_table/result_table_screen.dart'
    as _i5;

/// generated route for
/// [_i1.CustomPopupMenu]
class CustomPopupMenu extends _i7.PageRouteInfo<CustomPopupMenuArgs> {
  CustomPopupMenu({
    _i8.Key? key,
    required void Function(int) onOptionSelected,
    List<_i7.PageRouteInfo>? children,
  }) : super(
         CustomPopupMenu.name,
         args: CustomPopupMenuArgs(
           key: key,
           onOptionSelected: onOptionSelected,
         ),
         initialChildren: children,
       );

  static const String name = 'CustomPopupMenu';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CustomPopupMenuArgs>();
      return _i1.CustomPopupMenu(
        key: args.key,
        onOptionSelected: args.onOptionSelected,
      );
    },
  );
}

class CustomPopupMenuArgs {
  const CustomPopupMenuArgs({this.key, required this.onOptionSelected});

  final _i8.Key? key;

  final void Function(int) onOptionSelected;

  @override
  String toString() {
    return 'CustomPopupMenuArgs{key: $key, onOptionSelected: $onOptionSelected}';
  }
}

/// generated route for
/// [_i2.DrawerMenuHeader]
class DrawerMenuHeader extends _i7.PageRouteInfo<void> {
  const DrawerMenuHeader({List<_i7.PageRouteInfo>? children})
    : super(DrawerMenuHeader.name, initialChildren: children);

  static const String name = 'DrawerMenuHeader';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i2.DrawerMenuHeader();
    },
  );
}

/// generated route for
/// [_i3.HomeScreen]
class HomeRoute extends _i7.PageRouteInfo<void> {
  const HomeRoute({List<_i7.PageRouteInfo>? children})
    : super(HomeRoute.name, initialChildren: children);

  static const String name = 'HomeRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i3.HomeScreen();
    },
  );
}

/// generated route for
/// [_i4.ResultRecordScreen]
class ResultRecordRoute extends _i7.PageRouteInfo<void> {
  const ResultRecordRoute({List<_i7.PageRouteInfo>? children})
    : super(ResultRecordRoute.name, initialChildren: children);

  static const String name = 'ResultRecordRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i4.ResultRecordScreen();
    },
  );
}

/// generated route for
/// [_i5.ResultTableScreen]
class ResultTableRoute extends _i7.PageRouteInfo<void> {
  const ResultTableRoute({List<_i7.PageRouteInfo>? children})
    : super(ResultTableRoute.name, initialChildren: children);

  static const String name = 'ResultTableRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i5.ResultTableScreen();
    },
  );
}

/// generated route for
/// [_i6.VolleyballMatchesScreen]
class VolleyballMatchesRoute extends _i7.PageRouteInfo<void> {
  const VolleyballMatchesRoute({List<_i7.PageRouteInfo>? children})
    : super(VolleyballMatchesRoute.name, initialChildren: children);

  static const String name = 'VolleyballMatchesRoute';

  static _i7.PageInfo page = _i7.PageInfo(
    name,
    builder: (data) {
      return const _i6.VolleyballMatchesScreen();
    },
  );
}
