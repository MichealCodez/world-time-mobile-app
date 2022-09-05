import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {

  Map<String, dynamic> data = {};

  @override
  Widget build(BuildContext context) {

    data = data.isEmpty ? ModalRoute.of(context)?.settings.arguments as Map<String, dynamic> : data;
    String bgImg = data['isDaytime'] ? 'day.jpg' : 'night.jpg';
    Color? bgColor = data['isDaytime'] ? Colors.purple[100] : Colors.grey[900];
    Color? dtColor = data['isDaytime'] ? Colors.grey[900] : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/day_and_night/$bgImg'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 170.0, 0, 0),
          child: Column(
            children: [
              TextButton.icon(
                  onPressed: () async {
                    dynamic newData = await Navigator.pushNamed(
                        context,
                        '/location',
                    );
                    setState(() {
                      data = {
                        'location': newData['location'],
                        'flag': newData['flag'],
                        'time': newData['time'],
                        'isDaytime': newData['isDaytime']
                      };
                    });
                  },
                  icon: const Icon(
                    Icons.edit_location,
                  ),
                  label: const Text(
                    'Change Location',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15.0,
                    ),
                  ),
              ),
              const SizedBox(height: 20.0,),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: AssetImage('assets/images/countries_flag/${data['flag']}'),
                  ),
                  const SizedBox(width: 10.0,),
                  Text(
                      data['location'],
                      style: TextStyle(
                        fontSize: 35.0,
                        color: dtColor,
                      ),
                  ),
                ],
              ),
              const SizedBox(height: 20.0,),
              Text(
                data['time'],
                style: TextStyle(
                  fontSize: 60.0,
                  fontWeight: FontWeight.bold,
                  color: dtColor,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
