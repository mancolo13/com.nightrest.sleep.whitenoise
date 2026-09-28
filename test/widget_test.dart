import 'package:flutter_test/flutter_test.dart';
import 'package:app4/main.dart';

void main() {
  testWidgets('NightRest renders app correctly', (WidgetTester tester) async {
    await tester.pumpWidget(const NightRestApp());
    expect(find.byType(NightRestApp), findsOneWidget);
  });
}
