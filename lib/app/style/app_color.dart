import 'package:flutter/material.dart';

class AppColor {
  static const Color primary = Color(0xFFA5E8BC); // Warna latar belakang utama
  static const Color primaryDark = Color(0xFF1E88E5); // Warna biru untuk tombol
  static const Color secondarySoft = Color(0xFF9E9E9E); // Warna teks soft
  static const Color secondaryExtraSoft = Color(0xFFE0E0E0); // Border
  static Color error = const Color(0xFFD00E0E);
  static Color success = const Color(0xFF16AE26);
  static Color warning = const Color(0xFFEB8600);

  static const LinearGradient primaryGradient = LinearGradient(
    colors: [Color(0xFF4CAF50), Color(0xFF8BC34A)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}
