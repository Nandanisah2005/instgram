import 'package:flutter/material.dart';
import 'package:weather_sports_ui/sports_model_screen.dart';

import 'api_services_class.dart';

class SportsViewScreen extends StatefulWidget {
  const SportsViewScreen({super.key});

  @override
  State<SportsViewScreen> createState() => _SportsViewScreenState();
}

class _SportsViewScreenState extends State<SportsViewScreen> {
  final TextEditingController _searchController = TextEditingController();
  late Future<SportsModel> _futuresearch;
  @override
  void initState(){
    super.initState();
    _futuresearch = _searchBooks("");
  }
  Future<SportsModel>_searchBooks(String query)async{
    return SportsWeatherApi().getData(query);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
     title: Text("# Sports DaTa"),
      ),
      body: Column(
        children: [
          Padding(padding: EdgeInsets.all(25),

          child: TextField(
            controller: _searchController,
            onChanged: (value) {
              setState(() {
                _futuresearch =
                value.isNotEmpty ? SportsWeatherApi().getData(value) : Future
                    .value(SportsModel());
              });
            },
              decoration:
              InputDecoration(
                hintText: "Search..",
                filled: true,
                fillColor: Colors.black12,
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.grey),
                  borderRadius: BorderRadius.circular(25),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.transparent),
                  borderRadius: BorderRadius.circular(25),
                ),
                prefixIcon: IconButton(
                  onPressed: () {
                    // Navigator.push(context, MaterialPageRoute(builder: (context) => Astronomy_Screen(),));
                  },
                  icon: const Icon(Icons.search),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25),
                ),
                contentPadding: const EdgeInsets.symmetric(
                    vertical: 10.0, horizontal: 10.0),
              ),
            ),
          ),
          SizedBox(height: 25),

          FutureBuilder(
              future: _futuresearch,
              builder: (context, snapshot) {
                var dataview = snapshot.data?.football;
                return ListView.builder(
                  itemCount: dataview?.length,
                    itemBuilder: (context, index) {
                      return Card(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(dataview![index].country.toString()),
                            Text(dataview![index].match.toString()),
                            Text(dataview![index].region.toString()),
                            Text(dataview![index].stadium.toString()),
                            Text(dataview![index].start.toString()),
                            Text(dataview![index].tournament.toString()),
                          ],
                        ),
                      );
                    },);
              },)
        ],
      ),
    );
  }
}
