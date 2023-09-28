import 'package:flutter/material.dart';
import 'presentation/screens/home_page.dart';

var myColorSchem =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

var myDarkColorSchem =
    ColorScheme.fromSeed(seedColor: const Color.fromARGB(255, 59, 96, 179));

var themeMode = ThemeMode.light;

class ExpensesApp extends StatelessWidget {
  const ExpensesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: themeMode,
      theme: ThemeData().copyWith(
        useMaterial3: true,
        colorScheme: myColorSchem,
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myColorSchem.primary,
          foregroundColor: myColorSchem.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: myColorSchem.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
          backgroundColor: myColorSchem.primaryContainer,
        )),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.normal,
                color: myColorSchem.onSecondaryContainer,
                fontSize: 17,
              ),
            ),
      ),
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: myDarkColorSchem,
        scaffoldBackgroundColor: const Color.fromARGB(244, 8, 12, 77),
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: myDarkColorSchem.primary,
          foregroundColor: myDarkColorSchem.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
            color: myDarkColorSchem.secondaryContainer,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8)),
        elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
                backgroundColor: myDarkColorSchem.onPrimaryContainer,
                foregroundColor: myDarkColorSchem.primaryContainer)),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: myDarkColorSchem.onSecondaryContainer,
                fontSize: 17,
              ),
            ),
        bottomSheetTheme: const BottomSheetThemeData()
            .copyWith(backgroundColor: myDarkColorSchem.onPrimaryContainer),
      ),
      title: 'Expenses App',
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
    );
  }
}
