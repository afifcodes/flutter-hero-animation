import 'package:flutter/material.dart';
import 'package:flutter_hero_animation/screens/detail_screen.dart';
import 'package:flutter_hero_animation/screens/home_screen.dart';
import 'package:flutter_hero_animation/utils/route_animation.dart';
import 'package:flutter_hero_animation/utils/route_arguments.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      onGenerateRoute: ((settings) {
        final arguments = settings.arguments;
        if (settings.name == '/detail') {
          DetailScreenArguments args = arguments as DetailScreenArguments;
          return RouteAnimation.slide(
              settings, DetailScreen(image: args.image));
        } else {
          return RouteAnimation.slide(settings, const HomeScreen());
        }
      }),
    ));
