import 'package:flutter/material.dart';
import 'package:scrumboard/src/shared/providers/theme.dart';

import 'components/app_theme.dart';
import 'components/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const App());
}

/// We are using a StatefulWidget such that we only create the [Future] once,
/// no matter how many times our widget rebuild.
/// If we used a [StatelessWidget], in the event where [App] is rebuilt, that
/// would re-initialize FlutterFire and make our application re-enter loading state,
/// which is undesired.
class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  final settings = ValueNotifier(ThemeSettings(
    sourceColor: Colors.pink,
    themeMode: ThemeMode.system,
  ));
  @override
  Widget build(BuildContext context) {
    // return Container(child: DynamicColorBuilder(
    //    builder: (lightDynamic, darkDynamic) => ThemeProvider(
    //        lightDynamic: lightDynamic,
    //        darkDynamic: darkDynamic,
    //        settings: settings,
    //        child: NotificationListener<ThemeSettingChange>(
    //          onNotification: (notification) {
    //            settings.value = notification.settings;
    //            return true;
    //          },
    //          child: ValueListenableBuilder<ThemeSettings>(
    //            valueListenable: settings,
    //            builder: (context, value, _) {
    //              final theme = ThemeProvider.of(context); // Add this line
    //              return MaterialApp.router(
    //                debugShowCheckedModeBanner: false,
    //                title: 'Flutter Demo',
    //                theme: theme.light(settings.value.sourceColor), // Add this line
    //                routeInformationParser: appRouter.routeInformationParser,
    //                routerDelegate: appRouter.routerDelegate,
    //              );
    //            },
    //          ),
    //        )),,)
    return FutureBuilder(
      // Initialize FlutterFire:
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return const Text('error');
        }

        return MaterialApp(
          routes: appRoutes,
          theme: appTheme,
        );
      },
    );
  }
}
