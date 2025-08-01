import 'dart:math';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final generateRandom = Provider<int>((ref){
  final random = Random();
  return random.nextInt(3);
});

final randomBorderColor = Provider<List<Color>>((ref){
  final randomColorPalette = [
    [
      Color(0xFF385DD8),
      Color(0xFF790497)
    ], [
      Color(0xFF3866D8),
      Color(0xFF04971F)
    ], [
      Color(0xFFD83838),
      Color(0xFFFFCC00)
    ]
  ];
  return randomColorPalette[ref.watch(generateRandom)];
});

final randomBackgroundColor = Provider<List<Color>>((ref){
  final randomColorPalette = [
    [
      Color(0xFF385DD8).withValues(alpha: 0.08),
      Color(0xFF790497).withValues(alpha: 0.08),
    ], [
      Color(0xFF3866D8).withValues(alpha: 0.08),
      Color(0xFF04971F).withValues(alpha: 0.08),
    ], [
      Color(0xFFD83838).withValues(alpha: 0.08),
      Color(0xFFFFCC00).withValues(alpha: 0.08),
    ]
  ];
  return randomColorPalette[ref.watch(generateRandom)];
});



