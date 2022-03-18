import 'package:intl/intl.dart';
import 'package:alarm_clock_app/custom_widgets/custom_number_picker.dart';
import 'package:alarm_clock_app/models/clocks_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_beep/flutter_beep.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await AndroidAlarmManager.initialize();
  runApp(MaterialApp(
      theme: ThemeData(
        brightness: Brightness.dark,
      ),
      home: AlarmClock()));
}

class AlarmClock extends StatefulWidget {
  const AlarmClock({Key? key}) : super(key: key);

  @override
  _AlarmClockState createState() => _AlarmClockState();
}

class _AlarmClockState extends State<AlarmClock> {
  ClockClass clock = ClockClass(
    int.parse(DateFormat("HH").format(DateTime.now()).toString()),
    int.parse(DateFormat("mm").format(DateTime.now()).toString()),
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              decoration: BoxDecoration(color: Colors.green),
              child: Row(
                children: [
                  Text('Najbliższy zaplanowany budzik: '),
                  Text('Nigdy! Można się wyspać!')
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          // AndroidAlarmManager.oneShotAt(
          //     DateTime(2022, 3, 17, clock.hours, clock.minutes, 0, 0),
          //     0,
          //     callHello);

          showModalBottomSheet(
              context: context,
              builder: (BuildContext context) {
                return Container(
                  height: MediaQuery.of(context).size.height * 0.5,
                  color: Colors.grey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: CustomNumberPicker(clock: clock),
                          ),
                        ],
                      ),
                    ],
                  ),
                );
              });
        },
        icon: const Icon(Icons.alarm_add),
        label: const Text('Dodaj Budzik'),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  @override
  void initState() {
    super.initState();
    print('initialize');
    print(DateFormat.jm().format(DateTime.now()).toString().substring(0, 2));
  }

  void onHoursChange(int value) {
    print('change hours');
  }

  static void callHello() {
    print('done' + DateTime.now().toString());
    FlutterBeep.beep();
  }
}
