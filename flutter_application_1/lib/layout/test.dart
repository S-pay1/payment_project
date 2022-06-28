import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../shared/components/components.dart';

class AppHome extends StatelessWidget {
  final TextEditingController controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 2.0),
              child: TextField(
                  controller: controller,
                  decoration: InputDecoration(
                      hintText: "Password",
                      border: OutlineInputBorder(borderSide: BorderSide()))),
            ),
            SizedBox(
              height: 30,
            ),
            defaultButton(
                function: () {
                  if (kDebugMode) {
                    print('$controller');
                  }
                },
                text: 'tetd')
          ],
        ),
      ),
    );
  }
}
