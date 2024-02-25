class Donor {
  Donor({
    required this.image,
    required this.userName,
    required this.age,
    required this.email,
    required this.confirmPassword,
    required this.phoneNumber,
    required this.receipent_id,
    required this.blood,
    required this.weight,
    required this.height,
    required this.health_details,
    required this.organ,
    required this.consent,

  });
  late  String image;
  late  String userName;
  late  String age;
  late String email;
  late  String confirmPassword;
  late  String phoneNumber;
  late  String receipent_id;
  late String blood;
  late String weight;
  late String height;
  late String health_details;
  late String organ;
  late String consent;

// this function is for getting data from the server and converting it into dart-json to dart-object
  Donor.fromJson(Map<String, dynamic> json){
    image = json['image'] ?? '';
    userName = json['userName']  ??'';
    age = json['age'] ??'';
    email = json['email'] ??'';
    confirmPassword = json['confirmPassword'] ??'';
    phoneNumber = json['phoneNumber'] ??'';
    receipent_id = json['receipent_id'] ??'';
    blood = json['blood'] ??'';
    weight = json['weight'] ??'';
    height=json['height']??'';
    health_details = json['health_details'] ??'';
    organ=json['organ']??"";
    consent=json['consent']??"";
  }
  // this is used to add the data to server we pass the data from toJson
  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['image'] = image;
    _data['userName'] = userName;
    _data['age'] = age;
    _data['email'] = email;
    _data['confirmPassword'] = confirmPassword;
    _data['phoneNumber'] = phoneNumber;
    _data['receipent_id'] = receipent_id;
    _data['blood'] = blood;
    _data['weight'] = weight;
    _data['height']=height;
    _data['health_details'] = health_details;
    _data['organ']=organ;
    _data['consent']=consent;
    return _data;
  }
}