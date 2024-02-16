import 'package:books/controller/mobile_controller.dart';
import 'package:books/views/firstpage.dart';
import 'package:books/views/secondpage.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MobileDashboard extends StatelessWidget {
  const MobileDashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controllerMobile = Provider.of<ControllerMobile>(context);

    final List<Widget> widgetOptions = <Widget>[
      const FirstPage(),
      const SecondPage(),
    ];

    return Consumer(
        builder: (context, value, child) => Scaffold(
              body: Stack(
                children: [
                  Center(
                    child:
                        widgetOptions.elementAt(controllerMobile.selectedIndex),
                  ),
                ],
              ),
              bottomNavigationBar: CurvedNavigationBar(
                backgroundColor: Colors.grey,
                index: controllerMobile.selectedIndex,
                items: [
                  buildBottomNavItem(
                    icon: const Icon(
                      Icons.menu_book_sharp,
                      size: 30,
                    ),
                    index: 0,
                    onPressed: () => controllerMobile.setSelectedIndex(0),
                  ),
                  buildBottomNavItem(
                    icon: const Icon(
                      Icons.newspaper,
                      size: 30,
                    ),
                    index: 1,
                    onPressed: () => controllerMobile.setSelectedIndex(1),
                  ),
                ],
              ),
            ));
  }

  Widget buildBottomNavItem({
    required Icon icon,
    required int index,
    required VoidCallback onPressed,
  }) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        IconButton(
          icon: icon,
          color: Colors.black,
          onPressed: onPressed,
        ),
      ],
    );
  }
}
