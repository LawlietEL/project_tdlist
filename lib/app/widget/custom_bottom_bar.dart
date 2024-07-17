import 'package:flutter/material.dart';

class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: const CircularNotchedRectangle(),
      notchMargin: 7.0,
      child: SizedBox(
        height: 65,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            // This space is to center the FAB
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20),
            SizedBox(width: MediaQuery.of(context).size.width / 2 - 20),
          ],
        ),
      ),
    );
  }
}
