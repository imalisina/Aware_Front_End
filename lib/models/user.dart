class User {
  // Define properties of User model
  late String fullName,
      email,
      phoneNumber,
      password,
      weight,
      height,
      zipCode,
      address,
      birthDate,
      secureCode;

  late String? diaryPassword;

  late int genderID,
      ethnicityID,
      favouriteFashionStyleID,
      countryID,
      stateID,
      birthDay,
      birthMonth;

  late bool secureDiary;

  // Initialize values to each property
  User() {
    fullName = data["fullName"] as String;
    email = data["email"] as String;
    phoneNumber = data["phoneNumber"] as String;
    password = data["password"] as String;
    weight = data["weight"] as String;
    height = data["height"] as String;
    zipCode = data["zipCode"] as String;
    address = data["address"] as String;
    genderID = data["genderID"] as int;
    ethnicityID = data["ethnicityID"] as int;
    favouriteFashionStyleID = data["favouriteFashionStyleID"] as int;
    countryID = data["countryID"] as int;
    stateID = data["stateID"] as int;
    birthDate = data["birthDate"] as String;
    birthDay = data["birthDay"] as int;
    birthMonth = data["birthMonth"] as int;
    secureCode = data["secureCode"] as String;
    secureDiary = data["secureDiary"] as bool;
    diaryPassword = data["diaryPassword"] as String;
  }
}

// User JSON data
const data = {
  "fullName": "Tracy Caller",
  "email": "callertracy@gmail.com",
  "phoneNumber": "+905348310054",
  "password": "helloworld123@#",
  "weight": "83",
  "height": "179",
  "zipCode": "613AG831",
  "address": "Havelock city, Peterson Tower, 10-4",
  "genderID": 0,
  "ethnicityID": 0,
  "favouriteFashionStyleID": 2,
  "countryID": 35,
  "stateID": 2,
  "birthDate": "29/01/1998",
  "birthDay": 29,
  "birthMonth": 01,
  "secureCode": "19SJ@#o1McID_Ld!3d",
  "secureDiary": false,
  "diaryPassword": "123456789password"
};
