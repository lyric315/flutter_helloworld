import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class BatteryChagePage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new BatteryState();
}

class BatteryState extends State<BatteryChagePage> {
  static const String BATTERY_METHOD_CHANNEL = 'samples.flutter.io/battery';
  static const String CHARGE_EVENT_CHANNEL = 'samples.flutter.io/charging';

  static const MethodChannel batteryMethodChannel =
      const MethodChannel(BATTERY_METHOD_CHANNEL);
  static const EventChannel chargeEventChannel =
      const EventChannel(CHARGE_EVENT_CHANNEL);

  String _batteryLevel = 'Battery level: unknown.';
  String _chargingStatus = 'Battery status: unknown.';

  Future<void> _getBatteryLevel() async {
    String batteryLevel;
    try {
      final int result =
          await batteryMethodChannel.invokeMethod('getBatteryLevel');
      batteryLevel = 'Battery level: $result%.';
    } on PlatformException {
      batteryLevel = 'Failed to get battery level.';
    }
    setState(() {
      _batteryLevel = batteryLevel;
    });
  }

  @override
  void initState() {
    super.initState();
    chargeEventChannel
        .receiveBroadcastStream()
        .listen(_onEvent, onError: _onError);
  }

  void _onEvent(Object event) {
    setState(() {
      _chargingStatus =
          "Battery status: ${event == 'charging' ? '' : 'dis'}charging.";
    });
  }

  void _onError(Object error) {
    setState(() {
      _chargingStatus = 'Battery status: unknown.';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: new Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(_batteryLevel),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: RaisedButton(
                    child: const Text("refresh!"), onPressed: _getBatteryLevel),
              )
            ],
          ),
          Text(_chargingStatus)
        ],
      ),
    );
  }
}
