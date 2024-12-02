import 'package:flutter/src/widgets/framework.dart';
import 'package:module_manager_poc/src/core/injector/injector.dart';
import 'package:module_manager_poc/src/core/module_manager/module_abstraction.dart';
import 'package:module_manager_poc/src/core/module_manager/module_manager_abstraction.dart';
import 'package:nested/nested.dart';

class ModuleManager implements ModuleManagerAbstraction {
  late Map<String, WidgetBuilder> _routes;
  late List<SingleChildWidget> _controllers;
  final InjectorAbstraction _injector = InjectorImplementation.instance;

  @override
  List<SingleChildWidget> get controllers => _controllers;

  @override
  Future<void> registerModules(List<ModuleAbstraction> modules) async {
    for (ModuleAbstraction module in modules) {
      await module.registerDatasources(_injector);
      await module.registerRepositories(_injector);
      await module.registerUsecases(_injector);
      if (module.controllers(_injector) != null) {
        _controllers.addAll(module.controllers(_injector)!);
      }
      if (module.routes() != null) {
        _routes.addAll(module.routes()!);
      }
    }
  }

  @override
  Map<String, WidgetBuilder> get routes => _routes;
}
