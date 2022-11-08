part of 'package:cm_project/pages/compassScreen/compass.dart';

class _CompassViewPainter extends CustomPainter {
  _CompassViewPainter({
    required this.heading,
    this.majorTickCount = 12,
    this.minorTickCount = 180,
    this.cardinalities = const {0: 'N', 90: 'E', 180: 'S', 270: 'W'},
  });

  final double heading;

  final int majorTickCount;

  final int minorTickCount;

  final CardinalityMap cardinalities;

  late final bearingIndicatorPaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Color.fromARGB(255, 202, 225, 229)
    ..strokeWidth = 4.0
    ..blendMode = BlendMode.difference;

  late final majorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Color.fromARGB(255, 202, 225, 229)
    ..strokeWidth = 2.0;

  late final minorScalePaint = Paint()
    ..style = PaintingStyle.stroke
    ..color = Color.fromARGB(255, 202, 225, 229).withOpacity(0.7)
    ..strokeWidth = 1.0;

  late final majorScaleStyle = GoogleFonts.ubuntu(
      textStyle: TextStyle(
    color: Color.fromARGB(255, 202, 225, 229),
    fontSize: 15,
  ));

  late final cardinalityStyle = GoogleFonts.ubuntu(
      textStyle: TextStyle(
    color: Color.fromARGB(255, 202, 225, 229),
    fontSize: 32,
  ));

  late final _majorTicks = _layoutScale(majorTickCount);
  late final _minorTicks = _layoutScale(minorTickCount);

  @override
  void paint(Canvas canvas, Size size) {
    assert(size.width == size.height, 'Size must be square');
    const origin = Offset.zero;
    final center = size.center(origin);
    final radius = size.width / 2;

    const tickPadding = 55.0;
    const tickLength = 20.0;

    // paint major scale
    for (final angle in _majorTicks) {
      final tickStart = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - tickPadding,
      );

      final tickEnd = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - tickPadding - tickLength,
      );

      canvas.drawLine(
        center + tickStart,
        center + tickEnd,
        majorScalePaint,
      );
    }

    // paint minor scale
    for (final angle in _minorTicks) {
      final tickStart = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - tickPadding,
      );

      final tickEnd = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - tickPadding - tickLength,
      );

      canvas.drawLine(
        center + tickStart,
        center + tickEnd,
        minorScalePaint,
      );
    }

    // paint major scale text
    for (final angle in _majorTicks) {
      const majorScaleTextPadding = 20.0;

      final textPainter = TextSpan(
        text: angle.toStringAsFixed(0),
        style: majorScaleStyle,
      ).toPainter()
        ..layout();

      final layoutOffset = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - majorScaleTextPadding,
      );

      final offset = center + layoutOffset - textPainter.center;
      textPainter.paint(canvas, offset);
    }

    // paint cardinality text
    for (final cardinality in cardinalities.entries) {
      const majorScaleTextPadding = 100.0;

      final angle = cardinality.key.toDouble();
      final text = cardinality.value;

      final textPainter = TextSpan(
        text: text,
        style: cardinalityStyle,
      ).toPainter()
        ..layout();

      final layoutOffset = Offset.fromDirection(
        _correctedAngle(angle).toRadians(),
        radius - majorScaleTextPadding,
      );

      final offset = center + layoutOffset - textPainter.center;
      textPainter.paint(canvas, offset);
    }
  }

  @override
  bool shouldRepaint(_CompassViewPainter oldDelegate) =>
      oldDelegate.heading != heading ||
      oldDelegate.majorTickCount != majorTickCount ||
      oldDelegate.minorTickCount != minorTickCount;

  List<double> _layoutScale(int ticks) {
    final scale = 360 / ticks;
    return List.generate(ticks, (i) => i * scale);
  }

  double _correctedAngle(double angle) => angle - heading - 90;
}

typedef CardinalityMap = Map<num, String>;

extension on TextPainter {
  Offset get center => size.center(Offset.zero);
}

extension on TextSpan {
  TextPainter toPainter({TextDirection textDirection = TextDirection.ltr}) =>
      TextPainter(text: this, textDirection: textDirection);
}

extension on num {
  double toRadians() => this * pi / 180;
}
