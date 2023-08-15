import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_examples/provider/auth_provider.dart';
import 'package:provider_examples/provider/count_provider.dart';
import 'package:provider_examples/provider/example_one_provider.dart';
import 'package:provider_examples/provider/favourite_provider.dart';
import 'package:provider_examples/provider/theme_change_provider.dart';
import 'package:provider_examples/screens/count_example.dart';
import 'package:provider_examples/screens/dark_theme.dart';
import 'package:provider_examples/screens/example_one.dart';
import 'package:provider_examples/screens/favourite/favourite_screen.dart';
import 'package:provider_examples/screens/login.dart';
import 'package:provider_examples/screens/value_notify_listner.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    // final themeProvider= Provider.of<ThemeChangeProvider>(context);

    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CountProvider()),
        ChangeNotifierProvider(create: (_) => ExampleOneProvider()),
        ChangeNotifierProvider(create: (_) => FavouriteProvider()),
        ChangeNotifierProvider(create: (_) => ThemeChangeProvider()),
        ChangeNotifierProvider(create: (_) => AuthProvider()),

      ],
      child: Builder(builder: (BuildContext context){
        final themeProvider= Provider.of<ThemeChangeProvider>(context);
        return MaterialApp(
          title: 'Flutter Demo',
          themeMode: themeProvider.themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            primarySwatch: Colors.blue,
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            // primarySwatch: Colors.brown,
            // primaryColor: Colors.deepOrange,
            iconTheme: IconThemeData(
              color: Colors.red,
            ),
            appBarTheme: AppBarTheme(
              backgroundColor: Colors.teal,
            ),
          ),
          home:  LoginScreen(),
        );
      },),
    );
  }
}

