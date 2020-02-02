import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

void main() {
  group('Counter App', () {
    final buttonFinder = find.byValueKey('increment');
    final textFinder = find.byValueKey('counter');

    FlutterDriver driver;

    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('Starts at 0', () async {
      expect(await driver.getText(textFinder), '0');
    });

    test('Increments 1', () async {
      await driver.tap(buttonFinder);

      expect(await driver.getText(textFinder), '1');
    });
  });
}
