import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class TeamsViewModel extends ChangeNotifier {
  void onBackButtonTap(BuildContext context) {
    Beamer.of(context).beamBack();
  }
}
