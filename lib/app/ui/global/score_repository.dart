import 'dart:math';

import 'chart_line.dart';

class ScoreRepository {
  static final rng = Random();
  static const dayCount = 7;

  static List<Score> get scores => List.generate(dayCount, (index) {
        final y = rng.nextDouble() * 30;
        final d = DateTime.now().add(Duration(days: -dayCount + index));
        return Score(
          value: y,
          horas: DateTime.now(),
        );
      });
}
