import 'package:flutter/cupertino.dart';
import 'package:module_manager_poc/src/core/injector/injector.dart';
import 'package:provider/single_child_widget.dart';

abstract class ModuleAbstraction {
  Map<String, WidgetBuilder>? routes();
  List<SingleChildWidget>? controllers(InjectorAbstraction injector);
  Future<void> registerDatasources(InjectorAbstraction injector);
  Future<void> registerRepositories(InjectorAbstraction injector);
  Future<void> registerUsecases(InjectorAbstraction injector);
}
