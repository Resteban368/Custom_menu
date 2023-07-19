// ignore_for_file: unused_element

import 'package:custom_menu/blocs/dropdownItem/dropdown_item_bloc.dart';
import 'package:custom_menu/screens/game_scrren.dart';
import 'package:custom_menu/screens/messages_scrren.dart';
import 'package:custom_menu/screens/projects_screen.dart';
import 'package:custom_menu/screens/settings_scree.dart';
import 'package:custom_menu/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      title: 'Smooth expansion tile',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const _HomeScreen(),
        '/projects' : (context) => const ProjectsScreen(),
        '/messages': (context) => const MessagesScreen(),
        '/game': (context) => const  GameScreen(),
        '/settings': (context) => const SettingsScreen(),
      },
      //tema dark
      theme: ThemeData(
        brightness: Brightness.dark,
        primarySwatch: Colors.blue,
      ),
    );
  }
}

class _HomeScreen extends StatelessWidget {
  const _HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        child: Align(
          alignment: Alignment.center,
          child: BlocProvider(
            create: (context) => DropdownItemBloc(),
            child: WDropdown(),
          ),
        ),
      ),
    );
  }
}
