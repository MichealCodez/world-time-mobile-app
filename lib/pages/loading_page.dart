import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_api.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class LoadingPage extends StatefulWidget {
  const LoadingPage({Key? key}) : super(key: key);

  @override
  State<LoadingPage> createState() => _LoadingPageState();
}

class _LoadingPageState extends State<LoadingPage> {

  void setTime() async {
    WorldTime currentTime = WorldTime(location: 'Lagos', flag: 'nigeria1.png', url: 'Africa/Lagos');
    await currentTime.getData();

    if (!mounted) return;
    Navigator.pushReplacementNamed(context, '/home', arguments: {
      'location': currentTime.location,
      'flag': currentTime.flag,
      'time': currentTime.time,
      'isDaytime': currentTime.isDaytime,
    });
  }

  @override
  void initState() {
    super.initState();
    setTime();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.indigo[900],
      body: const Center(
        child: SpinKitFadingCircle(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
