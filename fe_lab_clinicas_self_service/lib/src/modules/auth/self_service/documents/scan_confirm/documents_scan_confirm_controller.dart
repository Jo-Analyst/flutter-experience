import 'dart:typed_data';

import 'package:asyncstate/asyncstate.dart';
import 'package:fe_lab_clinicas_core/fe_lab_clinicas_core.dart';
import 'package:signals_flutter/signals_flutter.dart';

import 'package:fe_lab_clinicas_self_service/src/repositories/documents/documents_repository.dart';

class DocumentsScanConfirmController with MessageStateMixin {
  final pathRemoteStorage = signal<String?>(null);
  final DocumentsRepository documentsRepository;
  DocumentsScanConfirmController({
    required this.documentsRepository,
  });

  Future<void> uploadImage(Uint8List imageBytes, String filename) async {
    final result = await documentsRepository
        .uploadImage(imageBytes, filename)
        .asyncLoader();

    switch (result) {
      case Left():
        showError('Erro ao fazer upload da image');
      case Right(value: final pathFile):
        pathRemoteStorage.value = pathFile;
    }
  }
}
