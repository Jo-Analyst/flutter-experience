import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/src/loader/lab_clinicas_loader.dart';
import 'package:fe_lab_clinicas_core/src/theme/lab_clinicas_theme.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class LabClinicasCoreConfig extends StatelessWidget {
  const LabClinicasCoreConfig({
    super.key,
    this.bindings,
    this.pages,
    this.pagesBuilder,
    this.modules,
    required this.title,
    this.didStart,
  });

  final ApplicationBindings? bindings;
  final List<FlutterGetItPageRouter>? pages;
  final List<FlutterGetItPageBuilder>? pagesBuilder;
  final List<FlutterGetItModule>? modules;
  final String title;
  final VoidCallback? didStart;

  @override
  Widget build(BuildContext context) {
    return FlutterGetIt(
      debugMode: kDebugMode,
      bindings: bindings,
      pages: [...pages ?? [], ...pagesBuilder ?? []],
      modules: modules,
      builder: (context, routes, flutterGetItNavObserver) {
        return AsyncStateBuilder(
          loader: LabClinicasLoader(),
          builder: (navigatorObserver) {
            if (didStart != null) {
              didStart!();
            }
            return MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: LabClinicasTheme.lightTheme,
              darkTheme: LabClinicasTheme.darkTheme,
              title: title,
              navigatorObservers: [
                navigatorObserver,
                flutterGetItNavObserver,
              ],
              routes: routes,
            );
          },
        );
      },
    );
  }
}
