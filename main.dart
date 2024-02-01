import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:twierdza/const/constants.dart';
import 'package:twierdza/firebase_options.dart';
import 'package:twierdza/notifiers/addEventsNotifier.dart';
import 'package:twierdza/notifiers/addMemberNotifier.dart';
import 'package:twierdza/notifiers/contextNotifier.dart';
import 'package:twierdza/notifiers/editEventsNotifier.dart';
import 'package:twierdza/notifiers/eventsNotifier.dart';
import 'package:twierdza/notifiers/exportEventsNotifier.dart';
import 'package:twierdza/notifiers/userNotifier.dart';
import 'package:twierdza/pages/root.dart';
import 'package:twierdza/core/styles/style.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => EventProvider()),
      ChangeNotifierProvider(create: (context) => AddEventProvider()),
      ChangeNotifierProvider(create: (context) => AddMemberProvider()),
      ChangeNotifierProvider(create: (context) => EditEventProvider()),
      ChangeNotifierProvider(create: (context) => ExportEventProvider()),
      ChangeNotifierProvider(create: (context) => UserProvider()),
      ChangeNotifierProvider(create: (context) => ContextProvider()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: kAppName,
      theme: theme(context),
      home: Root(),
    );
  }
}
