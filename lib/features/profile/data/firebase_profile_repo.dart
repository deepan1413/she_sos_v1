import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:she_sos_v1/configs/mylogs/my_logs.dart';
import 'package:she_sos_v1/features/profile/domain/entities/profile_user.dart';
import 'package:she_sos_v1/features/profile/domain/repo/profile_repo.dart';

class FirebaseProfileRepo implements ProfileRepo {
  FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  @override
  Future<ProfileUser?> fetchUserProfile(String uid) async {
    try {
      final userDoc = await firebaseFirestore
          .collection("users")
          .doc(uid)
          .get();

      if (userDoc.exists) {
        final userData = userDoc.data();
        if (userData != null) {

MyLog.highlight(userData.toString());

          return ProfileUser(
            uid: uid,
            email: userData["email"]??'',
            name: userData["name"]??'',
            bio: userData["bio"]??'',
            city: userData["city"]??'',
            gender: userData["gender"]??'',
            bloodGroup: userData["bloodGroup"]??'',
            isVolunteer: userData["isVolunteer"]??'',
            emergencyContacts: userData["emergencyContacts"]??'',
            phone: userData["phone"]??'',
            profileImageUrl: userData["profileImageUrl"].toString()??'',
          );
        }
      }
      return null;
    } catch (e) {
      return null;
    }
  }

  @override
  Future<void> updateUserProfile(ProfileUser updatedProfile) async {
    try {
      await firebaseFirestore
          .collection("users")
          .doc(updatedProfile.uid)
          .update({
            'bio': updatedProfile.bio,
            'city': updatedProfile.city,
            'gender': updatedProfile.gender,
            'bloodGroup': updatedProfile.bloodGroup,
            'isVolunteer': updatedProfile.isVolunteer,
            'emergencyContacts': updatedProfile.emergencyContacts,
            'phone': updatedProfile.phone,
            'profileImageUrl': updatedProfile.profileImageUrl,
          });
    } catch (e) {}
  }
}
