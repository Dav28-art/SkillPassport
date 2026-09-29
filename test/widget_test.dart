import 'package:flutter_test/flutter_test.dart';
import 'package:skillpassport_africa/app.dart';

void main() {
  testWidgets(
    'SkillPassport Africa se lance correctement',
    (WidgetTester tester) async {
      await tester.pumpWidget(const SkillPassportApp());

      expect(find.byType(SkillPassportApp), findsOneWidget);
    },
  );
}
