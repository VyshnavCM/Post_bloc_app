

import 'package:api_handling_uisng_bloc/application/core/services/theme_service.dart';
import 'package:api_handling_uisng_bloc/application/features/posts/post_page.dart';
import 'package:api_handling_uisng_bloc/theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => ThemeServiceProvider(),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeServiceProvider>(
      builder: (context, themeService, child) {
      return MaterialApp(
        debugShowCheckedModeBanner: false,
        themeMode: themeService.isDarkModeOn? ThemeMode.dark:ThemeMode.light,
        title: 'Flutter Demo',
        theme: AppTheme.lightTheme,
        darkTheme: AppTheme.darkTheme,
        home:const PostWrapper(),
        
      );
    });
  }
}

