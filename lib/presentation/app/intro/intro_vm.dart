import 'package:TApp/shared/extension/base_widget.dart';
import 'package:rounded_loading_button_plus/rounded_loading_button.dart';
import 'package:video_player/video_player.dart';

class IntroPageVM extends BaseVM {
  late VideoPlayerController videoController;

  var btnctrl1 = RoundedLoadingButtonController();

  IntroPageVM() {
    videoController = VideoPlayerController.asset("assets/privilee_mobile.mp4")
      ..initialize().then((_) {
        videoController.play();
        videoController.setLooping(true);
      }).catchError((error) {
        print("Error initializing video: $error");
      });
  }
}
