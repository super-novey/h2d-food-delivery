import 'package:animated_background/animated_background.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_h2d/utils/constants/colors.dart';

class BackGroundLogin extends StatefulWidget {
  const BackGroundLogin({super.key});

  @override
  _BackGroundLoginState createState() => _BackGroundLoginState();
}

class _BackGroundLoginState extends State<BackGroundLogin>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: MyColors.dividerColor,
      height: MediaQuery.of(context).size.height,  // Đảm bảo chiếm toàn màn hình
          width: MediaQuery.of(context).size.width,
      child: AnimatedBackground(
        behaviour: RandomParticleBehaviour(
          options: const ParticleOptions(
            baseColor: MyColors.darkPrimaryColor,
            particleCount: 15,
            spawnMaxRadius: 70,
            spawnMinRadius: 40,
            spawnMaxSpeed: 40,
            spawnMinSpeed:20
          ),
        ),
        vsync: this,
        child: Container(),
      ),
    );
  }
}
