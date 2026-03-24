



import 'package:she_sos_v1/features/profile/domain/entities/profile_user.dart';

abstract class ProfileRepo {

Future<ProfileUser?> fetchUserProfile(String uid);
Future<void> updateUserProfile(ProfileUser updatedProfile);




}