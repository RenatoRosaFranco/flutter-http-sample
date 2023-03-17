import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:sample/models/movie.dart';

Future<List<Movie>> fetchMovies() async {
  final response = await http.get(
    Uri.parse(
        'https://raw.githubusercontent.com/alura-cursos/obtendo_dados_com_flutter_http/main/filmes.json'
    )
  );

  if (response.statusCode == 200) {
    final json = jsonDecode(response.body);
    return List<Movie>.from(json.map((movie){
      return Movie.fromJson(movie);
    }));
  } else {
    return Future.error(
      'Ops! um erro ocorreu.'
    );
  }
}