import 'package:flutter/material.dart';

import 'package:supabase_flutter/supabase_flutter.dart';

import 'core/DI/di.dart';
import 'core/config/env.dart';
import 'core/router.dart';

void main() async{

  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(url: Env.supabaseUrl, anonKey: Env.supabaseKey);
  await configureDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Меню',
      theme: ThemeData.light(),
      routerConfig: router,
    );
  }
}