import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_iconly/flutter_iconly.dart';

import '../../../widgets/text_widget.dart';

Widget Fake() {
  return Scaffold(
    body: Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                    text: 'Hi,   ',
                    style: const TextStyle(
                        color: Colors.cyan,
                        fontSize: 27,
                        fontWeight: FontWeight.bold),
                    children: <TextSpan>[
                      TextSpan(
                          text: 'user',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.normal),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              print('my name is pressed');
                            }),
                    ]),
              ),
              const SizedBox(
                height: 5,
              ),
              TextWidget(
                text: 'user email',
                color: Colors.black,
                textSize: 18,
                // isTitle: true,
              ),
              const SizedBox(
                height: 5,
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                thickness: 2,
              ),
              const SizedBox(
                height: 20,
              ),
              _listTiles(
                  title: 'Address',
                  subtitle: 'address',
                  icon: IconlyBold.profile,
                  onPressed: () async {
                    /// TODO
                  },
                  color: Colors.black),
              _listTiles(
                  title: 'Logout',
                  icon: IconlyBold.logout,
                  color: Colors.black,
                  onPressed: () {
                    ///Navigate to login screen
                  }),
            ],
          ),
        ),
      ),
    ),
  );
}
