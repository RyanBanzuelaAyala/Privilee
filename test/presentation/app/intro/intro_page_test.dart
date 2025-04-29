import 'package:TApp/presentation/app/intro/intro_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:video_player/video_player.dart';
import 'package:video_player_platform_interface/video_player_platform_interface.dart';

class FakeVideoPlayerPlatform extends VideoPlayerPlatform {
  @override
  Future<void> init() async {
    return Future.value(); // Simulate successful initialization
  }
}

void main() {
  setUpAll(() {
    VideoPlayerPlatform.instance = FakeVideoPlayerPlatform();
  });

  testWidgets('intro page ...', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: IntroPage(),
      ),
    );

    await tester.pumpAndSettle();

    // Verify the video player appears
    expect(find.byType(VideoPlayer), findsOneWidget);
    expect(find.byType(RoundedLoadingButton), findsOneWidget);
  });
}
