import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.red[700],
      body: Container(
        padding: EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment(0, 0),
              child: Text(
                "Error",
                style: Theme.of(context).textTheme.headline2
              ),
            )
          ],
        )
      )
    );
  }
}

/*Future getDesktopWidth() async {
  Size desktopSize = await DesktopWindow.getWindowSize();
  double width = desktopSize.width;

  return width;
} */