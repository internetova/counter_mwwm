import 'package:counter_mwwm/repository/local_repository.dart';
import 'package:counter_mwwm/ui/screen/counter/counter_screen_route.dart';
import 'package:counter_mwwm/ui/screen/res/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'interactor/counter_interactor.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider<LocalRepository>(
          create: (_) => LocalRepository(),
        ),
        ProxyProvider<LocalRepository, CounterInteractor>(
          update: (context, repo, interactor) => CounterInteractor(repo),
        ),
      ],
      child: MaterialApp(
        title: AppStrings.appTitle,
        theme: ThemeData(
          primarySwatch: Colors.teal,
        ),
        onGenerateRoute: (_) => CounterScreenRoute(),
      ),
    );
  }
}
