// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mac_address/mac_address.dart';

class hometest extends StatefulWidget {
  const hometest({Key key}) : super(key: key);

  @override
  State<hometest> createState() => _hometestState();
}

class _hometestState extends State<hometest> {
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
    } on PlatformException {
      macAddress = 'Error getting the MAC address.';
    }
    setState(() {
      _deviceMAC = macAddress;
      print('mac adrees' + _deviceMAC);
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
