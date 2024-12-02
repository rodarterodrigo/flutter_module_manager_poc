import 'package:get_it/get_it.dart';
import 'package:module_manager_poc/src/core/injector/injector_abstraction.dart';

class InjectorImplementation implements InjectorAbstraction {
  static final InjectorImplementation _instance = InjectorImplementation._();
  static InjectorImplementation get instance => _instance;
  late GetIt _getIt;

  InjectorImplementation._() {
    _getIt = GetIt.instance;
  }
  @override
  T get<T extends Object>() => _getIt.get<T>();

  @override
  void registerLazySingleton<T extends Object>(T instance) =>
      _getIt.registerLazySingleton<T>(() => instance);

  @override
  void registerSingleton<T extends Object>(T instance) =>
      _getIt.registerSingleton<T>(instance);
}
