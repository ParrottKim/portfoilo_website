import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

ThemeData light = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.light,
  primarySwatch: Colors.teal,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.light,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Colors.black,
    secondary: Colors.teal,
    onSecondary: Colors.teal[200],
    tertiary: Colors.white,
  ),
  textTheme: TextTheme().apply(
    bodyColor: Colors.grey[850],
    displayColor: Colors.grey[850],
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    ),
  ),
  listTileTheme: ListTileThemeData(
    textColor: Colors.grey[850],
    selectedTileColor: Colors.grey[200],
  ),
  canvasColor: Colors.blueGrey[100],
  scaffoldBackgroundColor: Color(0xFFEEEEEE),
);

ThemeData dark = ThemeData(
  fontFamily: 'Pretendard',
  brightness: Brightness.dark,
  primarySwatch: Colors.teal,
  colorScheme: ColorScheme.fromSwatch(
    brightness: Brightness.dark,
    backgroundColor: Colors.white,
  ).copyWith(
    primary: Colors.white,
    secondary: Colors.teal,
    onSecondary: Colors.teal[200],
    tertiary: Colors.black,
  ),
  textTheme: TextTheme().apply(
    bodyColor: Colors.white60,
    displayColor: Colors.white60,
  ),
  buttonTheme: ButtonThemeData(
    buttonColor: Colors.teal,
    textTheme: ButtonTextTheme.primary,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all(Colors.teal),
    ),
  ),
  listTileTheme: ListTileThemeData(
    textColor: Colors.white60,
    selectedTileColor: Colors.grey[800],
  ),
  canvasColor: Colors.blueGrey[800],
  scaffoldBackgroundColor: Color.fromARGB(255, 14, 24, 39),
);

final themeProvider =
    ChangeNotifierProvider<ThemeNotifier>((ref) => ThemeNotifier());

class ThemeNotifier extends ChangeNotifier {
  final String key = 'theme';
  late SharedPreferences prefs;
  late bool _darkTheme;

  bool get darkTheme => _darkTheme;

  ThemeNotifier() {
    _darkTheme = false;
    loadFromPrefs();
  }

  toggleTheme() {
    _darkTheme = !_darkTheme;
    saveToPrefs();
    notifyListeners();
  }

  _initPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  loadFromPrefs() async {
    await _initPrefs();
    _darkTheme = prefs.getBool(key) ?? false;
    notifyListeners();
  }

  saveToPrefs() async {
    await _initPrefs();
    prefs.setBool(key, darkTheme);
  }
}
