// Copyright 2021, LTMM LLC
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:theme_manager/theme_manager.dart';

import 'constants.dart' as K;

ThemeData get darkTheme {
  return ThemeData(
      primaryColor: K.lightGrey,
      scaffoldBackgroundColor: Colors.black,
      textTheme: ThemeData.dark().textTheme,
      buttonTheme: ButtonThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(18.0)),
        buttonColor: K.lightPurple,
      ));
}

ThemeColors themeColors = ThemeColors(dark: Colors.red[900]!, light: Colors.greenAccent);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  ThemeManager.addThemeColors(themeColors, forKey: 'Alert');
  await ThemeManager.setup();
  runApp(SetUpWidget());
}

class SetUpWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MyApp();
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ThemeCubit, ThemeCubitState>(
      bloc: ThemeManager.themeCubit,
      builder: (_, state) {
        ThemeMode themeMode = ThemeManager.themeMode;
        if (state is UpdateThemeMode) {
          themeMode = state.themeMode;
        }
        return MaterialApp(
          title: 'Flutter Demo',
          theme: ThemeManager.lightTheme,
          darkTheme: ThemeManager.darkTheme,
          themeMode: themeMode,
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        );
      },
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ThemeIcons _themeIcons = ThemeManager.themeIcons;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20, top: 12),
            child: GestureDetector(
              onTap: () => SetThemeDialog.show(context: context),
              child: ThemeManager.themeModeIcon(context),
            ),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'I Use Custom Colors',
              style: TextStyle(fontSize: 20, color: ThemeManager.color('alert', context: context)),
            ),
            Text(
              'Text without context',
              style: Theme.of(context).textTheme.headline4,
            ),
            Test(),
            Row(
              children: [
                _themeIcons.applicationDark,
                _themeIcons.applicationLight,
                _themeIcons.platformDark,
                _themeIcons.platformLight,
              ],
            ),
          ],
        ),
      ),
      floatingActionButton: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [],
      ),
    );
  }
}

class Test extends StatefulWidget {
  @override
  _Test createState() => _Test();
}

class _Test extends State<Test> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        child: Text('SYSTEM', style: TextStyle(fontSize: 56.0)),
        onTap: () {
          ThemeManager.themeMode = ThemeMode.system;
        });
  }
}
