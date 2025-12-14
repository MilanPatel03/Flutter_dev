import 'package:flutter/material.dart';

import '../Home/homepage/homePage.dart';
import '../NewsWebViews/BBCwebView/BBCwebViewHome.dart';
import '../NewsWebViews/BUZZFEEDwebView/BuzzFeedWebViewHome.dart';
import '../NewsWebViews/CNNwebView/CNNwebViewHome.dart';
import '../NewsWebViews/FOCUS_WIREwebView/FocusWireWebViewHome.dart';
import '../NewsWebViews/NBCwebView/NBCwebViewHome.dart';
import '../NewsWebViews/REUTERSwebView/ReutersWebViewHome.dart';
import '../NewsWebViews/SKIFTwebView/SkiftWebViewHome.dart';
import '../NewsWebViews/THE_GUARDIANwebView/The_GuardianWebViewHome.dart';
import '../NewsWebViews/THE_INDEPENDENTwebView/The_IndependentWebViewHome.dart';



final Map<int, Widget> newsRoutes = {
  0: const BBCHome(),
  1: const reutersHome(),
  2: const theGuardianHome(),
  3: const buzzFeedHome(),
  4: const NBCHome(),
  5: const focusWireHome(),
  6: const CNNHome(),
  7: const skiftHome(),
  8: const theIndependentHome(),
};
