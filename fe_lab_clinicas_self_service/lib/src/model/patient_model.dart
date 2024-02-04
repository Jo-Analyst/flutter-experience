// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:json_annotation/json_annotation.dart';

import 'package:fe_lab_clinicas_self_service/src/model/patient_address_model.dart';

part 'patient_model.g.dart';

@JsonSerializable()
class PatientModel {
  final String id;
  final String name;
  final String email;
  @JsonKey(name: 'phone_number')
  final String phoneNumber;
  final String document;
  final PatientAddressModel patientAddress;
  @JsonKey(name: 'guardian', defaultValue: '')
  final String guardian;
  @JsonKey(name: 'guardian_identification_number', defaultValue: '')
  final String guardianIdentificationNumber;

  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  PatientModel({
    required this.id,
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.document,
    required this.patientAddress,
    required this.guardian,
    required this.guardianIdentificationNumber,
  });

  Map<String, dynamic> toJson() => _$PatientModelToJson(this);
}
