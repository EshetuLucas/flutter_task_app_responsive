import 'package:beamer/beamer.dart';
import 'package:flutter/material.dart';

class ProjectsViewModel extends ChangeNotifier {
  void onBackButtonTap(BuildContext context) {
    Beamer.of(context).beamBack();
  }
}
