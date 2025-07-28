import 'package:flutter/material.dart';

class AppTextSizes {
  static const double title = 46;
  static const double bid = 24;
  static const double large = 20;
  static const double medium = 16;
  static const double small = 12;
}

class AppPadding {
  static const all16 = EdgeInsets.all(16);
  static const all12 = EdgeInsets.all(16);
  static const all8 = EdgeInsets.all(8);
  static const horizontal16 = EdgeInsets.symmetric(horizontal: 16);
  static const vertical8 = EdgeInsets.symmetric(vertical: 8);
  static const onlyTop16 = EdgeInsets.only(top: 16);
  static const onlyRight20 = EdgeInsets.only(right: 20);
  static const hor16ver8 = EdgeInsets.symmetric(horizontal: 16, vertical: 8);
}

class AppGaps {
  // Vertical gaps (height)
  static const gap2 = SizedBox(height: 2);
  static const gap4 = SizedBox(height: 4);
  static const gap8 = SizedBox(height: 8);
  static const gap12 = SizedBox(height: 12);
  static const gap16 = SizedBox(height: 16);
  static const gap24 = SizedBox(height: 24);
  static const gap32 = SizedBox(height: 32);
  static const gap48 = SizedBox(height: 48);
  static const gap64 = SizedBox(height: 64);

  // Horizontal gaps (width)
  static const w2 = SizedBox(width: 2);
  static const w4 = SizedBox(width: 4);
  static const w8 = SizedBox(width: 8);
  static const w12 = SizedBox(width: 12);
  static const w16 = SizedBox(width: 16);
  static const w24 = SizedBox(width: 24);
  static const w32 = SizedBox(width: 32);
  static const w48 = SizedBox(width: 48);
  static const w64 = SizedBox(width: 64);
}

class AppBorderRadius {
  static const all4 = BorderRadius.all(Radius.circular(4));
  static const all8 = BorderRadius.all(Radius.circular(8));
  static const all12 = BorderRadius.all(Radius.circular(12));
  static const all16 = BorderRadius.all(Radius.circular(16));
  static const all20 = BorderRadius.all(Radius.circular(20));
  static const all24 = BorderRadius.all(Radius.circular(24));
  static const all32 = BorderRadius.all(Radius.circular(32));
  static const all48 = BorderRadius.all(Radius.circular(48));

  // Якщо треба заокруглення тільки певних кутів
  static const top16 = BorderRadius.vertical(top: Radius.circular(16));
  static const bottom16 = BorderRadius.vertical(bottom: Radius.circular(16));
  static const top16bot16 = BorderRadius.only(
    topLeft: Radius.circular(16),
    bottomLeft: Radius.circular(16),
  );

  static const onlyTopLeft12 = BorderRadius.only(topLeft: Radius.circular(12));

  static const onlyBottomRight16 = BorderRadius.only(
    bottomRight: Radius.circular(16),
  );
}
