import 'package:flutter/material.dart';
import 'package:sample/components/list_movies.dart';
import 'package:sample/models/movie.dart';
import 'package:sample/repositories/repository.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Future<List<Movie>>? movieFuture;

  @override
  void initState() {
    movieFuture = fetchMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Netflix'.toUpperCase(),
            style: const TextStyle(color: Colors.red,
            fontSize: 25.0)),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () => showDialog<String>(
              context: context,
              builder: (BuildContext context) => AlertDialog(
                title: Center(child: Text('Em breve'.toUpperCase())),
                content: SingleChildScrollView(
                  child: ListBody(
                    children: const <Widget>[
                      Text('This is a demo alert dialog'),
                      Text('Would you like to approve this message'),
                    ],
                  ),
                ),
                actions: [
                  TextButton(
                    child: const Text('Close'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  ),
                  TextButton(
                    child: const Text('Approve'),
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                  )
                ],
              ),
            ),
          )
        ],
      ),
      drawer: const Drawer(),
      body: FutureBuilder(
          future: movieFuture,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              final movies = snapshot.data as List<Movie>;
              return ListMovies(movies: movies);
            } else if (snapshot.hasError) {
              return Center(
                child: Text(
                  snapshot.error.toString(),
                  style: const TextStyle(
                      fontSize: 16
                  ),
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
      ),
    );
  }
}
