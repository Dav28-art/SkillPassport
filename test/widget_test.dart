import 'package:flutter_test/flutter_test.dart';
import 'package:skillpassport_africa/app.dart';

void main() {
  testWidgets('SkillPassport Africa app smoke test', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(
      const SkillPassportApp(),
    );

    await tester.pump(const Duration(seconds: 2));

    expect(find.text('SkillPassport Africa'), findsWidgets);
  });
}
