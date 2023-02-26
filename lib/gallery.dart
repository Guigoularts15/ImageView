import 'package:flutter/material.dart';
import 'package:imageview/FullScreenPage.dart';
import 'package:imageview/colors.dart';

class Gallery extends StatefulWidget {
  const Gallery({
    super.key,
  });

  @override
  createState() => _GalleryState();
}

class _GalleryState extends State<Gallery> {
  final photos = [
    "images/photo1.jpg",
    "images/photo2.jpg",
    "images/photo3.jpg",
    "images/photo4.jpg",
    "images/photo5.jpg",
    "images/photo6.jpg",
    "images/photo7.jpg",
    "images/photo8.jpg",
    "images/photo9.jpg",
    "images/photo10.jpg",
    "images/photo11.jpg",
  ];

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      thumbVisibility: true,
      child: Scaffold(
        backgroundColor: MainColors.PRIMARY_COLOR,
        body: Padding(
          padding: const EdgeInsets.all(25),
          child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisSpacing: 10,
                mainAxisSpacing: 50,
                crossAxisCount: 4,
              ),
              itemCount: photos.length,
              itemBuilder: (BuildContext context, int index) {
                return RawMaterialButton(
                  focusColor: MainColors.SECONDARY_COLOR,
                  focusElevation: 0,
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                          pageBuilder: (BuildContext context, _, __) {
                        return FullScreenPage(
                            child: Image.asset(photos[index]));
                      }),
                    );
                  },
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Image.asset(photos[index]),
                  ),
                );
              }),
        ),
      ),
    );
  }
}
