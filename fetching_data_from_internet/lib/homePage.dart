import 'package:flutter/material.dart';
import 'fetchingData.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        // A widget for running a Future function and getting data from it.

        child: FutureBuilder(
          // Function to be runned for fetching data.

          future: fetchData(),
          // Things to be done and widgets to be shown in the conclusion of function running.

          builder: (context, AsyncSnapshot snapshot) {
            // If some data has gotten from website

            if (snapshot.hasData) {
              // Building a ListView to sort many widgets.

              return ListView.builder(
                itemBuilder: (context, index) {
                  return Row(
                    children: [
                      for (int i = 0; i < 2; i++)
                        Container(
                          child: i == 0
                              ? Image.network(
                                  "https://image.tmdb.org/t/p/w500" +
                                      snapshot.data[index]["poster_path"])
                              : snapshot.data[index]["original_title"],
                        ),
                    ],
                  );
                },
              );
            }
            // If no data has gotten

            if (snapshot.hasData == false) {
              return Text(
                  "No data found because this API doesn't exist anymore.");
            }
            // If an error occurred while fetching

            if (snapshot.hasError) {
              return Text(snapshot.error.toString());
            }
            // Showing a loading sign when the work is in progress.
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
