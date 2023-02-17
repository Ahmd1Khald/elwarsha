import 'package:equatable/equatable.dart';

class UserData extends Equatable {
  final String name;
  final String id;
  final String phone;
  final String? avatar;
  final String? bio;
  final List<String>? rolesName;
  final String? status;
  final String updatedAt;
  final String createdAt;

  const UserData({
    required this.name,
    required this.id,
    required this.phone,
    required this.avatar,
    required this.bio,
    this.rolesName,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  @override
  List<Object?> get props => [
        name,
        phone,
        avatar,
        bio,
        rolesName,
        status,
        updatedAt,
        createdAt,
      ];
}
