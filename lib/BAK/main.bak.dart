import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:telkom_sehat/login_screen.dart';
import 'package:telkom_sehat/paramedis/paramedis_screen.dart';
import 'package:http/http.dart' as http;

import 'dokter/aaa_dokter_screen.dart';
import 'mahasiswa/aaa_mahasiswa_screen.dart';

Future<bool> checkLogay(username, stayloggedintoken, role) async {
  http.Response response;
  try {
    response = await http.post(
      Uri.parse('http://yntkts.ddns.net:8000/api/mobile_app_token_check'),
      body: {
        'username': username,
        'stayloggedintoken': stayloggedintoken,
      },
    ).timeout(
      const Duration(milliseconds: 3000),
    );
  } catch (e) {
    response = await http.post(
      Uri.parse('http://192.168.3.2:8000/api/mobile_app_token_check'),
      body: {
        'username': username,
        'stayloggedintoken': stayloggedintoken,
      },
    ).timeout(
      const Duration(milliseconds: 3000),
    );
  }

  if (response.statusCode == 200) {
    if (stayloggedintoken == jsonDecode(response.body)['checkToken']) {
      return true;
    }
  } else {
    throw Exception('Failed to auto login');
  }
  return false;
}

class SPHelper {
  SPHelper._();

  static SPHelper sp = SPHelper._();
  SharedPreferences? prefs;

  Future<void> initSharedPreferences() async {
    prefs = await SharedPreferences.getInstance();
  }

  Future<void> save(String name, String value) async {
    await prefs!.setString(name, value);
  }

  String? get(String key) {
    return prefs!.getString(key);
  }

  Future<bool> delete(String key) async {
    return await prefs!.remove(key);
  }
}

Future<void> main() async {
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  await SPHelper.sp.initSharedPreferences();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  bool isLoggedIn = await checkLogay(SPHelper.sp.get("username")!,
      SPHelper.sp.get("stayloggedintoken")!, SPHelper.sp.get("role")!);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TelkomSehat',
      theme: ThemeData(
        textTheme: GoogleFonts.openSansTextTheme(),
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'TelkomSehat'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<SharedPreferences> _prefsFuture;

  // late String username = 'default_value';
  late String stayloggedintoken = 'default_value';
  late String role = 'default_value';

  // final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  // late Future<String> username;
  // late Future<String> stayloggedintoken;
  // late Future<String> role;

  String? username;

  String? action;

  @override
  void initState() {
    super.initState();

    _prefsFuture = SharedPreferences.getInstance();

    // sharedPreferencesInit();

    // username = _prefs.then((SharedPreferences prefs) {
    //   return prefs.getString('username') ?? '';
    // });
    // stayloggedintoken = _prefs.then((SharedPreferences prefs) {
    //   return prefs.getString('stayloggedintoken') ?? '';
    // });
    // role = _prefs.then((SharedPreferences prefs) {
    //   return prefs.getString('role') ?? '';
    // });

    // SharedPreferences.getInstance().then((prefs) async {
    //   // access the data from SharedPreferences here
    //   final prefsx = await SharedPreferences.getInstance();
    //
    //   username = prefsx.getString('username') ?? 'default_value';
    //   stayloggedintoken =
    //       prefsx.getString('stayloggedintoken') ?? 'default_value';
    //   role = prefsx.getString('role') ?? 'default_value';
    //
    //   checkLogay();
    // });

    localeInitialization();
  }

  final Completer<String> usernameCompleter = Completer<String>();

  Future<void> test() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String? username = prefs.getString('username');
    if (username != null) {
      usernameCompleter.complete(username);
    }
  }

  Future<void> someFunction() async {
    final String username = await usernameCompleter.future;
    // lanjutkan dengan menjalankan fungsi ini
  }

  // Future<void> sharedPreferencesInit() async {
  //   final prefs = await SharedPreferences.getInstance();
  //   username = prefs.getString('username') ?? 'default_value';
  //   stayloggedintoken = prefs.getString('stayloggedintoken') ?? 'default_value';
  //   role = prefs.getString('role') ?? 'default_value';
  //   checkLogay();
  // }

  void localeInitialization() async {
    WidgetsFlutterBinding.ensureInitialized();
    await initializeDateFormatting('id', null);
  }

  void initialization() async {
    await Future.delayed(
      const Duration(milliseconds: 100),
    );
    FlutterNativeSplash.remove();
  }

  Future<bool> checkLogay(username, stayloggedintoken, role) async {
    http.Response response;
    try {
      response = await http.post(
        Uri.parse('http://yntkts.ddns.net:8000/api/mobile_app_token_check'),
        body: {
          'username': username,
          'stayloggedintoken': stayloggedintoken,
        },
      ).timeout(
        const Duration(milliseconds: 3000),
      );
    } catch (e) {
      response = await http.post(
        Uri.parse('http://192.168.3.2:8000/api/mobile_app_token_check'),
        body: {
          'username': username,
          'stayloggedintoken': stayloggedintoken,
        },
      ).timeout(
        const Duration(milliseconds: 3000),
      );
    }
    // print(response.body);
    //
    // print(stayloggedintoken);
    // print(jsonDecode(response.body)['checkToken']);

    if (response.statusCode == 200) {
      if (stayloggedintoken == jsonDecode(response.body)['checkToken']) {
        return true;
      }
    } else {
      throw Exception('Failed to auto login');
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    bool validLogin = false;

    initialization();

    String username = SPHelper.sp.get("username")!;
    String stayloggedintoken = SPHelper.sp.get("stayloggedintoken")!;
    String role = SPHelper.sp.get("role")!;

    print(username + stayloggedintoken + role);

    checkLogay(username, stayloggedintoken, role).then((value) {
      validLogin = value;
    });

    print(validLogin);

    return FutureBuilder(
      future: SharedPreferences.getInstance(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) return const CircularProgressIndicator();
        SharedPreferences? prefs = snapshot.data;
        String username = prefs?.getString('username') ?? '';
        String stayloggedintoken = prefs?.getString('stayloggedintoken') ?? '';
        String role = prefs?.getString('role') ?? '';

        checkLogay(username, stayloggedintoken, role).then((value) {
          print(validLogin);
          validLogin = value;
        });

        return Text("TEST");

        print("P" + validLogin.toString());
      },
    );

    print("P" + validLogin.toString());

    if (validLogin == true) {
      return const MahasiswaScreen();
    }
    return const LoginScreen();

    // if (stayloggedintoken != 'default_value' &&
    //     role != 'default_value' &&
    //     validLogin == true) {
    //   if (role == 'Mahasiswa') {
    //     return const MahasiswaScreen();
    //   } else if (role == 'Dokter') {
    //     return const DokterScreen();
    //   } else if (role == 'Paramedis') {
    //     return const ParamedisScreen();
    //   }
    // }
    // return const LoginScreen();

    // return FutureBuilder<SharedPreferences>(
    //   future: _prefsFuture,
    //   builder: (context, snapshot) {
    //     if (snapshot.connectionState == ConnectionState.waiting) {
    //       return const CircularProgressIndicator();
    //     } else if (snapshot.hasError) {
    //       return Text('Error: ${snapshot.error}');
    //     } else {
    //       final prefs = snapshot.data!;
    //       if (prefs.get('stayloggedintoken') != null &&
    //           prefs.get('role') != null &&
    //           validLogin == true) {
    //         if (prefs.get('role') == 'Mahasiswa') {
    //           return const MahasiswaScreen();
    //         } else if (prefs.get('role') == 'Dokter') {
    //           return const DokterScreen();
    //         } else if (prefs.get('role') == 'Paramedis') {
    //           return const ParamedisScreen();
    //         }
    //       }
    //       return const LoginScreen();
    //     }
    //   },
    // );
  }
}
