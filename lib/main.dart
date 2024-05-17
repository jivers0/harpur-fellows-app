import 'package:flutter/material.dart';
import 'package:harpur_fellows_app/notifiers/animation_notifier.dart';
import 'package:provider/provider.dart';
import 'screens/first_time_setup_page.dart';
import 'screens/home_page.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'configs/themes.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SharedPreferences prefs = await SharedPreferences.getInstance();
  var user = prefs.getString('user');
  // var user = null;
  runApp(MultiProvider(
    providers: [ChangeNotifierProvider(create: (_) => AnimationNotifier())],
    child: MaterialApp(
        title: 'Harpur Fellows App',
        debugShowCheckedModeBanner: false,
        theme: appTheme,
        home: user == null ? const FirstTimeSetupPage() : const HomePage()),
  ));
}
