import 'dart:math' as math;

import 'package:moolax/logics/models/gender.dart';
import 'package:moolax/utils/app_bar.dart';
import 'package:flutter/material.dart';

const double defaultGenderAngle = math.pi / 4;
const Map<Gender, double> genderAngles = {
  Gender.female: -defaultGenderAngle,
  Gender.other: 0.0,
  Gender.male: defaultGenderAngle,
};

double circleSize(BuildContext context) => screenAwareSize(80.0, context);
