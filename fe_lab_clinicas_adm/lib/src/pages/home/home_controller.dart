import 'package:asyncstate/asyncstate.dart' as asyncstate;
import 'package:fe_lab_clinicas_adm/src/repositories/attendante_desk_assignment/attendante_desk_assignment_repository.dart.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

class HomeController with MessageStateMixin {
  final AttendanteDeskAssignmentRepository _attendanteDeskRepository;

  HomeController(
      {required AttendanteDeskAssignmentRepository
          attendanteDeskAssignmentRepository})
      : _attendanteDeskRepository = attendanteDeskAssignmentRepository;

  Future<void> startService(int deskNumber) async {
    asyncstate.AsyncState.show();
    final result = await _attendanteDeskRepository.startService(deskNumber);

    switch (result) {
      case Left():
        showError('Erro ao iniciar Guichê');
      case Right():
        asyncstate.AsyncState.hide();
        // chamar próximo paciente
        showInfo('Registrou com sucesso');
    }
  }
}
