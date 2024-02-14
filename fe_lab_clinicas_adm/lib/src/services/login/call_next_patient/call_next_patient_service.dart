// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:developer';

import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';

import 'package:fe_lab_clinicas_adm/src/models/patient_information_form_model.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/attendante_desk_assignment/attendante_desk_assignment_repository.dart.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/painel/painel_repository.dart';
import 'package:fe_lab_clinicas_adm/src/repositories/patient_information_form/patient_information_form_repository.dart';

class CallNextPatientService {
  final PatientInformationFormRepository patientInformationFormRepository;
  final AttendanteDeskAssignmentRepository attendanteDeskAssignmentRepository;
  final PainelRepository painelRepository;

  CallNextPatientService({
    required this.patientInformationFormRepository,
    required this.attendanteDeskAssignmentRepository,
    required this.painelRepository,
  });

  Future<Either<RepositoryException, PatientInformationFormModel?>>
      execute() async {
    final result = await patientInformationFormRepository.callNextToCheckin();
    switch (result) {
      case Left(value: final exeption):
        return Left(exeption);
      case Right(value: final form?):
        return updatePanel(form);
      case Right():
        return Right(null);
    }
  }

  Future<Either<RepositoryException, PatientInformationFormModel?>> updatePanel(
      PatientInformationFormModel form) async {
    final resultDesk =
        await attendanteDeskAssignmentRepository.getDeskAssignment();

    switch (resultDesk) {
      case Left(value: final exception):
        return Left(exception);
      case Right(value: final deskNumber):
        final painelResult =
            await painelRepository.callOnPanel(form.password, deskNumber);
        switch (painelResult) {
          case Left(value: final exception):
            log(
              'ATENÇÃO!!! Não foi possível chamar o paciente',
              error: exception,
              stackTrace: StackTrace.fromString(
                  'ATENÇÃO!!! Não foi possível chamar o paciente'),
            );
            return Right(form);
          case Right():
            return Right(form);
        }
    }
  }
}
