import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'dart:math';
class Win extends StatefulWidget {
  Win(int queMoney, String quizID, {Key? key}) : super(key: key);

  @override
  State<Win> createState() => _WinState();
}

class _WinState extends State<Win> {
  late ConfettiController confettiController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      initController();
    });
    confettiController.play();
  }

  void initController() {
    confettiController =
        ConfettiController(duration: const Duration(seconds: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(image: DecorationImage(image: AssetImage("assets/images/win.png"), fit: BoxFit.cover)),
      child: Scaffold(
          floatingActionButton: ElevatedButton(child: Text("Share With Friends"), onPressed: (){},),
          backgroundColor: Colors.transparent,
          body: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "CONGRATULATIONS!",
                      style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      "YOUR ANSWER IS CORRECT",
                      style: TextStyle(fontSize: 17, fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    Text(
                      "You Won",
                      style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Rs. 5,40,000",
                      style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    Container(
                        padding: EdgeInsets.all(20),
                        child: Image.asset("assets/images/cheque.jpg")),
                        ElevatedButton(onPressed: (){}, child: Text("Next"))
                  ],
                ),
              ),
              buildConfettiWidget(confettiController, pi/2)
            ],
          ),
        ),
    );
  }

  Align buildConfettiWidget(controller, double blastDirection) {
    return Align(
      alignment: Alignment.topCenter,
      child: ConfettiWidget(
        maximumSize: Size(30, 30),
        shouldLoop: false,
        confettiController: controller,
        blastDirection: blastDirection,
        blastDirectionality: BlastDirectionality.explosive,
        maxBlastForce: 20,
        minBlastForce: 8,
        emissionFrequency: 0.02,
        numberOfParticles: 8,
        gravity: 0.6,
      ),
    );
  }
}
