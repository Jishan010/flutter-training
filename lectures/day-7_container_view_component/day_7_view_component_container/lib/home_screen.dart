import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen() : super(key: const Key(""));

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;
  List<Widget> screens = [Screen1(), Screen2(), Screen3()];

  void onItemClick(int newIndex) {
    setState(() {
      selectedIndex = newIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
        child: Scaffold(
          appBar: AppBar(title: Text("Bottom nav bar")),
          body: Center(
            child: screens[selectedIndex],
          ),
          bottomNavigationBar: BottomNavigationBar(
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.add_business), label: "Business"),
              BottomNavigationBarItem(icon: Icon(Icons.access_time_filled), label: "Clock"),
              BottomNavigationBarItem(icon: Icon(Icons.account_balance), label: "Bank")
            ],
            onTap: (index) => onItemClick(index),
            currentIndex: selectedIndex,
          ),
        ),
        onWillPop: () {
          Fluttertoast.showToast(msg: "Back pressed");
          if(selectedIndex > 0){
            onItemClick(0);
            return Future.value(false);
          } else {
            return Future.value(true);
          }
        }
    );
  }
}

class Screen1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Screen 1"),
    );
  }
}

class Screen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Screen 2"),
    );
  }
}

class Screen3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Screen 3"),
    );
  }
}
