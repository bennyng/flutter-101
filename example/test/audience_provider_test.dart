// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';
import 'package:kaios_store_client/audiences/audience_provider.dart';

void main() {
  group('AudienceProvider', () {
    test('should provide audience code apple ', () {
      var p = AudienceProvider();
      expect(p.availableCodes.where((a) => a == 'apple').toList(), ["apple"]);
    });

    test('should provide audience code banana ', () {
      var p = AudienceProvider();
      expect(p.availableCodes.where((a) => a == 'banana').toList(), ["banana"]);
    });
  });
}
