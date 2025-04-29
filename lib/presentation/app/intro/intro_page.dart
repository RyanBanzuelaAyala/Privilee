import 'package:TApp/presentation/app/intro/intro_vm.dart';
import 'package:TApp/router/route_builder.dart';
import 'package:TApp/router/router.dart';
import 'package:TApp/shared/ui/common_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:video_player/video_player.dart';
import 'package:flutter/services.dart';

class IntroPage extends StatelessWidget {
  const IntroPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<IntroPageVM>(
      create: (context) => IntroPageVM(),
      child: Consumer<IntroPageVM>(
        builder: (BuildContext context, model, Widget? child) {
          WidgetsBinding.instance.addPostFrameCallback((_) async {
            if (!model.isInitLoaded) {
              model.setInitLoad = true;
              model.setInitPage = false;
              SystemChrome.setEnabledSystemUIMode(SystemUiMode.immersive);
            }
          });

          return Scaffold(
            backgroundColor: Colors.white,
            body: Stack(
              children: [
                Center(
                  child: FutureBuilder(
                    future: model.videoController.initialize(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return FittedBox(
                          fit: BoxFit.cover,
                          child: SizedBox(
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height,
                            child: VideoPlayer(model.videoController),
                          ),
                        );
                      } else {
                        return const Center(child: CircularProgressIndicator());
                      }
                    },
                  ),
                ),
                Positioned(
                  bottom: 50,
                  left: 20,
                  right: 20,
                  child: TButton(
                      "Start your journey",
                      Icons.arrow_forward_outlined,
                      Colors.grey.shade100,
                      model.btnctrl1, () {
                    Navigator.of(context).push(venuePageRoute());
                  }),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
