import 'package:flutter/material.dart';
import 'package:world_time/services/world_time_api.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'uk.png'),
    WorldTime(url: 'Europe/Berlin', location: 'Athens', flag: 'greece.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Lagos', location: 'Lagos', flag: 'nigeria1.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'kenya.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'usa.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'usa.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'indonesia.png'),
  ];

  void newTime(index) async {
    WorldTime currentTime = locations[index];
    await currentTime.getData();
    if (!mounted) return;
    Navigator.pop(context, {
      'location': currentTime.location,
      'flag': currentTime.flag,
      'time': currentTime.time,
      'isDaytime': currentTime.isDaytime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.indigo[900],
        title: const Text('Choose Location'),
        centerTitle: true,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: 5.0,
                  vertical: 2.0),
              child: Card(
                child: ListTile(
                  onTap: () {
                    newTime(index);
                  },
                  title: Text(
                    locations[index].location,
                  ),
                  leading: CircleAvatar(
                    backgroundImage: AssetImage(
                        'assets/images/countries_flag/${locations[index].flag}',
                    ),
                  ),
                ),
              ),
            );
          },
      )
      );
  }
}
