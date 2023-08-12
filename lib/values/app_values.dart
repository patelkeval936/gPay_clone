import 'package:flutter/material.dart';

Size screenSize = WidgetsBinding.instance.platformDispatcher.views.first.physicalSize;
double devicePixelRatio = WidgetsBinding.instance.platformDispatcher.views.first.devicePixelRatio;
double width = screenSize.width/devicePixelRatio;
double height = screenSize.height/devicePixelRatio;

EdgeInsets horizontal16 = const EdgeInsets.symmetric(horizontal: 16);
EdgeInsets horizontal8 = const EdgeInsets.symmetric(horizontal: 8);

double maxAmountToSend = 10000000;


