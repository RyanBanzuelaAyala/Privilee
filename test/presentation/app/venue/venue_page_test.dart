// import 'package:TApp/presentation/app/venue/venue_page.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

// void main() {
//   testWidgets('venue page ...', (tester) async {
//     await tester.pumpWidget(
//       const MaterialApp(
//         home: VenuePage(),
//       ),
//     );

//     await tester.pumpAndSettle();

//     // Verify the video player appears
//     expect(find.byType(RoundedLoadingButton), findsOneWidget);
//   });
// }

import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:TApp/presentation/app/venue/venue_page.dart';
import 'package:TApp/presentation/app/venue/venue_vm.dart';
import 'package:mockito/mockito.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';

class MockVenuePageVM extends Mock implements VenuePageVM {}

void main() {
  late MockVenuePageVM mockVenuePageVM;

  setUp(() {
    mockVenuePageVM = MockVenuePageVM();
    when(mockVenuePageVM.isPageLoading).thenReturn(true);
    when(mockVenuePageVM.venues).thenReturn([]);
  });

  testWidgets('VenuePage renders correctly', (WidgetTester tester) async {
    await tester.pumpWidget(
      MaterialApp(
        home: ChangeNotifierProvider<VenuePageVM>(
          create: (_) => mockVenuePageVM,
          child: const VenuePage(),
        ),
      ),
    );

    await tester.pumpAndSettle();

    // Verify presence of UI elements
    expect(find.byType(Scaffold), findsOneWidget);
    expect(find.byType(TextField), findsOneWidget);
    expect(find.byType(RoundedLoadingButton), findsOneWidget);
  });
}
