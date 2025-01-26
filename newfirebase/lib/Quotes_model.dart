class QuotesMainModel{

  int?limit;
  int?skip;
  int?total;
  List<QuotesDataModel>?quotes;

  QuotesMainModel({this.limit,this.quotes,this.skip,this.total});

  factory QuotesMainModel.fromJson(Map<String,dynamic>json){
    List<QuotesDataModel> mQuotes=[];
    for(Map<String,dynamic> eachData in json['quotes']){
      mQuotes.add(QuotesDataModel.fromJson(eachData));
    }
    return QuotesMainModel(
      limit: json['limit'],
      skip: json['skip'],
      total: json['total'],
      quotes:mQuotes,
      //quotes: (json['quotes'] as List).map((e) => QuotesDataModel.fromJson(e)).toList(),
    );
  }


}

class QuotesDataModel{
  String?author;
  int?id;
  String?quote;
  QuotesDataModel({this.author,this.id,this.quote});

  factory QuotesDataModel.fromJson(Map<String,dynamic>json){
    return QuotesDataModel(
      quote: json['quote'],
      author: json['author'],
      id: json['id'],
    );
  }
}