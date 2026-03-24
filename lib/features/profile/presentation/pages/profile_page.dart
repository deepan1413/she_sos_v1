import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:she_sos_v1/configs/mylogs/my_logs.dart';
import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:she_sos_v1/features/profile/domain/entities/profile_user.dart';
import 'package:she_sos_v1/features/profile/presentation/cubit/profile_cubit.dart';
import 'package:she_sos_v1/features/profile/presentation/cubit/profile_state.dart';

class ProfilePage extends StatefulWidget {
  final String uid;
  const ProfilePage({super.key, required this.uid});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  late final authcubit = context.read<AuthCubit>();
  late final profileCubit = context.read<ProfileCubit>();
  late AppUser? currentUser = authcubit.currentUser;
  ProfileUser? profileUser;

  @override
  void initState() {
    super.initState();
    profileCubit.fetchUserProfile(widget.uid);
    final user = authcubit.currentUser;

    // Cast AppUser → ProfileUser (if applicable)
    if (user is ProfileUser) {
      profileUser = user;
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, profileState) {
        MyLog.highlight(profileState.toString());
        if (profileState is ProfileLoaded) {
          final user = profileState.profileUser;
          return Scaffold(
            appBar: AppBar(
              title: Text(user.email),
              actions: [
                IconButton(
                  onPressed: () {
                    context.read<AuthCubit>().logout();
                  },
                  icon: const Icon(Icons.logout),
                ),
              ],
            ),
            body: Column(children: [Text("Name: ${profileUser!.name}")]),
          );
        } else if (profileState is ProfileLoading) {
          return Scaffold(body: Center(child: CircularProgressIndicator()));
        }
        return Scaffold(body: Center(child: Text("NO USER FOUND...")));
      },
    );

    /*Scaffold(
      appBar: AppBar(
        title: const Text("Profile"),
        actions: [
          IconButton(
            onPressed: () {
              context.read<AuthCubit>().logout();
            },
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: profileUser == null
          ? const Center(child: Text("No user data"))
          : Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Name: ${profileUser!.name}"),
                  Text("Email: ${profileUser!.email}"),
                  Text("Phone: ${profileUser!.phone}"),
                  Text("City: ${profileUser!.city}"),
                  Text("Gender: ${profileUser!.gender}"),
                  Text("Blood Group: ${profileUser!.bloodGroup}"),
                  Text("Volunteer: ${profileUser!.isVolunteer}"),
                  Text("Bio: ${profileUser!.bio}"),
                  Text("Profile Image: ${profileUser!.profileImageUrl}"),

                  const SizedBox(height: 16),

                  const Text(
                    "Emergency Contacts:",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),

                  ...profileUser!.emergencyContacts.map(
                    (contact) =>
                        Text("${contact['name']} - ${contact['phone']}"),
                  ),
                ],
              ),
            ),
    );*/
  }
}
