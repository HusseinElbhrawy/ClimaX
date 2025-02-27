import 'package:climax/config/theme/theme_provider.dart';
import 'package:flutter/material.dart';

import 'app/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await ThemeManager.loadTheme();
  runApp(MyApp());
}
