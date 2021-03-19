import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:web_bit/utils/theme_manager.dart';

/// Theme mode provider
final StateProvider<ThemeMode> themeModeProvider =
    StateProvider<ThemeMode>((ProviderReference ref) {
  return currentTheme;
});