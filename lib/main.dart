import 'package:bloc_clean_architecture/core/secrets/app_secrets.dart';
import 'package:bloc_clean_architecture/core/theme/theme.dart';
import 'package:bloc_clean_architecture/features/auth/data/datasources/auth_remote_data_source.dart';
import 'package:bloc_clean_architecture/features/auth/data/repositories/auth_repository_impl.dart';
import 'package:bloc_clean_architecture/features/auth/domain/usecases/user_sign_up.dart';
import 'package:bloc_clean_architecture/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:bloc_clean_architecture/features/auth/presentation/pages/login_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final supabase = await Supabase.initialize(
      url: AppSecrets.supabaseUrl, anonKey: AppSecrets.supabaseAnonKey);
  runApp(MultiBlocProvider(
    providers: [
      //EL CASO DE USO DE USERSIGNUP DEL BLOC AUTH PIDE LA IMPLEMENTACION DEL AUTHREPOSITORY LA MISMA PIDE
      //LA IMPLEMENTACION DEL DATASOURCE QUE SOLICITA LA CONEXCION A FIREBASE
      BlocProvider(
          create: (_) => AuthBloc(
              userSignUp: UserSignUp(AuthRepositoryImpl(
                  AuthRemoteDataSourceImpl(supabase.client)))))
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Blog App',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.darkTheme,
      home: const LoginPage(),
    );
  }
}

//AGREGAMOS UN EVENTO A NUESTRO BLOC
//EL BLOC EJECUTA EL CASO DE USO ESPECIFICO
//EL CASO DE USO LLAMA EL REPOSITORIO MEDIANTE INYECCION DE DEPENDECIA
// EL REPOSITORIO LLAMA EL SU IMPLEMENTACION
// SU IMPLEMENTACION LLAMA A LA IMPLEMENTACION DEL DATASOURCE MEDIANTE INYECCION DE DEPENDECIA
// LA IMPLEMENTACION DEL DATASOURCE LLAMA A SU REPOSITORIO
