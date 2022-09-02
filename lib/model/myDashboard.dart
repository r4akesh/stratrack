
class UserData{
   late String name;
   late String kickValue;

  UserData(String this.name, String this.kickValue);

   Map<String, dynamic> toJson() {
     final _data = <String, dynamic>{};
     _data['name'] = name;
     _data['kickValue'] = kickValue;

     return _data;
   }

   UserData.fromJson(Map<String, dynamic> json){
     name = json['name'];
     kickValue = json['kickValue'];

   }
}