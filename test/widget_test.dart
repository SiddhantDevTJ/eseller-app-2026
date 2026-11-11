import 'package:flutter_test/flutter_test.dart';
import 'package:vendor_app/main.dart';

void main() {
  testWidgets('VendorApp smoke test', (WidgetTester tester) async {
    await tester.pumpWidget(const VendorApp());
    expect(find.text('Techjockey Partner App'), findsOneWidget);
  });
}
