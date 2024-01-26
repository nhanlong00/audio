import 'package:firestore/screens/audio_player/audio_player.dart';
import 'package:firestore/screens/home/page.dart';
import 'package:firestore/screens/login/page.dart';
import 'package:firestore/screens/start/start.dart';
import 'package:get/get.dart';

class AppRoutes {
  static final routes = [
    GetPage(name: '/start', page: () => const StartPage()),
    GetPage(name: '/homepage', page: () => const HomePage()),
    GetPage(name: '/login_page', page: () => const LoginPage()),
    GetPage(name: '/audio_player', page: () => const AudioPlayer()),
  ];
}