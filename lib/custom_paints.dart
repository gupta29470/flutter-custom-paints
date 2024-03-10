import 'dart:ui' as ui;

import 'package:animations/painters/combining_paths.dart';
import 'package:flutter/material.dart';

class HomePainter extends StatefulWidget {
  const HomePainter({super.key});

  @override
  State<HomePainter> createState() => _HomePainterState();
}

class _HomePainterState extends State<HomePainter> {
  final ValueNotifier<ui.Image?> imageNotifier = ValueNotifier<ui.Image?>(null);
  @override
  void initState() {
    super.initState();
    initializeImage();
  }

  Future<void> initializeImage() async {
    NetworkImage networkImage = const NetworkImage(
      "https://media.istockphoto.com/id/1265032285/photo/portrait-of-young-girl-with-clean-skin-and-soft-makeup.jpg?s=612x612&w=0&k=20&c=GcrInK2xkdxcInX0quxPrdFGkv8DXXDPShUia2T1pv4=",
    );

    ImageStream imageStream = networkImage.resolve(ImageConfiguration.empty);

    ImageStreamListener imageStreamListener =
        ImageStreamListener((image, synchronousCall) {
      imageNotifier.value = image.image;
    });

    imageStream.addListener(imageStreamListener);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          height: 600,
          width: 400,
          alignment: Alignment.center,
          color: Colors.grey[500],
          child: CustomPaint(
            painter: CombiningPaths(),
            size: const Size(300, 400),
          ),
          // ValueListenableBuilder(
          //   valueListenable: imageNotifier,
          //   builder: (_, image, __) {
          //     if (image != null) {
          //       return CustomPaint(
          //         painter: LineToMoveToPainter(),
          //         size: const Size(300, 400),
          //       );
          //     }
          //     return const CircularProgressIndicator();
          //   },
          // ),
        ),
      ),
    );
  }
}
