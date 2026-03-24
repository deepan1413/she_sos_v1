import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:she_sos_v1/features/auth/domain/entities/app_user.dart';
import 'package:she_sos_v1/features/auth/presentation/cubits/auth_cubit.dart';
import 'package:she_sos_v1/features/chat/presentation/pages/chat_page.dart';
import 'package:she_sos_v1/features/home/presentation/pages/mapview_page.dart';
import 'package:she_sos_v1/features/profile/presentation/pages/profile_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final AppUser? _user;
  int _currentIndex = 0;
  late final List<Widget> _pages;

  /*
  
  final List<Widget> _pages = [
    const MapviewPage(),
    const ChatPage(),
    ProfilePage(uid: ),
  ];
*/
  @override
  void initState() {
    _user = context.read<AuthCubit>().currentUser;
    _pages = [
      const MapviewPage(),
      const ChatPage(),
      ProfilePage(uid: _user!.uid), // pass uid string
    ];
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index) {
          setState(() {
            _currentIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home_outlined),
            activeIcon: Icon(Icons.home_rounded),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.chat_bubble_outline_rounded),
            activeIcon: Icon(Icons.chat_bubble_rounded),
            label: 'Chats',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_outline_rounded),
            activeIcon: Icon(Icons.person_rounded),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
