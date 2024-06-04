import 'package:flutter/material.dart';
import 'package:tn_bottom_sheet_navigator/core/entities/tn_bottom_sheet_route.dart';

const sampleRouteKey = Key('sample');
const homeSampleRouteKey = Key('home-sample');

const sampleRoutePath = 'sample';
const homeSampleRoutePath = 'home-sample';

final sampleRoute = TnBottomSheetRoute(
  path: sampleRoutePath,
  builder: (_, __) => const Text(
    'sample',
    key: sampleRouteKey,
  ),
);
final homeSampleRoute = TnBottomSheetRoute(
  path: homeSampleRoutePath,
  builder: (_, __) => const Text(
    'home-sample',
    key: homeSampleRouteKey,
  ),
);

final sampleRouteList = [
  sampleRoute,
  homeSampleRoute,
];
