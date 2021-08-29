import 'package:flutter/material.dart';
import 'package:influencrot_flutter/constants.dart';
import 'package:provider/provider.dart';
import 'package:influencrot_flutter/models/userModel.dart';
import 'package:influencrot_flutter/screens/Auth/welcome/welcome.dart';
import 'screens/Auth/login/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final mainPage = WelcomePage();
  runApp(
    MyApp(mainPage),
  );
}

class MyApp extends StatelessWidget {
  final Widget mainPage;
  MyApp(this.mainPage);
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => UserModel(),
        ),
      ],
      child: MaterialApp(
        title: 'Fluens.id',
        theme: ThemeData(
          fontFamily: 'Montserrat',
          primaryColor: colorPrimary,
          accentColor: colorSecondary,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: mainPage,
        routes: {
          '/login': (context) => Login(),
        },
      ),
    );
  }
}
