class ResponseForRequast{
   String id='';
  String massege='';

  ResponseForRequast.fromJsonn(Map<String,dynamic>json){
    id=json['id'];
    massege=json['message'];
  }
}