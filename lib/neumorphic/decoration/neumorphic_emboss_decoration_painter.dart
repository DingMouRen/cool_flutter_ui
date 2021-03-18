import 'dart:ui';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

import '../neumorphic_box_shape.dart';
import '../theme/theme.dart';
import 'cache/neumorphic_emboss_painter_cache.dart';

export '../theme/theme.dart';

class NeumorphicEmbossDecorationPainter extends BoxPainter {
  NeumorphicEmbossPainterCache _cache;

  final NeumorphicStyle style;
  final NeumorphicBoxShape shape;

  late Paint _backgroundPaint;
  late Paint _whiteShadowPaint;
  late Paint _whiteShadowMaskPaint;
  late Paint _blackShadowPaint;
  late Paint _blackShadowMaskPaint;
  late Paint _borderPaint;

  final bool drawShadow;
  final bool drawBackground;

  NeumorphicEmbossDecorationPainter(
      {required this.style,
      required this.drawBackground,
      required this.drawShadow,
      required VoidCallback onChanged,
      NeumorphicBoxShape? shape})
      : this.shape = shape ?? NeumorphicBoxShape.rect(),
        _cache = NeumorphicEmbossPainterCache(),
        super(onChanged) {
    _generatePainters();
  }

  void _generatePainters() {
    this._backgroundPaint = Paint();
    this._whiteShadowPaint = Paint();
    this._whiteShadowMaskPaint = Paint()..blendMode = BlendMode.dstOut;
    this._blackShadowPaint = Paint();
    this._blackShadowMaskPaint = Paint()..blendMode = BlendMode.dstOut;

    this._borderPaint = Paint()
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.bevel
      ..style = PaintingStyle.stroke;
  }

  void _updateCache(
      {required Offset offset,
      required ImageConfiguration configuration,
      required NeumorphicStyle newStyle}) {
    bool invalidateSize = false;
    if (configuration.size != null) {
      invalidateSize = this
          ._cache
          .updateSize(newOffset: offset, newSize: configuration.size!);
      if (invalidateSize) {
        _cache.updatePath(
            newPath:
                shape.customShapePathProvider.getPath(configuration.size!));
      }
    }

    bool invalidateLightSource = false;
    invalidateLightSource = this
        ._cache
        .updateLightSource(style.lightSource, style.oppositeShadowLightSource);

    bool invalidateColor = false;
    if (style.color != null) {
      invalidateColor = this._cache.updateStyleColor(style.color!);
      if (invalidateColor) {
        _backgroundPaint..color = _cache.backgroundColor;
      }
    }
    bool invalidateDepth = false;
    if (style.depth != null) {
      invalidateDepth = this._cache.updateStyleDepth(style.depth!, 5);
      if (invalidateDepth) {
        _blackShadowMaskPaint..maskFilter = _cache.maskFilterBlur;
        _whiteShadowMaskPaint..maskFilter = _cache.maskFilterBlur;
      }
    }

    final bool invalidateShadowColors = this._cache.updateShadowColor(
          newShadowLightColorEmboss:
              style.shadowLightColorEmboss ?? Color(0xFFFFFFFF),
          newShadowDarkColorEmboss:
              style.shadowDarkColorEmboss ?? Color(0xFF000000),
          newIntensity: style.intensity ?? 0.25,
        );
    if (invalidateShadowColors) {
      if (_cache.shadowLightColor != null) {
        _whiteShadowPaint..color = _cache.shadowLightColor!;
      }
      if (_cache.shadowDarkColor != null) {
        _blackShadowPaint..color = _cache.shadowDarkColor!;
      }
    }

    if (invalidateLightSource || invalidateDepth || invalidateSize) {
      _cache.updateTranslations();
    }
  }

  void _paintBackground(Canvas canvas, Path path) {
    canvas
      ..save()
      ..translate(_cache.originOffset.dx, _cache.originOffset.dy)
      ..drawPath(path, _backgroundPaint)
      ..restore();
  }

  void _drawBorder(
      {required Canvas canvas, required Offset offset, required Path path}) {
    if (style.border.width != null && style.border.width! > 0) {
      canvas
        ..save()
        ..translate(offset.dx, offset.dy)
        ..drawPath(
            path,
            _borderPaint
              ..color = style.border.color ?? Color(0x00000000)
              ..strokeWidth = style.border.width ?? 0)
        ..restore();
    }
  }

  void _paintShadows(Canvas canvas, Path path) {
    final Matrix4 matrix4 = Matrix4.identity()
      ..scale(_cache.scaleX, _cache.scaleY);

    canvas
      ..saveLayer(_cache.layerRect, _whiteShadowPaint)
      ..translate(_cache.originOffset.dx, _cache.originOffset.dy)
      ..drawPath(path, _whiteShadowPaint)
      ..translate(
          _cache.witheShadowLeftTranslation, _cache.witheShadowTopTranslation)
      ..drawPath(path.transform(matrix4.storage), _whiteShadowMaskPaint)
      ..restore();

    canvas
      ..saveLayer(_cache.layerRect, _blackShadowPaint)
      ..translate(_cache.originOffset.dx, _cache.originOffset.dy)
      ..drawPath(path, _blackShadowPaint)
      ..translate(
          _cache.blackShadowLeftTranslation, _cache.blackShadowTopTranslation)
      ..drawPath(path.transform(matrix4.storage), _blackShadowMaskPaint)
      ..restore();
  }

  @override
  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    _updateCache(
        offset: offset, configuration: configuration, newStyle: this.style);
    for (var subPath in _cache.subPaths) {
      if (drawBackground) {
        _paintBackground(canvas, subPath);
      }

      if (style.border.isEnabled) {
        _drawBorder(canvas: canvas, offset: offset, path: subPath);
      }

      if (drawShadow) {
        _paintShadows(canvas, subPath);
      }
    }
  }
}
