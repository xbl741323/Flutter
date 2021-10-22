import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

// ignore: camel_case_types
class loading_example extends StatefulWidget {
  @override
  loading_example_state createState() => loading_example_state();
}

// ignore: camel_case_types
class loading_example_state extends State<loading_example> {
  final ScrollController _controller =
      ScrollController(keepScrollOffset: false);
  List kits = <Widget>[
    const SpinKitRotatingCircle(color: Colors.deepPurple),
    const SpinKitRotatingPlain(color: Colors.deepPurple),
    const SpinKitChasingDots(color: Colors.deepPurple),
    const SpinKitPumpingHeart(color: Colors.deepPurple),
    const SpinKitPulse(color: Colors.deepPurple),
    const SpinKitDoubleBounce(color: Colors.deepPurple),
    const SpinKitWave(color: Colors.deepPurple, type: SpinKitWaveType.start),
    const SpinKitWave(color: Colors.deepPurple, type: SpinKitWaveType.center),
    const SpinKitWave(color: Colors.deepPurple, type: SpinKitWaveType.end),
    const SpinKitPianoWave(
        color: Colors.deepPurple, type: SpinKitPianoWaveType.start),
    const SpinKitPianoWave(
        color: Colors.deepPurple, type: SpinKitPianoWaveType.center),
    const SpinKitPianoWave(
        color: Colors.deepPurple, type: SpinKitPianoWaveType.end),
    const SpinKitThreeBounce(color: Colors.deepPurple),
    const SpinKitThreeInOut(color: Colors.deepPurple),
    const SpinKitWanderingCubes(color: Colors.deepPurple),
    const SpinKitWanderingCubes(
        color: Colors.deepPurple, shape: BoxShape.circle),
    const SpinKitCircle(color: Colors.deepPurple),
    const SpinKitFadingFour(color: Colors.deepPurple),
    const SpinKitFadingFour(
        color: Colors.deepPurple, shape: BoxShape.rectangle),
    const SpinKitFadingCube(color: Colors.deepPurple),
    const SpinKitCubeGrid(size: 51.0, color: Colors.deepPurple),
    const SpinKitFoldingCube(color: Colors.deepPurple),
    const SpinKitRing(color: Colors.deepPurple),
    const SpinKitDualRing(color: Colors.deepPurple),
    const SpinKitSpinningLines(color: Colors.deepPurple),
    const SpinKitFadingGrid(color: Colors.deepPurple),
    const SpinKitFadingGrid(
        color: Colors.deepPurple, shape: BoxShape.rectangle),
    const SpinKitSquareCircle(color: Colors.deepPurple),
    const SpinKitSpinningCircle(color: Colors.deepPurple),
    const SpinKitSpinningCircle(
        color: Colors.deepPurple, shape: BoxShape.rectangle),
    const SpinKitFadingCircle(color: Colors.deepPurple),
    const SpinKitHourGlass(color: Colors.deepPurple),
    const SpinKitPouringHourGlass(color: Colors.deepPurple),
    const SpinKitPouringHourGlassRefined(color: Colors.deepPurple),
    const SpinKitRipple(color: Colors.deepPurple),
    const SpinKitDancingSquare(color: Colors.deepPurple),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Loading'),
      ),
      body: Container(
        child: ListView.builder(
            controller: _controller,
            itemCount: kits.length,
            itemBuilder: (context, index) {
              return getBody(index);
            }),
      ),
    );
  }

  Widget getBody(index) {
    return Container(
        alignment: Alignment.center, height: 100, child: kits[index]);
  }
}
