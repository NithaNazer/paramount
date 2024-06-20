import 'dart:collection';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:project/Provider/Login%20Provider.dart';
import 'package:provider/provider.dart';

import '../modelclass/modelclass.dart';

class Mainprovider with ChangeNotifier {

  final FirebaseFirestore db = FirebaseFirestore.instance;
  Reference ref = FirebaseStorage.instance.ref();

  String categorytypesid = "";


  File? TypeaddImg = null;
  String Image = '';
  TextEditingController Typecontroller = TextEditingController();
  TextEditingController categoryct = TextEditingController();
  TextEditingController statusct = TextEditingController();


  bool typeloader = false;

  Future<void> addtype(String from, String oldid) async {
    typeloader = true;
    notifyListeners();
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>map = HashMap();

    map["TYPE_NAME"] = Typecontroller.text;
    map["CATEGORY_NAME"] = categoryct.text;
    map["CATEGORY_ID"] = categorytypesid;
    map["STATUS"] = statusct.text;

    if (from == "NEW") {
      map["TYPE_ID"] = id;
    }

    if (TypeaddImg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(TypeaddImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["Photo"] = value;

          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['photo'] = Image;
    }
    if (from == "EDIT") {
      db.collection("TYPE").doc(oldid).update(map);
    } else {
      db.collection("TYPE").doc(id).set(map);
    }
    typeloader = false;
    notifyListeners();
    getType();
    notifyListeners();
  }

  void setImage(File image) {
    TypeaddImg = image;
    notifyListeners();
  }


  Future getImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      TypeaddImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void typesclear() {
    Typecontroller.clear();
    TypeaddImg = null;
    Image = "";
    categoryct.clear();
    statusct.clear();
  }


  bool gettypeloader = false;
  List<gettypes>TypeList = [
  ];
  void getType() {
    notifyListeners();
    db.collection("TYPE").get().then((value) {
      TypeList.clear();
      if (value.docs.isNotEmpty) {
        TypeList.clear();
        for (var element in value.docs) {
          Map <dynamic,dynamic> typeMap = element.data() as Map;
          TypeList.add(gettypes(element.id,
              typeMap["TYPE_NAME"].toString(),
              typeMap["Photo"].toString(),
              typeMap["CATEGORY_ID"].toString()
              , typeMap["CATEGORY_NAME"].toString(),
              typeMap["STATUS"].toString()
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }


 
  void getbuyType(String cateid,String from) {
    // notifyListeners();
    var ref;
    if(from == "buy"){
      ref= db.collection("TYPE").where("CATEGORY_NAME", isEqualTo: "Buy").where("CATEGORY_ID",isEqualTo: cateid);
    }
    else{
      ref=  db.collection("TYPE");

    }
    ref.get().then((value) {
      TypeList.clear();
      if (value.docs.isNotEmpty) {
        print('vgashjabsd');

        for (var element in value.docs) {
          Map <dynamic,dynamic> typeMap = element.data() as Map;
          TypeList.add(gettypes(element.id,
              typeMap["TYPE_NAME"].toString(),
              typeMap["Photo"].toString(),
              typeMap["CATEGORY_ID"].toString()
              , typeMap["CATEGORY_NAME"].toString(),
              typeMap["STATUS"].toString()
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }






  File? IaddImg = null;
  String image = '';


  Future<void> addsubtype() async {
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>map = HashMap();
    map["I_TYPE_ID"] = id;


    if (IaddImg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(IaddImg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          map["IPhoto"] = value;

          // categorymap["id photo"] = photoId;
          // editMap['IMAGE_URL'] = value;
          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      map['IPhoto'] = Image;
    }
    db.collection("ITYPE").doc(id).set(map);
    getsubtype();
  }

  void setIImage(File image) {
    IaddImg = image;
    notifyListeners();
  }


  Future getIImggallery() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      cropIImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future getIImgcamera() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      cropIImage(pickedImage.path, "");
    } else {
      print('No image selected.');
    }
  }

  Future<void> cropIImage(String path, String from) async {
    final croppedFile = await ImageCropper().cropImage(
      sourcePath: path,
      aspectRatioPresets: Platform.isAndroid
          ? [
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio16x9,
      ]
          : [
        CropAspectRatioPreset.original,
        CropAspectRatioPreset.square,
        CropAspectRatioPreset.ratio3x2,
        CropAspectRatioPreset.ratio4x3,
        CropAspectRatioPreset.ratio5x3,
        CropAspectRatioPreset.ratio5x4,
        CropAspectRatioPreset.ratio7x5,
        CropAspectRatioPreset.ratio16x9,
        CropAspectRatioPreset.ratio16x9
      ],
      uiSettings: [
        AndroidUiSettings(
            toolbarTitle: 'Cropper',
            toolbarColor: Colors.white,
            toolbarWidgetColor: Colors.black,
            initAspectRatio: CropAspectRatioPreset.original,
            lockAspectRatio: false),
        IOSUiSettings(
          title: 'Cropper',
        )
      ],
    );
    if (croppedFile != null) {
      IaddImg = File(croppedFile.path);
      // print(Registerfileimg.toString() + "fofiifi");
      notifyListeners();
    }
  }

  void Icategoryclear() {
    Typecontroller.clear();
    IaddImg = null;
    Image = "";
  }


  List<TypeImodel>TypeIList = [];

  void getsubtype() {
    db.collection("ITYPE").get().then((value) {
      if (value.docs.isNotEmpty) {
        TypeIList.clear();
        for (var element in value.docs) {
          TypeIList.add(
              TypeImodel(element.id, element.get("IPhoto").toString()));
          // HashMap<String,dynamic> map = HashMap();
          // TypeIList.add(TypeImodel(
          //   map["I_TYPE_ID"].toString(),
          //   map["Photo"].toString(),
          // ));
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }


  TextEditingController RegisterNamecontroller = TextEditingController();
  TextEditingController RegisterPhonecontroller = TextEditingController();

  void AddRegistration() {
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>registermap = HashMap();
    registermap["STATUS"] = "Request";
    registermap["REGISTERID"] = "id";
    registermap["REGISTERNAME"] = RegisterNamecontroller.text;
    registermap["REGISTERPHONE"] = RegisterPhonecontroller.text;

    db.collection("Registration").doc(id).set(registermap);
  }


  // String name1 = "";
  // String Id = "";
  // String Phone = "";



  // void getUser(String userid) {
  //   print("user = $userid");
  //   db.collection("Registration").where("user_id", isEqualTo: userid)
  //       .get()
  //       .then((value) {
  //     print("22222222222222222222");
  //     print(value.toString());
  //     if (value.docs.isNotEmpty) {
  //       print("33333333333333333333333");
  //       for (var value in value.docs) {
  //         Map<String, dynamic> map = value.data();
  //         Id = value.id;
  //         name1 = map["REGISTERNAME"].toString();
  //         Phone = map["REGISTERPHONE"].toString();
  //
  //         //photo = map["PHOTO"] ?? "";
  //         // imageUrl7 = map["PHOTO"] ?? "";
  //         RegisterNamecontroller.text = name1;
  //         RegisterPhonecontroller.text = Phone;
  //         print("name = $name1 \n phone = $Phone");
  //         // usersList.add(usersModel(
  //         //     value.get("Name"), value.get("Addres"), value.id,
  //         //     value.get("Phone")));
  //         notifyListeners();
  //       }
  //       notifyListeners();
  //     }
  //     notifyListeners();
  //     });
  //   }

  int selectedIndex = 0;

  void onItemTapped(int index) {
    selectedIndex = index;
    notifyListeners();
    }





  List<RegistrationModel>RegistrstionList = [];

  void GetRegistration() {
    db.collection("Registration").where("STATUS", isEqualTo: "Request")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        RegistrstionList.clear();
        for (var element in value.docs) {
          RegistrstionList.add(RegistrationModel(
              element.id, element.get("REGISTERNAME").toString(),
              element.get("REGISTERPHONE").toString(),
              element.get("STATUS").toString()));
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }

  void signupclear() {
    RegisterNamecontroller.clear();
    RegisterPhonecontroller.clear();
  }


  void statusapprove(String id, String name, String phone,
      BuildContext context) {
    HashMap<String, dynamic> cusdata = HashMap();
    HashMap<String, dynamic> usermap = HashMap();
    cusdata["STATUS"] = "APPROVED";
    db.collection("Registration").doc(id).set(cusdata, SetOptions(merge: true));
    usermap["user_id"] = id;
    usermap["user_Name"] = name;
    usermap["Phone_Number"] = "+91$phone";
    usermap["Type"] = "User";
    db.collection("USERS").doc(id).set(usermap);
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Approved Successfully"),
          backgroundColor: Colors.green,
        ));
    GetRegistration();
    notifyListeners();
  }

  void statusreject(String id, BuildContext context) {
    HashMap<String, dynamic>rejectmap = HashMap();
    rejectmap["STATUS"] = "REJECTED";
    db.collection("Registration").doc(id).set(
        rejectmap, SetOptions(merge: true));
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Rejected Successfully"),
          backgroundColor: Colors.red,
        ));
    GetRegistration();
    notifyListeners();
  }


  void GetCustomers() {
    db.collection("Registration").where("STATUS", isEqualTo: "APPROVED")
        .get()
        .then((value) {
      if (value.docs.isNotEmpty) {
        RegistrstionList.clear();
        for (var element in value.docs) {
          RegistrstionList.add(RegistrationModel(
              element.id, element.get("REGISTERNAME").toString(),
              element.get("REGISTERPHONE").toString(),
              element.get("STATUS").toString()));
          notifyListeners();
        }
      }
    });
    notifyListeners();
  }

  bool categoryloader = false;

  TextEditingController BRTypecontroller = TextEditingController();

  Future<void> addcategory(String from, String oldid) async {
    categoryloader = true;
    notifyListeners();
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>BRmap = HashMap();

    BRmap["Category_Name"] = BRTypecontroller.text;

    if (from == "NEW") {
      BRmap["Category_Id"] = id;
    }
    if (from == "EDIT") {
      db.collection("Category").doc(oldid).set(BRmap);
    } else {
      db.collection("Category").doc(id).set(BRmap);
    }
    categoryloader = false;
    notifyListeners();

    getcategory();
    notifyListeners();
  }


  bool getcategoryloader = false;
  List<categorymodel>BRaddList = [];

  void getcategory() {
    getcategoryloader = true;
    notifyListeners();
    db.collection("Category").get().then((value) {
      if (value.docs.isNotEmpty) {
        getcategoryloader = false;
        notifyListeners();
        BRaddList.clear();
        for (var element in value.docs) {
          BRaddList.add(categorymodel(
            element.id, element.get("Category_Name").toString(),));
          notifyListeners();
        }
      }
    });
  }


  void editcategory(String id) {
    db.collection("Category").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        BRTypecontroller.text = map["Category_Name"].toString();
        notifyListeners();
      }
    }
    );
  }


  void deletecategory(id, BuildContext context) {
    print("hhhhhh" + id);
    db.collection("Category").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Successfully"),
          backgroundColor: Colors.indigo,
        ));
    notifyListeners();
    getcategory();
  }


  void edittype(String id) {
    db.collection("TYPE").doc(id).get().then((value) {
      if (value.exists) {
        Map<dynamic, dynamic> map = value.data() as Map;
        Typecontroller.text = map["TYPE_NAME"].toString();
        Image = map["Photo"];
        notifyListeners();
      }
    }
    );
  }

  void deleteType(id, BuildContext context) {
    print("hhhhhh" + id);
    db.collection("TYPE").doc(id).delete();
    ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Delete Successfully"),
          backgroundColor: Colors.indigo,
        ));
    notifyListeners();
    getType();
  }


  /// house
  TextEditingController HouseNameController = TextEditingController();
  TextEditingController HouseLocationController = TextEditingController();
  TextEditingController HousePriceController = TextEditingController();
  TextEditingController HouseDescriptionController = TextEditingController();
  TextEditingController HouseBedroomsController = TextEditingController();
  TextEditingController HouseBathroomsController = TextEditingController();
  TextEditingController HouseParkingController = TextEditingController();
  TextEditingController HouseContactController = TextEditingController();

  ///convention
  TextEditingController conventionDescriptionController = TextEditingController();
  TextEditingController conventionAddressController = TextEditingController();
  TextEditingController conventionPriceController = TextEditingController();


  ///plot
  TextEditingController plotLandmarkController = TextEditingController();
  TextEditingController plottAreaController = TextEditingController();
  TextEditingController plotPricecontroller = TextEditingController();
  TextEditingController plotDescriptionController = TextEditingController();
  TextEditingController plotAddressController = TextEditingController();
  TextEditingController plotContactController = TextEditingController();


  // radiobutton
  String checkvalue = "";

  void buyorrent(String? val) {
    checkvalue = val!;
    notifyListeners();
  }

  File? subtypefileimg = null;
  String sfileimg = '';


  List<gettypes>houselist = [
  ];


  Future<void> addhouse(String typeId,String typename) async {
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>housemap = HashMap();
    housemap["TYPE_ID"] = typeId;
    housemap["PROPERTY_ID"] = id;
    housemap["PROPERTY_NAME"] = HouseNameController.text;
    housemap["PROPERTY_LOCATION"] = HouseLocationController.text;
    housemap["PROPERTY_PRICE"] = HousePriceController.text;
    housemap["PROPERTY_DESCRIPTION"] = HouseDescriptionController.text;
    housemap["PROPERTY_BEDROOMS"] = HouseBedroomsController.text;
    housemap["PROPERTY_BATHROOMS"] = HouseBathroomsController.text;
    housemap["PROPERTY_PARKING"] = HouseParkingController.text;
    housemap["PROPERTY_CONTACT"] = HouseContactController.text;
    housemap["PROPERTY_TYPE"] = typename;
    housemap["OPTION"] = checkvalue;

    if (subtypefileimg != null) {
      String photoId = DateTime
          .now()
          .millisecondsSinceEpoch
          .toString();
      ref = FirebaseStorage.instance.ref().child(photoId);
      await ref.putFile(subtypefileimg!).whenComplete(() async {
        await ref.getDownloadURL().then((value) {
          housemap["PHOTO"] = value;

          notifyListeners();
        });
        notifyListeners();
      });
      notifyListeners();
    } else {
      housemap['PHOTO'] = sfileimg;
    }
    db.collection("SUB_TYPES").doc(id).set(housemap);
  }

  void setIImages(File image) {
    subtypefileimg = image;
    notifyListeners();
  }


  Future getIImggallerys() async {
    final imagePicker = ImagePicker();
    final pickedImage =
    await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      setIImages(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }

  Future getIImgcameras() async {
    final imgPicker = ImagePicker();
    final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      setIImages(File(pickedImage.path));
    } else {
      print('No image selected.');
    }
  }


  void houseclear() {
    subtypefileimg = null;
    sfileimg = "";
    HouseNameController.clear();
    HouseLocationController.clear();
    HouseLocationController.clear();
    HousePriceController.clear();
    HouseDescriptionController.clear();
    HouseBedroomsController.clear();
    HouseBathroomsController.clear();
    HouseParkingController.clear();
    HouseContactController.clear();
    checkvalue = "";
  }


  List<gethouse>Typehouse = [
  ];
  void gethouseType(String typeId,String from) {
    print('ghjk   $typeId');
    notifyListeners();
    db.collection("SUB_TYPES")
    .where("TYPE_ID",isEqualTo: typeId)
    .where("OPTION",isEqualTo: from)
        .get().then((value) {
          Typehouse.clear();
      if (value.docs.isNotEmpty) {
        print('ghjk   $typeId');
        for (var element in value.docs) {
           Map<String ,dynamic> getmap=element.data();
          Typehouse.add(gethouse(
            getmap["PHOTO"].toString(),
            element.id,
            getmap["PROPERTY_NAME"].toString(),
            getmap["PROPERTY_LOCATION"].toString(),
            getmap["PROPERTY_PRICE"].toString(),
            getmap["PROPERTY_DESCRIPTION"].toString(),
            getmap["PROPERTY_BEDROOMS"].toString(),
            getmap["PROPERTY_BATHROOMS"].toString(),
            getmap["PROPERTY_PARKING"].toString(),
            getmap["PROPERTY_CONTACT"].toString(),
            getmap["OPTION"].toString(),
            getmap["PROPERTY_TYPE"].toString(),
            getmap["TYPE_ID"].toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }




  String conImage = '';
  File? fileImage;
  List<File> fileImageList = [];

  Future<void> addConvtype(String typeId,String typename) async {
    notifyListeners();
    String id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();
    HashMap<String, dynamic>conmap = HashMap();
    // HashMap<String, Object> ImageMap = HashMap();
    List<String> dum =[];

    conmap["CONV_ID"] = id;
    conmap["TYPE_ID"] = typeId;
    conmap["DESCRIPTION"] = conventionDescriptionController.text;
    conmap["ADDRESS"] = conventionAddressController.text;
    conmap["PRICE"] = conventionPriceController.text;
    // conmap["TIME"] = DateTime.now();
    conmap["TYPE"] = typename;

    if (fileImageList.isNotEmpty) {
      int k = 0;

      for (File i in fileImageList) {
        k++;
        String imgKey = "Image$k";
        String time = DateTime.now().millisecondsSinceEpoch.toString();
        ref =FirebaseStorage.instance.ref().child(time);
        await ref.putFile(i).whenComplete(() async {
          await ref.getDownloadURL().then((value) async {
            // conmap[imgKey] = value;
            dum.add(value);
            notifyListeners();
            print(value.toString()+"kwejkew");
          });
        });
      }
    } else {
    }

    conmap["PHOTO"] = dum;
    notifyListeners();
    db.collection("SUB_TYPES").doc(id).set(conmap,SetOptions(merge: true));
  }


    Future getConvImggallery() async {
      final imagePicker = ImagePicker();
      final pickedImage =
      await imagePicker.pickImage(source: ImageSource.gallery);

      if (pickedImage != null) {
        CarouselcropImage(pickedImage.path, "");
      } else {
        print('No image selected.');
      }
    }

    Future getConvImgcamera() async {
      final imgPicker = ImagePicker();
      final pickedImage = await imgPicker.pickImage(source: ImageSource.camera);

      if (pickedImage != null) {
        CarouselcropImage(pickedImage.path, "");
      } else {
        print('No image selected.');
      }
    }

    Future<void> CarouselcropImage(String path, String from) async {
      final croppedFile = await ImageCropper().cropImage(
        sourcePath: path,
        aspectRatioPresets: Platform.isAndroid
            ? [
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio16x9,
        ]

            : [
          CropAspectRatioPreset.original,
          CropAspectRatioPreset.square,
          CropAspectRatioPreset.ratio3x2,
          CropAspectRatioPreset.ratio4x3,
          CropAspectRatioPreset.ratio5x3,
          CropAspectRatioPreset.ratio5x4,
          CropAspectRatioPreset.ratio7x5,
          CropAspectRatioPreset.ratio16x9,
          CropAspectRatioPreset.ratio16x9
        ],
        uiSettings: [
          AndroidUiSettings(
              toolbarTitle: 'Cropper',
              toolbarColor: Colors.white,
              toolbarWidgetColor: Colors.black,
              initAspectRatio: CropAspectRatioPreset.original,
              lockAspectRatio: false),
          IOSUiSettings(
            title: 'Cropper',
          )
        ],
      );
      if (croppedFile != null) {
        fileImage = File(croppedFile.path);
        fileImageList.add(fileImage!);
        print(fileImageList.length.toString());
        notifyListeners();
      }
    }

    void convclear() {
    fileImage = null;
     conImage = "";
    fileImageList=[];
    conventionDescriptionController.clear();
    conventionAddressController.clear();
    conventionPriceController.clear();
    checkvalue = "";
  }


  List<getconv>subconv=[];
  void getsubtypecon(String typeid){
    print("typeid : $typeid");
    db.collection("SUB_TYPES").where("TYPE_ID",isEqualTo:typeid ).get().then((value) {
      if (value.docs.isNotEmpty) {
        subconv.clear();
        for (var element in value.docs) {
          Map <dynamic,dynamic> map = element.data()as Map ;
          subconv.add(getconv(
            map["PHOTO"],
            element.id,
            map["DESCRIPTION"].toString(),
            map["ADDRESS"].toString(),
            map["PRICE"].toString(),
            map["TYPE_ID"].toString(),
            map["TYPE"].toString(),
          ));
          notifyListeners();
        }
      }
      notifyListeners();
    });
  }


  Future<void> selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(2023),
      lastDate: DateTime(2100),
    );

    if (picked != null) {
      _date = picked;
      scheduledDate = DateTime(_date.year, _date.month, _date.day);
      BOOKED_DATEcontroller.text = outputDateFormat.format(scheduledDate);
      notifyListeners();
    }
  }

  Future<void> selectTime(BuildContext context) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: _time,
    );

    if (picked != null) {
      _time = picked;
      scheduledDayNode =
          _date.year.toString() + '/' + _date.month.toString() + '/' +
              _date.day.toString();
      scheduledTime = DateTime(
          _date.year, _date.month, _date.day, _time.hour, _time.minute);
      BOOKED_TIMEcontroller.text = outputTimeFormat.format(scheduledTime);
      notifyListeners();
    }
    }

  TimeOfDay _time = TimeOfDay.now();
  DateTime _date = DateTime.now();
  DateTime scheduledTime = DateTime.now();
  DateTime scheduledDate = DateTime.now();
  String scheduledDayNode = "";
  var outputDateFormat = DateFormat('dd/MM/yyyy');
  var outputTimeFormat = DateFormat('hh:mm a');
  TextEditingController BOOKED_NAMEcontroller=TextEditingController();
  TextEditingController BOOKED_PHONEcontroller=TextEditingController();
  TextEditingController BOOKED_DATEcontroller=TextEditingController();
  TextEditingController BOOKED_TIMEcontroller=TextEditingController();
String detailsid="";




  void ADDDETAIL(BuildContext context,String typeid,String type,String houseid,){
    LoginProvider loginProvider=Provider.of<LoginProvider>(context,listen: false);
    DateTime top=DateTime.now();
    detailsid=top.microsecondsSinceEpoch.toString();
    HashMap<String,Object>map=HashMap();
    map["BOOKED_NAME"]=BOOKED_NAMEcontroller.text.toString();
    map["BOOKED_PHONE"]=BOOKED_PHONEcontroller.text.toString();
    map["BOOKED_DATE"]=BOOKED_DATEcontroller.text.toString();
    map["BOOKED_TIME"]=BOOKED_TIMEcontroller.text.toString();
    map["DETAIL_ID"]=detailsid;
    map["USER_ID"]=loginProvider.userId;
    map["TYPE_NAME"]=type;
    map["TYPE_ID"]=typeid;
    map["HOUSE_ID"]=houseid;
    db.collection("BOOKING_DETAILS").doc(detailsid).set(map);
  }


  void ADDCONVDETAIL(BuildContext context,String typeid,String type,String convid,){
    LoginProvider loginProvider=Provider.of<LoginProvider>(context,listen: false);
    DateTime top=DateTime.now();
    detailsid=top.microsecondsSinceEpoch.toString();
    HashMap<String,Object>map=HashMap();
    map["BOOKED_NAME"]=BOOKED_NAMEcontroller.text.toString();
    map["BOOKED_PHONE"]=BOOKED_PHONEcontroller.text.toString();
    map["BOOKED_DATE"]=BOOKED_DATEcontroller.text.toString();
    map["BOOKED_TIME"]=BOOKED_TIMEcontroller.text.toString();
    map["DETAIL_ID"]=detailsid;
    map["USER_ID"]=loginProvider.userId;
    map["TYPE_NAME"]=type;
    map["TYPE_ID"]=typeid;
    map["CONV_ID"]=convid;
    db.collection("BOOKING_DETAILS").doc(detailsid).set(map);
  }


  void bookingclear() {
    BOOKED_NAMEcontroller.clear();
    BOOKED_PHONEcontroller.clear();
    BOOKED_DATEcontroller.clear();
    BOOKED_TIMEcontroller.clear();
  }


  //
  // List<Bookdetail>Booklist=[];
  // List<Editlist> USER_DATA=[];
  // void get_DETAIL(String userid){
  //   db.collection("BOOKING_DETAIL").get().then((value1) {
  //     Booklist.clear();
  //     if (value1.docs.isNotEmpty) {
  //       List<String> mobile_List=[];
  //       String user = "";
  //       for (var value in value1.docs) {
  //         Booklist.add(Bookdetail(value.id,
  //             value.get("BOOKED_NAME").toString(),value.get("BOOKED_PHONE").toString(),
  //             value.get("BOOKED_DATE").toString(), value.get("BOOKED_TIME").toString(),
  //             value.get("USER_ID").toString()
  //         ));
  //         notifyListeners();
  //         user = value.get("USER_ID").toString();
  //
  //         db.collection("BOOKING_DETAILS").doc(user).get().then((value){
  //           if (value.exists){
  //             Map<dynamic, dynamic>map = value.data() as Map;
  //             USER_DATA.add(Editlist(
  //               map['USER_ID'].toString(),
  //               map['NAME'].toString(),
  //               map['MOBILE_NUMBER'].toString(),
  //             ));
  //             notifyListeners();
  //           }
  //         });
  //         notifyListeners();
  //       }
  //     }
  //     notifyListeners();
  //   });
  // }
  List<Bookdetail> Booklist = [];
  // List<Editlist> USER_DATA = [];
  void get_DETAIL(String houseid,String convid) {
    db.collection("BOOKING_DETAILS").get().then((value1) {
      Booklist.clear();
      if (value1.docs.isNotEmpty) {
        // USER_DATA.clear();
        for (var element in value1.docs) {
          Map<String,dynamic>getmap=element.data();
          Booklist.add(Bookdetail(
            element.id,
            getmap['BOOKED_NAME'].toString()??"",
            getmap['BOOKED_PHONE'].toString()??"",
            getmap['BOOKED_DATE'].toString()??"",
            getmap['BOOKED_TIME'].toString()??"",
            getmap['USER_ID'].toString()??"",
            getmap['TYPE_ID'].toString()??"",
            getmap['TYPE_NAME'].toString()??"",
            getmap['HOUSE_ID'].toString()??"",
            getmap['CONV_ID'].toString()??"",
            //

          ));
        }
        notifyListeners();
      }
    }
    );
    notifyListeners();
  }
  
  
  
}



  // Map<dynamic, dynamic>booking_map={};
  // void GETadmin_BOOKING(String Bid) {
  //   db.collection("BOOKING_DETAILS").doc(Bid).get().then((value) {
  //     if (value.exists) {
  //       booking_map = value.data() as Map;
  //       // placesController.text =booking_map["TYPE_NAME"].toString();
  //       BOOKED_NAMEcontroller.text = booking_map["BOOKED_NAME"].toString();
  //       BOOKED_PHONEcontroller.text = booking_map["BOOKED_PHONE"].toString();
  //       BOOKED_DATEcontroller.text = booking_map["BOOKED_DATE"].toString();
  //       BOOKED_TIMEcontroller.text = booking_map["BOOKED_TIME"].toString();
  //       notifyListeners();
  //     }
  //     });
  // }







