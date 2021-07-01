import 'package:proximo_filme_mcu/app/features/common/domain/entities/proximo_filme_entity.dart';

class ProximoFilmeModel extends ProximoFilmeEntity {
  ProximoFilmeModel({
    required int daysUntil,
    required String overview,
    required String posterUrl,
    required String releaseDate,
    required String title,
    required String type,
  }) : super(
          daysUntil: daysUntil,
          overview: overview,
          releaseDate: releaseDate,
          title: title,
          posterUrl: posterUrl,
          type: type,
        );

  factory ProximoFilmeModel.fromMap(Map<String, dynamic> map) {
    return ProximoFilmeModel(
      daysUntil: map['days_until'],
      overview: map['overview'],
      posterUrl: map['poster_url'],
      releaseDate: map['release_date'],
      title: map['title'],
      type: map['type'],
    );
  }
}
