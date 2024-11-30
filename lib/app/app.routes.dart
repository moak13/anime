import 'dart:io';

import 'package:anime/ui/views/anime_preview/anime_preview_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AppRoutes {
  static const String animePreviewView = '/';

  static Route onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case animePreviewView:
        return _buildAdaptiveRoute(settings, const AnimePreviewView());
      default:
        return _buildAdaptiveRoute(settings, const AnimePreviewView());
    }
  }

  static Route _buildAdaptiveRoute(
    RouteSettings settings,
    Widget screen, {
    bool fullscreenDialog = false,
  }) {
    final isIOS = Platform.isIOS;

    if (isIOS) {
      return CupertinoPageRoute(
        settings: settings,
        builder: (context) => screen,
        fullscreenDialog: fullscreenDialog,
      );
    } else {
      return MaterialPageRoute(
        settings: settings,
        builder: (context) => screen,
        fullscreenDialog: fullscreenDialog,
      );
    }
  }
}
