class AniMemesModel {
  final String _title;
  final String _imgUrl;

  String get title => _title;
  String get imgUrl => _imgUrl;

  const AniMemesModel._(this._title, this._imgUrl);

  factory AniMemesModel.fromJSON(Map<String, dynamic> json) => AniMemesModel._(
        json['title'],
        json['url'],
      );

  @override
  String toString() => "AniMemesModel(title: $title, imgUrl: $imgUrl)";
}
