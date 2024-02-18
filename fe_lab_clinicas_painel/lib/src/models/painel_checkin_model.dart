import 'package:json_annotation/json_annotation.dart';

part 'painel_checkin_model.g.dart';

@JsonSerializable(fieldRename: FieldRename.snake)
class PainelCheckinModel {
  final String id;
  final String password;
  final int attendantDesk;
  factory PainelCheckinModel.fromJson(Map<String, dynamic> json) =>
      _$PainelCheckinModelFromJson(json);

  PainelCheckinModel({
    required this.id,
    required this.password,
    required this.attendantDesk,
  });

  Map<String, dynamic> toJson() => _$PainelCheckinModelToJson(this);
}
