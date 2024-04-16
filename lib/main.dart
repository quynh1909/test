import 'package:ct484_project/screens/screens.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import 'screens/questions/question_manager.dart';
import 'services/question_service.dart';

void main() async {
  await dotenv.load(); // Load file .env before running the app
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context){
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (ctx) => AuthManager(),
        ),
        ChangeNotifierProxyProvider<AuthManager, QuestionManager>(
          create: (ctx) => QuestionManager(QuestionService()),
          update: (ctx, authManager, questionManager){
            questionManager!.authToken = authManager.authToken;
            return questionManager;
          },
        ),
      ],
      child: Consumer<AuthManager>(
        builder: (context, authManager, child) {
          return MaterialApp(
            title: 'Quiz App',
            debugShowCheckedModeBanner: false,
            home: authManager.isAuth ? const SafeArea(child: HomeScreen()) : FutureBuilder(
              future: authManager.tryAutoLogin(),
              builder: (ctx, snapshot) {
                return snapshot.connectionState == ConnectionState.waiting
                  ? const SafeArea(child: SplashScreen())
                  : const SafeArea(child: AuthScreen());
              },
            ),
            routes: {
              '/contact': (context) => ContactScreen(),
            },
          );
        }
      ),
    );
  }
}
