import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hero_animation/utils/route_arguments.dart';
import 'package:flutter_hero_animation/utils/system_ui.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> images = [
    'luis-felipe-lins-LG88A2XgIXY-unsplash.jpg',
    'mojtaba-fahiminia-t4g1gctAaKk-unsplash.jpg',
    'mojtaba-mosayebzadeh-CFYS5qMSuKo-unsplash.jpg',
    'andres-jasso-PqbL_mxmaUE-unsplash.jpg',
    'ryan-plomp-jvoZ-Aux9aw-unsplash.jpg',
  ];

  //
  // @afifcodes
  // afifcodes.vercel.app/flutter
  //

  @override
  Widget build(BuildContext context) {
    systemUi();
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(
              Icons.menu,
              color: Colors.grey[900],
            ),
            onPressed: () {},
          ),
        ),
        body: ListView(
          clipBehavior: Clip.none,
          physics: const BouncingScrollPhysics(),
          padding:
              const EdgeInsets.only(top: 12, bottom: 24, left: 24, right: 24),
          children: [
            Text(
              'Shoes Gallery',
              style:
                  GoogleFonts.inter(fontSize: 36, fontWeight: FontWeight.w700),
            ),
            const SizedBox(
              height: 24,
            ),
            ...images.map((img) {
              return Container(
                margin: const EdgeInsets.only(bottom: 24),
                child: Center(
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, '/detail',
                            arguments: DetailScreenArguments(img));
                      },
                      child: Hero(
                        tag: img,
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(24),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 12,
                                    spreadRadius: 0,
                                    offset: Offset(0, 2))
                              ],
                              image: DecorationImage(
                                  image: AssetImage('assets/images/$img'),
                                  fit: BoxFit.cover)),
                        ),
                      ),
                    ),
                  ),
                ),
              );
            }).toList()
          ],
        ));
  }
}
