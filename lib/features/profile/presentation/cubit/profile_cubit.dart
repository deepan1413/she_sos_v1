import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart';
import 'package:she_sos_v1/features/profile/domain/repo/profile_repo.dart';
import 'package:she_sos_v1/features/profile/presentation/cubit/profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepo profileRepo;

  ProfileCubit({required this.profileRepo}) : super(ProfileInitial());

  Future<void> fetchUserProfile(String uid) async {
    try {
      emit(ProfileLoading());
      final user = await profileRepo.fetchUserProfile(uid);
      if (user != null) {
        emit(ProfileLoaded(user));
      } else {
        emit(ProfileError("User not found"));
      }
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }

  Future<void> updateProfile({required String uid, String? newbio}) async {
    emit(ProfileLoading());
    try {
      final currentUser = await profileRepo.fetchUserProfile(uid);
      if (currentUser == null) {
        emit(ProfileError("Failed to fetch user data"));

        return;
      }
      final updatedProfile = currentUser.copyWith(
        newbio: newbio ?? currentUser.bio,
      );
      await profileRepo.updateUserProfile(updatedProfile);
      await profileRepo.fetchUserProfile(uid);
    } catch (e) {
      emit(ProfileError(e.toString()));
    }
  }
}
