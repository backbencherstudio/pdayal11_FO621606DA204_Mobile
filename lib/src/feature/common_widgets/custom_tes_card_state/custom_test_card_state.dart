import 'dart:math';
import 'dart:ui';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final generateRandom = Provider.family<int, int>((ref, index){
  return index % 3;
});

final randomBorderColor = Provider.family<List<Color>, int>((ref, index){
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
  return randomColorPalette[ref.watch(generateRandom(index))];
});

final randomBackgroundColor = Provider.family<List<Color>, int>((ref, index){
  final randomColorPalette = [
    [Color(0xFFEAEDF7), Color(0xFFF0E6F2)],
    [
      Color(0xFFE9EEF6),
      Color(0xFFE6F1E8)
    ], [
      Color(0xFFF7EAEA),
      Color(0xFFFAF6E6)
    ]
  ];
  return randomColorPalette[ref.watch(generateRandom(index))];
});



