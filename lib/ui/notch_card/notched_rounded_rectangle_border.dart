import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NotchedRoundedRectangleBorder extends BorderDirectional {
  /// Creates a notched rounded rectangle border.
  ///
  /// The arguments must not be null.
  const NotchedRoundedRectangleBorder({
    this.top = BorderSide.none,
    this.start = BorderSide.none,
    this.end = BorderSide.none,
    this.bottom = BorderSide.none,
    this.borderRadius = BorderRadius.zero,
  })  : assert(top != null),
        assert(start != null),
        assert(end != null),
        assert(bottom != null),
        assert(borderRadius != null);

  /// The top side of this border.
  final BorderSide top;

  /// The start side of this border.
  ///
  /// This is the side on the left in left-to-right text and on the right in
  /// right-to-left text.
  ///
  /// See also:
  ///
  ///  * [TextDirection], which is used to describe the reading direction.
  final BorderSide start;

  /// The end side of this border.
  ///
  /// This is the side on the right in left-to-right text and on the left in
  /// right-to-left text.
  ///
  /// See also:
  ///
  ///  * [TextDirection], which is used to describe the reading direction.
  final BorderSide end;

  /// The bottom side of this border.
  final BorderSide bottom;

  /// The radii for each corner.
  final BorderRadiusGeometry borderRadius;

  @override
  EdgeInsetsGeometry get dimensions {
    return EdgeInsetsDirectional.fromSTEB(
        start.width, top.width, end.width, bottom.width);
  }

  @override
  Path getOuterPath(Rect rect, {TextDirection textDirection}) {
//    return Path()..addRRect(borderRadius.resolve(textDirection).toRRect(rect));

    final tlRadiusX = borderRadius.resolve(textDirection).topLeft.x;
    final tlRadiusY = borderRadius.resolve(textDirection).topLeft.y;
    final trRadiusX = borderRadius.resolve(textDirection).topRight.x;
    final trRadiusY = borderRadius.resolve(textDirection).topRight.y;
    final blRadiusX = borderRadius.resolve(textDirection).bottomLeft.x;
    final blRadiusY = borderRadius.resolve(textDirection).bottomLeft.y;
    final brRadiusX = borderRadius.resolve(textDirection).bottomRight.x;
    final brRadiusY = borderRadius.resolve(textDirection).bottomRight.y;
    final notchLeftRadiusX = tlRadiusX;
    final notchLeftRadiusY = tlRadiusY;
    final notchRightRadiusX = trRadiusX;
    final notchRightRadiusY = trRadiusY;
    final notchWidth = 100.0;
    final notchHeight = 100.0;
    final topLeftWidth = (rect.width -
            tlRadiusX -
            notchLeftRadiusX -
            notchWidth -
            notchRightRadiusX -
            trRadiusX) /
        2;
    final topRightWidth = (rect.width -
            tlRadiusX -
            notchLeftRadiusX -
            notchWidth -
            notchRightRadiusX -
            trRadiusX) /
        2;
    final bottomWidth = rect.width - blRadiusX - brRadiusX;
    final leftHeigth = rect.height - tlRadiusY - blRadiusY;
    final rightHeigth = rect.height - trRadiusY - brRadiusY;

    const double _topPadding = 20.0;
    const double _arcRadius = 8.0;
    Size size = rect.size;
    double point = size.width / 3 * 2;
    final path = Path()
      ..moveTo(0.0, _topPadding)
      ..lineTo(point, _topPadding)
      ..lineTo(point, _arcRadius)
      ..lineTo(point + _arcRadius, 0.0)
      ..lineTo(size.width - _arcRadius, 0.0)
      ..lineTo(size.width, _arcRadius)
      ..lineTo(size.width, size.height)
      ..lineTo(0.0, size.height)
      ..lineTo(0.0, _topPadding)
      ..addOval(
          Rect.fromLTRB(point, 0.0, point + 2 * _arcRadius, 2 * _arcRadius))
      ..addOval(Rect.fromLTRB(
          size.width - 2 * _arcRadius, 0.0, size.width, 2 * _arcRadius));

    path.close();
    return path;

//    return Path()
//      ..moveTo(rect.topLeft.dx, rect.topLeft.dy)
//      ..lineTo(rect.topRight.dx, rect.topRight.dy)
//      ..lineTo(rect.bottomRight.dx, rect.bottomRight.dy)
//      ..lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
//      ..lineTo(rect.topLeft.dx, rect.topLeft.dy);

    var ctrl1 = FractionalOffset(0.35, 0.75).withinRect(rect);
    var end1 = FractionalOffset(0.65, 0.85).withinRect(rect);
    var ctrl2 = FractionalOffset(0.85, 0.90).withinRect(rect);
    var end2 = FractionalOffset(1.0, 0.75).withinRect(rect);
    return Path()
      ..moveTo(rect.topLeft.dx, rect.topLeft.dy)
      ..lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy)
      ..quadraticBezierTo(ctrl1.dx, ctrl1.dy, end1.dx, end1.dy)
      ..quadraticBezierTo(ctrl2.dx, ctrl2.dy, end2.dx, end2.dy)
      ..lineTo(rect.topRight.dx, rect.topRight.dy)
      ..close();

    return Path()
      ..moveTo(rect.topLeft.dx + tlRadiusX, rect.topRight.dy)
      ..lineTo(rect.topRight.dx - trRadiusX, rect.topRight.dy)
      ..lineTo(rect.topRight.dx, rect.topRight.dy + trRadiusY)
      ..lineTo(rect.bottomRight.dx, rect.bottomRight.dy - brRadiusY)
      ..lineTo(rect.bottomRight.dx - brRadiusX, rect.bottomRight.dy)
      ..lineTo(rect.bottomLeft.dx + blRadiusX, rect.bottomLeft.dy)
      ..lineTo(rect.bottomLeft.dx, rect.bottomLeft.dy - blRadiusY)
      ..lineTo(rect.topLeft.dx, rect.topLeft.dy + tlRadiusY)
      ..lineTo(rect.topLeft.dx + tlRadiusX, rect.topLeft.dy);

    return Path()
      ..moveTo(tlRadiusX, 0.0)
      ..relativeLineTo(topLeftWidth, 0.0)
      ..relativeArcToPoint(Offset(notchLeftRadiusX, notchLeftRadiusY))
      ..relativeArcToPoint(Offset(notchWidth / 2, notchHeight),
          clockwise: false)
      ..relativeArcToPoint(Offset(notchWidth / 2, -notchHeight),
          clockwise: false)
      ..relativeArcToPoint(Offset(notchLeftRadiusX, -notchLeftRadiusY))
      ..relativeLineTo(topRightWidth, 0.0)
      ..lineTo(rect.width, rect.height)
      ..lineTo(0.0, rect.height)
      ..lineTo(0.0, 0.0)
      ..relativeArcToPoint(Offset(tlRadiusX, -tlRadiusY));
  }

  @override
  bool operator ==(Object other) {
    if (other.runtimeType != runtimeType) return false;
    return other is NotchedRoundedRectangleBorder &&
        other.top == top &&
        other.start == start &&
        other.end == end &&
        other.bottom == bottom &&
        other.borderRadius == borderRadius;
  }

  @override
  int get hashCode => hashValues(top, start, end, bottom, borderRadius);

  @override
  String toString() {
    return '${objectRuntimeType(this, 'NotchedRoundedRectangleBorder')}( $top, $start, $end, $bottom, $borderRadius )';
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;

  Path get _rawPath {
    Path path = Path();
    final double _xScaling = 1; //size.width / 220;
    final double _yScaling = 1; //size.height / 380;
    path.lineTo(204 * _xScaling, 0 * _yScaling);
    path.cubicTo(
      212.836556 * _xScaling,
      0 * _yScaling,
      220 * _xScaling,
      7.163444 * _yScaling,
      220 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      220 * _xScaling,
      16 * _yScaling,
      220 * _xScaling,
      364 * _yScaling,
      220 * _xScaling,
      364 * _yScaling,
    );
    path.cubicTo(
      220 * _xScaling,
      372.836556 * _yScaling,
      212.836556 * _xScaling,
      380 * _yScaling,
      204 * _xScaling,
      380 * _yScaling,
    );
    path.cubicTo(
      204 * _xScaling,
      380 * _yScaling,
      16 * _xScaling,
      380 * _yScaling,
      16 * _xScaling,
      380 * _yScaling,
    );
    path.cubicTo(
      7.163444 * _xScaling,
      380 * _yScaling,
      0 * _xScaling,
      372.836556 * _yScaling,
      0 * _xScaling,
      364 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      364 * _yScaling,
      0 * _xScaling,
      16 * _yScaling,
      0 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      0 * _xScaling,
      7.163444 * _yScaling,
      7.163444 * _xScaling,
      0 * _yScaling,
      16 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      16 * _xScaling,
      0 * _yScaling,
      34 * _xScaling,
      0 * _yScaling,
      34 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      42.836556 * _xScaling,
      -1.623249e-15 * _yScaling,
      50 * _xScaling,
      7.163444 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
      50 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      50 * _xScaling,
      49.137085 * _yScaling,
      76.862915 * _xScaling,
      76 * _yScaling,
      110 * _xScaling,
      76 * _yScaling,
    );
    path.cubicTo(
      143.137085 * _xScaling,
      76 * _yScaling,
      170 * _xScaling,
      49.137085 * _yScaling,
      170 * _xScaling,
      16 * _yScaling,
    );
    path.cubicTo(
      170 * _xScaling,
      7.163444 * _yScaling,
      177.163444 * _xScaling,
      1.623249e-15 * _yScaling,
      186 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      186 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
    );
    path.cubicTo(
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
      204 * _xScaling,
      0 * _yScaling,
    );
    return path;
  }
}
