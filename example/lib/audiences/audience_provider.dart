import 'package:flutter/material.dart';

import 'audience_apple/catalogue_screen.dart' as audience_apple;
import 'audience_banana/catalogue_screen.dart' as audience_banana;

class Audience {
  Widget entryScreen;

  Audience({this.entryScreen});
}

class AudienceProvider {
  // NOTE reflection not available in Dart so configuration is over convention here

  Map<String, Audience> _availableAudiences = {
    'apple': Audience(entryScreen: audience_apple.CatalogueScreen()),
    'banana': Audience(entryScreen: audience_banana.CatalogueScreen()),

    // more UI audiences defines here
  };

  List<String> get availableCodes => this._availableAudiences.keys.toList();

  Audience getAudienceByCode(String code) {
    if (!this._availableAudiences.containsKey(code)) {
      throw "Unsupported audience code $code";
    }

    return this._availableAudiences[code];
  }
}
