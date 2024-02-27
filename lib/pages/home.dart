import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Map<dynamic, dynamic>? data;

  @override
  Widget build(BuildContext context) {
    data = data != null && data!.isNotEmpty
        ? data
        : ModalRoute.of(context)?.settings.arguments as Map<dynamic, dynamic>?;
    print(data);

    // Set background image URLs
    String bgImage = data?['isDayTime'] ?? false
        ? 'https://img.freepik.com/premium-vector/mountain-landscape-with-forest_24911-3511.jpg?w=826'
        : 'https://img.freepik.com/free-vector/full-moon_1308-39800.jpg?size=626&ext=jpg&ga=GA1.1.544874646.1709047786&semt=ais';

    Color? bgColor = data?['isDayTime']
        ? Color.fromARGB(255, 169, 243, 173)
        : Color.fromARGB(255, 244, 255, 175);

    return Scaffold(
      backgroundColor: bgColor,
      body: SafeArea(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: NetworkImage(bgImage),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 129, 0, 0),
            child: Column(
              children: <Widget>[
                ElevatedButton.icon(
                  onPressed: () async {
                    dynamic result =
                        await Navigator.pushNamed(context, '/location');
                    setState(() {
                      data = {
                        'time': result['time'],
                        'location': result['location'],
                        'isDayTime': result['isDayTime'],
                        'flag': result["flag"]
                      };
                    });
                  },
                  icon: Icon(
                    Icons.edit_location,
                    color: Color.fromARGB(255, 255, 255, 255),
                  ),
                  label: Text(
                    'Edit Location',
                    style: TextStyle(
                        color: const Color.fromARGB(255, 255, 255, 255)),
                  ),
                  style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all<Color>(
                      Color.fromARGB(255, 77, 77, 77),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text(
                      data?['location'] ?? '',
                      style: TextStyle(
                          fontSize: 30,
                          letterSpacing: 2,
                          color: const Color.fromARGB(255, 0, 0, 0)),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                Text(
                  data?['time'] ?? '',
                  style: TextStyle(fontSize: 66),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
