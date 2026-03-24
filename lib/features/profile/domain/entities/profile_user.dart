import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';

class ProfileUser extends AppUser {
  final String phone;
  final String city;
  final String gender;
  final String bloodGroup;
  final bool isVolunteer;
  final List<Map<String, String>> emergencyContacts;
  final String bio;
  final String profileImageUrl;

  ProfileUser({
    required super.uid,
    required super.email,
    required super.name,
    required this.bio,
    required this.city,
    required this.gender,
    required this.bloodGroup,
    required this.isVolunteer,
    required this.emergencyContacts,
    required this.phone,
    required this.profileImageUrl,
  });

  ProfileUser copyWith({
    String? newbio,
    String? newcity,
    String? newgender,
    String? newbloodGroup,
    bool? newisVolunteer,
    List<Map<String, String>>? newemergencyContacts,
    String? newphone,
    String? newprofileImageUrl,
  }) {
    return ProfileUser(
      uid: uid,
      email: email,
      name: name,
      bio: newbio ?? bio,
      city: newcity ?? city,
      gender: newgender ?? gender,
      bloodGroup: newbloodGroup ?? bloodGroup,
      isVolunteer: newisVolunteer ?? isVolunteer,
      emergencyContacts: newemergencyContacts ?? emergencyContacts,
      phone: newphone ?? phone,
      profileImageUrl: newprofileImageUrl ?? profileImageUrl,
    );
  }

  /// 🔹 Convert object → JSON
  Map<String, dynamic> toJson() {
    return {
      'uid': uid,
      'email': email,
      'name': name,
      'bio': bio,
      'city': city,
      'gender': gender,
      'bloodGroup': bloodGroup,
      'isVolunteer': isVolunteer,
      'emergencyContacts': emergencyContacts,
      'phone': phone,
      'profileImageUrl': profileImageUrl,
    };
  }

  /// 🔹 Convert JSON → object
  factory ProfileUser.fromJson(Map<String, dynamic> json) {
    return ProfileUser(
      uid: json['uid'] ?? '',
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      bio: json['bio'] ?? '',
      city: json['city'] ?? '',
      gender: json['gender'] ?? '',
      bloodGroup: json['bloodGroup'] ?? '',
      isVolunteer: json['isVolunteer'] ?? false,
      emergencyContacts: (json['emergencyContacts'] as List<dynamic>)
          .map((e) => Map<String, String>.from(e))
          .toList(),
      phone: json['phone'] ?? '',
      profileImageUrl: json['profileImageUrl'] ?? '',
    );
  }
}