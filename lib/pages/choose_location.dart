import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({super.key});

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {
  List<WorldTime> locations = [
    WorldTime(
        location: "Riyadh",
        flag: "https://www.worldometers.info/img/flags/small/tn_sa-flag.gif",
        url: "Asia/Riyadh"),
    WorldTime(
        location: 'London',
        flag: "https://www.worldometers.info/img/flags/uk-flag.gif",
        url: 'Europe/London'),
    WorldTime(
        location: "Tokyo",
        flag: "https://www.worldometers.info/img/flags/ja-flag.gif",
        url: "Asia/Tokyo"),
    WorldTime(
        location: 'Cairo',
        flag: "https://www.worldometers.info/img/flags/eg-flag.gif",
        url: 'Africa/Cairo'),
    WorldTime(
        location: "Nairobi",
        flag: "https://www.worldometers.info/img/flags/ke-flag.gif",
        url: "Africa/Nairobi"),
    WorldTime(
        location: 'Chicago',
        flag: "https://www.worldometers.info/img/flags/us-flag.gif",
        url: 'America/Chicago'),
    WorldTime(
        location: "Seoul",
        flag: "https://www.worldometers.info/img/flags/small/tn_ks-flag.gif",
        url: "Asia/Seoul"),
    WorldTime(
        location: 'Jakarta',
        flag: "https://www.worldometers.info/img/flags/small/tn_id-flag.gif",
        url: 'Asia/Jakarta'),
  ];

  void updateTime(index) async {
    WorldTime instance = locations[index];
    await instance.getTime();
    //navigate to home screen
    Navigator.pop(context, {
      'location': instance.location,
      'flag': instance.flag,
      'time': instance.time,
      'isDayTime': instance.isDayTime,
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 189, 87, 76),
        title: Text("Choose a Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 1.0, horizontal: 4),
              child: Card(
                child: ListTile(
                  onTap: () {
                    updateTime(index);
                  },
                  title: Text(locations[index].location),
                  leading: CircleAvatar(
                      backgroundImage: NetworkImage(locations[index].flag)),
                ),
              ),
            );
          }),
    );
  }
}
