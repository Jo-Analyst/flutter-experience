import 'package:fe_lab_clinicas_adm/src/pages/home/home_controller.dart';
import 'package:fe_lab_clinicas_adm/src/pages/home/home_page.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendante_desk_assignment/attendante_desk_assignment_repository.dart.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendante_desk_assignment/attendante_desk_assignment_repository_impl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';

class HomeRouter extends FlutterGetItPageRouter {
  const HomeRouter({super.key});

  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<AttendanteDeskAssignmentRepository>(
            (i) => AttendanteDeskAssignmentRepositoryImpl(restClient: i())),
        Bind.lazySingleton(
            (i) => HomeController(attendanteDeskAssignmentRepository: i()))
      ];

  @override
  String get routeName => '/home';

  @override
  WidgetBuilder get view => (_) => const HomePage();
}
