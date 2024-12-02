import 'package:flutter/cupertino.dart';
import 'package:module_manager_poc/src/core/module_manager/module_abstraction.dart';
import 'package:provider/single_child_widget.dart';

abstract class ModuleManagerAbstraction {
  Future<void> registerModules(List<ModuleAbstraction> modules);
  Map<String, WidgetBuilder> get routes;
  List<SingleChildWidget> get controllers;
}
