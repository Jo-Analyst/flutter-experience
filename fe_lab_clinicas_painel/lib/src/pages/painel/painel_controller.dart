import 'package:fe_lab_clinicas_painel/src/models/painel_checkin_model.dart';
import 'package:fe_lab_clinicas_painel/src/repositories/painel_checkin/painel_checkin_repository.dart';
import 'package:signals_flutter/signals_flutter.dart';

class PainelController {
  final PainelCheckinRepository _repository;
  final painelData = listSignal<PainelCheckinModel>([]);
  Connect? _painnelConnect;

  PainelController({required PainelCheckinRepository repository})
      : _repository = repository;

  Function? _socketDispose;

  void listenerPainel() {
    final (:channel, :dispose) = _repository.openChannelSocket();
    _socketDispose = dispose;

    _painnelConnect = connect(painelData);
    final painelStream = _repository.getTodayPanel(channel);
    _painnelConnect!.from(painelStream);
  }

  void dispose() {
    _painnelConnect?.dispose();
    if (_socketDispose != null) {
      _socketDispose!();
    }
  }
}
