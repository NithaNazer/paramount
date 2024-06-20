class gettypes{
  String id;
  String name;
  String photo;
  String categoryid;
  String categoryname;
  String status;
  gettypes(this.id,this.name,this.photo,this.categoryid,this.categoryname,this.status);
}


class TypeImodel{
  String id;
  String photo;
  TypeImodel(this.id,this.photo);
}

class RegistrationModel{
  String id;
  String name;
  String phone;
  String status;
  RegistrationModel(this.id,this.name,this.phone,this.status);
}


class UserModel{
  String id;
  String name;
  String phone;
  String status;
  UserModel(this.id,this.name,this.phone,this.status);
}

class categorymodel{
  String id;
  String name;
  categorymodel(this.id,this.name);
}

// class getplot{
//   String option;
//   String plotid;
//   String plotphoto;
//   String plotLandmark;
//   String plotArea;
//   String plotprice;
//   String plotDescription;
//   String plotAddress;
//   String plotContactnumber;
//   String typeid;
//   String type;
//   getplot(this.plotid,this.plotphoto,this.plotLandmark,this.plotArea,this.plotprice,this.plotDescription,this.plotAddress,this.plotContactnumber,this.option,this.typeid,this.type);
// }


class gethouse {
  String housephoto;
  String houseid;
  String housename;
  String houselocation;
  String houseprice;
  String housedescription;
  String housenoofbedrooms;
  String housenoofbathrooms;
  String houseparking;
  String housecontact;
  String option;
  String typeid;
  String type;
gethouse(this.housephoto,this.houseid,this.housename,this.houselocation,this.houseprice,this.housedescription,this.housenoofbedrooms,this.housenoofbathrooms,this.houseparking,this.housecontact,this.option,this.typeid,this.type);
}


class getconv {
  List<dynamic> photo=[];
  String convid;
  String convdescription;
  String convaddress;
  String convprice;
  String typeid;
  String type;
  getconv(this.photo,this.convid,this.convdescription,this.convaddress,this.convprice,this.typeid,this.type);
}


class Bookdetail{
  String id;
  String book_name;
  String book_phone;
  String book_date;
  String book_time;
  String userid;
  String typeid;
  String type;
  String houseid;
  String convid;
  Bookdetail(this.id,this.book_name,this.book_phone,this.book_date,this.book_time,this.userid,this.typeid,this.type,this.houseid,this.convid);
}


// class Editlist{
//   String id;
//   String name1;
//   String phone1;
//   String date;
//   Editlist(this.id,this.name1,this.phone1,this.date);
// }






