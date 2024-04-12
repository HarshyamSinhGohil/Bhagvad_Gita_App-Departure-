class BhagvadModel {
  final int id;
  final int chapter_id;
  final String chapter_name_eg;
  final String chapter_name_hn;
  final String image;
  final int total_verse;
  final List<Verses> verses;


  BhagvadModel({
    required this.id,
    required this.chapter_id,
    required this.chapter_name_eg,
    required this.chapter_name_hn,
    required this.image,
    required this.total_verse,
    required this.verses,

  });

  factory BhagvadModel.fromJson(Map map){
    return BhagvadModel(
      id: map['id'],
      chapter_id: map['chapter_id'],
      chapter_name_eg: map['chapter_name_eg'],
      chapter_name_hn: map['chapter_name_hn'],
      image: map['image'],
      total_verse: map['total_verse'],
      verses: List<Verses>.from(map["verses"].map((x) => Verses.fromJson(x))),


    );
  }
}



class Verses{
  final double verse_id;
  final String verse;
  final String commentary_eg;
  final String commentary_hn;

  Verses({
    required this.verse_id,
    required this.verse,
    required this.commentary_eg,
    required this.commentary_hn,});

  factory Verses.fromJson(Map map){
    return Verses(
      verse_id: map['verse_id'],
      verse: map['verse'],
      commentary_eg: map['commentary_eg'],
      commentary_hn: map['commentary_hn'],
    );
  }
}


class bookMark{
  final String? slock;
  bookMark({required this.slock});
}
List<bookMark>  bookMarkList=[];