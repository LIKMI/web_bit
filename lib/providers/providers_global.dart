import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Theme mode provider
final StateProvider<ThemeMode> themeModeProvider =
    StateProvider<ThemeMode>((ProviderReference ref) {
  return ThemeMode.system;
});
