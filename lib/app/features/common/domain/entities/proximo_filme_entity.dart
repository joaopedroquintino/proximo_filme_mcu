import 'package:equatable/equatable.dart';

class ProximoFilmeEntity extends Equatable {
  ProximoFilmeEntity({
    required this.daysUntil,
    required this.overview,
    required this.posterUrl,
    required this.releaseDate,
    required this.title,
    required this.type,
  });

  final int daysUntil;
  final String overview;
  final String posterUrl;
  final String releaseDate;
  final String title;
  final String type;

  @override
  List<Object?> get props => [
        daysUntil,
        overview,
        posterUrl,
        releaseDate,
        title,
        type,
      ];
}
