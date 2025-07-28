import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:menu2/core/DI/di.config.dart';
import 'package:supabase_flutter/supabase_flutter.dart';


final getIt = GetIt.instance;

@InjectableInit()
Future<void> configureDependencies() async => getIt.init();

@module
abstract class InfoModule {
  /// Реєструє SupabaseClient
  @lazySingleton
  SupabaseClient get supabaseClient => Supabase.instance.client;


}