import 'package:bloc_change_text/core/enums.dart';
import 'package:bloc_change_text/infrastructure/app_theme.dart';
import 'package:bloc_change_text/infrastructure/routers.dart';
import 'package:bloc_change_text/root_screen.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

import 'application/bloc_exports.dart';

void main() async {
  /// calling this widget binding is because that [Hydrated BLoC]
  /// has to communicate with native code, and to ensure
  /// that we do this seamlessly, we check that everything is natively initialized.
  WidgetsFlutterBinding.ensureInitialized();

  // the build function of hydrated is using to create a storage for this app
  // this function also check if there is existing data, and restore it and emit all
  // the state. and the data is storing with uses of Hive
  final storage = await HydratedStorage.build(
    // this parameter
    storageDirectory: await getApplicationDocumentsDirectory(),
  );
  // after all these processes need to run the app in a safe way.
  // that's what this runZoned function do
  HydratedBlocOverrides.runZoned(
    () => runApp(
      MyApp(
        routers: AppRouters(),
      ),
    ),
    storage: storage,
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key, required this.routers}) : super(key: key);
  final AppRouters routers;
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => TaskBloc()),
        BlocProvider(create: (context) => SwitchBloc()),
      ],
      child: BlocBuilder<SwitchBloc, SwitchState>(
        builder: (context, state) {
          return MaterialApp(
            
            debugShowCheckedModeBanner: false,
            title: 'Todo',
            theme: state.switchValue
                ? AppThemes.appThemeData[AppTheme.darkTheme]
                : AppThemes.appThemeData[AppTheme.lightTheme],
                
            home: const RootScreen(),
            onGenerateRoute: routers.onGenerateRoute,
          );
        },
      ),
    );
  }
}
