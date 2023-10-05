import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:work_trial/feature/country/presentation/bloc/country_details/country_details_bloc.dart';
import 'package:work_trial/feature/country/presentation/bloc/country_list/country_list_bloc.dart';
import 'package:work_trial/feature/country/presentation/screen/country_list_screen.dart';

import 'common/dependency_injection/injection_container.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DIContainer.initializeDependencies();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator.get<CountryListBloc>()..add(GetCountries()),
        ),
        BlocProvider(
          create: (context) => serviceLocator.get<CountryDetailsBloc>(),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          useMaterial3: true,
          scaffoldBackgroundColor: Colors.white,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
        ),
        home: const CountryListScreen(),
      ),
    );
  }
}
