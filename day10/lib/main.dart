import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SettingView(),
    );
  }
}
class SettingView extends StatefulWidget {
  const SettingView({super.key});

  @override
  State<SettingView> createState() => _SettingViewState();
}

class _SettingViewState extends State<SettingView> {
   var onChanged = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          Icon(Icons.arrow_back,color: Colors.black54,)
        ],
        title: Text("Archiving and downloading",style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 20,
        ),
      ),
          ),
      body: Card(
          child: Container(
            child: Column(
              children: [
                Text("Saving to archive"),
                ListTile(
                  title: Text("save story to archive"),
                  trailing: Switch(value: onChanged,
                      onChanged: (onChanged){}),
                  subtitle: Text("Automatically save photos and videos to your archive so you don't"),
                )
              ],
            ),
            
          ),
    ),
    );
  }
}
