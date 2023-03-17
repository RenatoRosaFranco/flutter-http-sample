// frozen_string_literal: true

class Movie {
  String name;
  String image;

  Movie({
    required this.name,
    required this.image
  });

  Movie.fromJson(Map<String, dynamic> json)
    : name  = json['nome'] as String,
      image = json['imagem'] as String;
}