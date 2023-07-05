import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telkom_sehat/login_screen.dart';
import 'package:http/http.dart' as http;

import 'dokter/aaa_dokter_screen.dart';
import 'pasien/aaa_pasien_screen.dart';
import 'paramedis/aaa_paramedis_screen.dart';

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  SharedPreferences prefs = await SharedPreferences.getInstance();
  var username = prefs.getString('username') ?? 'null';
  var stayloggedintoken = prefs.getString('stayloggedintoken') ?? 'null';
  var role = prefs.getString('role') ?? 'null';

  bool validLogin;

  if (username != 'null' && stayloggedintoken != 'null' && role != 'null') {
    http.Response response;
    try {
      response = await http.post(
        Uri.parse('http://yntkts.ddns.net:8000/api/mobile_app_token_check'),
        body: {
          'username': username,
          'stayloggedintoken': stayloggedintoken,
          'role': role,
        },
      ).timeout(
        const Duration(milliseconds: 3000),
      );
    } catch (e) {
      response = await http.post(
        Uri.parse('http://10.60.224.190:8000/api/mobile_app_token_check'),
        body: {
          'username': username,
          'stayloggedintoken': stayloggedintoken,
          'role': role,
        },
      ).timeout(
        const Duration(milliseconds: 3000),
      );
    }

    // response = await http.post(
    //   Uri.parse('http://10.60.224.190:8000/api/mobile_app_token_check'),
    //   body: {
    //     'username': username,
    //     'stayloggedintoken': stayloggedintoken,
    //     'role': role,
    //   },
    // );

    if (jsonDecode(response.body)['tokenCheck']) {
      validLogin = true;
    } else {
      validLogin = false;
    }
  } else {
    validLogin = false;
  }

  runApp(MyApp(
      username: username,
      stayloggedintoken: stayloggedintoken,
      role: role,
      validLogin: validLogin));
}

class MyApp extends StatelessWidget {
  final String username;
  final String stayloggedintoken;
  final String role;
  final bool validLogin;

  const MyApp({
    super.key,
    required this.username,
    required this.stayloggedintoken,
    required this.role,
    required this.validLogin,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TelkomSehat',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: MyHomePage(
        title: 'TelkomSehat',
        username: username,
        stayloggedintoken: stayloggedintoken,
        role: role,
        validLogin: validLogin,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  // const MyHomePage({super.key, required this.title});
  const MyHomePage(
      {Key? key,
      required this.title,
      required this.username,
      required this.stayloggedintoken,
      required this.role,
      required this.validLogin})
      : super(key: key);

  final String title;
  final String? username;
  final String? stayloggedintoken;
  final String? role;
  final bool? validLogin;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void initialization() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    FlutterNativeSplash.remove();
  }

  void localeInitialization() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('id', null);
  }

  @override
  void initState() {
    super.initState();

    localeInitialization();
  }

  @override
  Widget build(BuildContext context) {
    initialization();

    String? username = widget.username;
    String? stayloggedintoken = widget.stayloggedintoken;
    String? role = widget.role;
    bool? validLogin = widget.validLogin;

    if (username != null &&
        stayloggedintoken != null &&
        role != null &&
        validLogin == true) {
      if (role == 'Pasien') {
        return const MahasiswaScreen();
      } else if (role == 'Dokter') {
        return const DokterScreen();
      } else if (role == 'Paramedis') {
        return const ParamedisScreen();
      }
    }

    return const LoginScreen();
  }
}
