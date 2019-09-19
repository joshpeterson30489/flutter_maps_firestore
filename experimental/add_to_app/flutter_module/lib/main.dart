// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Module Title',
      routes: {
        '/': (context) => FullScreenView(),
        '/mini': (context) => Contents(),
      },
    );
  }
}

class FullScreenView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Full-screen Flutter'),
      ),
      body: const Contents(showExit: true),
    );
  }
}

class Contents extends StatefulWidget {
  final bool showExit;

  const Contents({this.showExit = false});

  @override
  _ContentsState createState() => _ContentsState();
}

class _ContentsState extends State<Contents> {
  int count = 0;

  @override
  Widget build(BuildContext context) {
    final mediaInfo = MediaQuery.of(context);

    return SizedBox.expand(
      child: Stack(
        children: [
          Positioned.fill(
            child: DecoratedBox(
              decoration: BoxDecoration(
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Positioned.fill(
            child: Opacity(
              opacity: .25,
              child: FittedBox(
                fit: BoxFit.cover,
                child: FlutterLogo(),
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Window is ${mediaInfo.size.width.toStringAsFixed(1)} x '
                      '${mediaInfo.size.height.toStringAsFixed(1)}',
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 16),
                Text(
                  'Taps: $count',
                  style: Theme.of(context).textTheme.headline,
                ),
                SizedBox(height: 16),
                RaisedButton(
                  onPressed: () => setState(() => count++),
                  child: Text('Tap me!'),
                ),
                if (widget.showExit) ...[
                  SizedBox(height: 16),
                  RaisedButton(
                    onPressed: () => SystemNavigator.pop(),
                    child: Text('Exit this screen'),
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }
}
