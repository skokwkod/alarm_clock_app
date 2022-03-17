import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:numberpicker/numberpicker.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(const AlarmClock());
}

class AlarmClock extends StatefulWidget {
  const AlarmClock({Key? key}) : super(key: key);

  @override
  _AlarmClockState createState() => _AlarmClockState();
}

class _AlarmClockState extends State<AlarmClock> {
  int _hoursValue = 5;
  int _minValue = 30;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: Scaffold(
        appBar: AppBar(
          title: Text('Twoje Alarmy'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          decoration: BoxDecoration(
            image: DecorationImage(
              colorFilter: ColorFilter.mode(
                  Colors.black.withOpacity(0.5), BlendMode.srcOver),
              image: AssetImage('lib/assets/flutter-logo.png'),
              fit: BoxFit.fitHeight,
            ),
          ),
          child: Column(
            children: [
              FlutterAnalogClock(
                dialPlateColor: Colors.grey,
                isLive: true,
                showTicks: false,
                dateTime: DateTime.now(),
                width: 300,
                height: 300,
              ),
              Container(
                margin: EdgeInsets.all(15),
                padding: EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.green
                ),
                child: Row(

                  children: [
                    Text('Najbliższy zaplanowany budzik: '),
                    Text('Nigdy! Można się wyspać!')
                  ],
                ),

              ),
              Container(
                margin: EdgeInsets.all(18),
                padding: EdgeInsets.all(18),
                child: Card(
                  elevation: 15,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                            border: Border.all(width: 2),
                            borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children: [
                            Text('Ustaw Godzinę'),
                            NumberPicker(
                                minValue: 0,
                                maxValue: 24,
                                value: _hoursValue,
                                onChanged: (value) => setState(() => _hoursValue = value),
                              axis: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          borderRadius: BorderRadius.all(Radius.circular(10))
                        ),
                        child: Column(
                          children: [
                            Text('Ustaw Minuty'),
                            NumberPicker(
                              zeroPad: true,
                              infiniteLoop: true,
                              itemCount: 3,
                              minValue: 0,
                              maxValue: 60,
                              value: _minValue,
                              onChanged: (value) => setState(() => _minValue = value),
                              axis: Axis.horizontal,
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                ),
              )
            ],
          ),

        ),
        floatingActionButton: FloatingActionButton.extended(
          onPressed: ()  {
            print('touched');
            AndroidAlarmManager.oneShotAt(DateTime(2022,3,16,15,02), 0, callHello);
          },
          icon: const Icon(Icons.alarm_add),
          label: const Text('Dodaj Budzik'),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    print('initialize');

  }

void onHoursChange(int value){
    print('change hours');
}
 static void callHello() {
     print('done'+DateTime.now().toString());

  }
}
