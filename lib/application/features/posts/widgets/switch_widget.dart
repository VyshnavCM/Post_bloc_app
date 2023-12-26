import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../core/services/theme_service.dart';

class SwitchWidget extends StatelessWidget {
  const SwitchWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Switch(
        activeColor: Colors.green,
        trackOutlineColor: MaterialStateProperty.all(Colors.transparent),
        inactiveThumbColor: Colors.blue[900],
        inactiveTrackColor: Colors.blue[400],
        value: Provider.of<ThemeServiceProvider>(context).isDarkModeOn,
        onChanged: (_) {
          Provider.of<ThemeServiceProvider>(context, listen: false)
              .toggleTheme();
        });
  }
}