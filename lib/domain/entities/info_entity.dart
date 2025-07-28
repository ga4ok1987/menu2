import 'package:equatable/equatable.dart';

class InfoEntity extends Equatable {
  final int id;
  final String code;
  final String phone;
  final String email;
  final double lat;
  final double lon;
  final String imageUrl;


  final String name;
  final String address;
  final String about;

  const InfoEntity({
    required this.id,
    required this.code,
    required this.phone,
    required this.email,
    required this.lat,
    required this.lon,
    required this.name,
    required this.address,
    required this.about,
    required this.imageUrl,
  });

  @override
  List<Object?> get props => [
    id,
    code,
    phone,
    email,
    lat,
    lon,
    name,
    address,
    about,
    imageUrl,
  ];
}