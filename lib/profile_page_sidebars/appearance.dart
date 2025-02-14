// import 'package:flutter/material.dart';
// import '../theme/color_picker_selection.dart';
// import '../theme/theme_selector.dart';
//
// class Appearance extends StatefulWidget {
//   final ColorScheme colorScheme;
//   final ThemeMode themeMode;
//   final Function(bool isDarkMode) onThemeChanged;
//   final Function(ColorScheme colorScheme) onColorSchemeChanged;
//
//   const Appearance({
//     Key? key,
//     required this.onThemeChanged,
//     required this.onColorSchemeChanged,
//     required this.colorScheme,
//     required this.themeMode,
//   }) : super(key: key);
//
//   @override
//   _AppearanceState createState() => _AppearanceState();
// }
//
// class _AppearanceState extends State<Appearance> {
//   bool _isDarkMode = false;
//   late ColorScheme _colorScheme;
//
//   @override
//   void initState() {
//     super.initState();
//     _isDarkMode = widget.themeMode == ThemeMode.dark;
//     _colorScheme = widget.colorScheme;
//   }
//
//   void _toggleTheme(bool isDark) {
//     setState(() {
//       _isDarkMode = isDark;
//       _colorScheme = _isDarkMode
//           ? ColorScheme.fromSwatch(brightness: Brightness.dark)
//           : ColorScheme.fromSwatch(brightness: Brightness.light);
//     });
//     widget.onThemeChanged(_isDarkMode);
//     widget.onColorSchemeChanged(_colorScheme);
//   }
//
//   void _updateColorScheme(ColorScheme newScheme) {
//     setState(() {
//       _colorScheme = newScheme;
//     });
//     widget.onColorSchemeChanged(_colorScheme);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Theme(
//       data: ThemeData.from(
//         colorScheme: _colorScheme,
//         useMaterial3: true,
//       ),
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'Appearance Settings',
//             style: TextStyle(
//                 color: widget.colorScheme.primary
//             ),
//           ),
//           leading: IconButton(
//             icon: const Icon(Icons.arrow_back),
//             onPressed: () => Navigator.pop(context),
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ThemeSelector(
//                 isDarkMode: _isDarkMode,
//                 onThemeSelected: _toggleTheme,
//                 colorScheme: widget.colorScheme,
//               ),
//               const SizedBox(height: 20),
//               // ColorPickerSection(
//               //   colorScheme: _colorScheme,
//               //   onColorSchemeChanged: _updateColorScheme,
//               // ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../theme/color_picker_selection.dart';
import '../theme/theme_selector.dart';

class Appearance extends StatefulWidget {
  final ColorScheme colorScheme;
  final ThemeMode themeMode;
  final Function(bool isDarkMode) onThemeChanged;
  final Function(ColorScheme colorScheme) onColorSchemeChanged;

  const Appearance({
    Key? key,
    required this.onThemeChanged,
    required this.onColorSchemeChanged,
    required this.colorScheme,
    required this.themeMode,
  }) : super(key: key);

  @override
  _AppearanceState createState() => _AppearanceState();
}

class _AppearanceState extends State<Appearance> {
  bool _isDarkMode = false;
  late ColorScheme _colorScheme;

  @override
  void initState() {
    super.initState();
    _isDarkMode = widget.themeMode == ThemeMode.dark;
    _colorScheme = widget.colorScheme;
  }

  void _toggleTheme(bool isDark) {
    setState(() {
      _isDarkMode = isDark;
      _colorScheme = _isDarkMode
          ? ColorScheme.fromSwatch(brightness: Brightness.dark)
          : ColorScheme.fromSwatch(brightness: Brightness.light);
    });
    widget.onThemeChanged(_isDarkMode);
    widget.onColorSchemeChanged(_colorScheme);
  }

  void _updateColorScheme(ColorScheme newScheme) {
    setState(() {
      _colorScheme = newScheme;
    });
    widget.onColorSchemeChanged(_colorScheme);
  }

  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: CupertinoThemeData(
        primaryColor: _colorScheme.primary,
        brightness: _isDarkMode ? Brightness.dark : Brightness.light,
      ),
      home: CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text(
            'Appearance Settings',
              style: TextStyle(color: widget.colorScheme.primary,fontSize: 22),
          ),
          leading: CupertinoButton(
            padding: EdgeInsets.zero,
            child:  Icon(
              CupertinoIcons.back,
              color: _isDarkMode ? CupertinoColors.white : CupertinoColors.black, // Dark mode icon color
              size: 32, // Set the size to make it larger
            ),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                ThemeSelector(
                  isDarkMode: _isDarkMode,
                  onThemeSelected: _toggleTheme,
                  colorScheme: widget.colorScheme,
                ),
                const SizedBox(height: 20),
                // ColorPickerSection(
                //   colorScheme: _colorScheme,
                //   onColorSchemeChanged: _updateColorScheme,
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
