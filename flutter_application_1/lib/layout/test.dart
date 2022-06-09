// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mac_address/mac_address.dart';

class Hometest extends StatefulWidget {
  const Hometest({Key key}) : super(key: key);

  @override
  State<Hometest> createState() => _HometestState();
}

class _HometestState extends State<Hometest> {
  String _deviceMAC = 'Click the button.';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('MAC ADREES'),
      ),
      body: Center(
        child: Column(
          children: [
            Text(_deviceMAC,
                style:
                    const TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
            ElevatedButton(
              onPressed: () {
                initMacAddress();
              },
              child: const Text('mac adrees get'),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> initMacAddress() async {
    String macAddress;
    try {
      macAddress = await GetMac.macAddress;
      print('mac adrees ' + _deviceMAC);
    } on PlatformException {
      macAddress = 'Error getting the MAC address.';
    }
    setState(() {
      _deviceMAC = macAddress;
      print('mac adrees ' + _deviceMAC);
    });
  }
}
// import 'package:flutter/material.dart';
// import 'package:flutter/services.dart';
// import 'package:flutter/widgets.dart';
// import 'package:mac_address/mac_address.dart';

// class SplashScreen extends StatefulWidget {
//   @override
//   _SplashScreenState createState() => _SplashScreenState();
// }

// class _SplashScreenState extends State<SplashScreen> {
//   String _platformID = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [Text(_platformID)],
//         ),
//       ),
//     );
//   }

//   Future<void> initPlatformState() async {
//     String platformVersion;
//     try {
//       platformVersion = await GetMac.macAddress;
//     } on PlatformException {
//       platformVersion = 'Failed to get Device MAC Address.';
//     }

//     if (!mounted) return;
//     setState(() {
//       _platformID = platformVersion;
//       print("MAC-: " + platformVersion);
//     });
//   }
// }
// import 'package:flutter/material.dart';
// import 'package:flutter/widgets.dart';
// import 'package:macadress_gen/macadress_gen.dart';

// class HomePage extends StatefulWidget {
//   @override
//   _HomePageState createState() => _HomePageState();
// }

// class _HomePageState extends State<HomePage> {
//   MacadressGen macadressGen = MacadressGen();

//   String mac;

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('MAC ADDRESS'),
//       ),
//       body: Center(
//           child: Text(
//         mac ?? 'MAC ',
//         style: TextStyle(
//             fontSize: 30, fontWeight: FontWeight.bold, color: Colors.black54),
//       )),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () async {
//           await getMAc();
//           setState(() {});
//         },
//       ),
//     );
//   }

//   Future getMAc() async {
//     mac = await macadressGen.getMac();
//   }
// }
// import 'package:flutter/material.dart';

// import 'package:flutter/services.dart';
// import 'package:mac_address/mac_address.dart';

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   String _platformVersion = 'Unknown';

//   @override
//   void initState() {
//     super.initState();
//     initPlatformState();
//   }

//   // Platform messages are asynchronous, so we initialize in an async method.
//   Future<void> initPlatformState() async {
//     String platformVersion;
//     // Platform messages may fail, so we use a try/catch PlatformException.
//     try {
//       platformVersion = await GetMac.macAddress;
//     } on PlatformException {
//       platformVersion = 'Failed to get Device MAC Address.';
//     }

//     // If the widget was removed from the tree while the asynchronous platform
//     // message was in flight, we want to discard the reply rather than calling
//     // setState to update our non-existent appearance.
//     if (!mounted) return;

//     setState(() {
//       _platformVersion = platformVersion;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Plugin example app'),
//         ),
//         body: Center(
//           child: Text('MAC Address : $_platformVersion\n'),
//         ),
//       ),
//     );
//   }
// }
