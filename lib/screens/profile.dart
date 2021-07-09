import 'dart:ffi';

import 'package:flutter/material.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text(''),

            //s
            Text(
              'Sign in to get the most of Neverthink',
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            SizedBox(height: 30),
            Text(
              'Create an account to like videos, add favorite channels and more',
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 30),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white, // background
                  onPrimary: Colors.black,
                ), // foreground
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.access_alarm),
                        Text(
                          'Continue with Google',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )),
            SizedBox(height: 20),
            ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.blue, // background
                  onPrimary: Colors.black,
                ), // foreground
                onPressed: () {},
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Row(
                      children: [
                        Icon(Icons.ac_unit),
                        Text(
                          'Continue with Facebook',
                          textAlign: TextAlign.center,
                        ),
                      ],
                    ),
                  ),
                )),
            TextButton(
              style: ButtonStyle(
                foregroundColor: MaterialStateProperty.all<Color>(Colors.grey),
              ),
              onPressed: () {},
              child: Text('Continue with Email'),
            ),

            Text(
              'By continuing you agree to our Terms of Service',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
