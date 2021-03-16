class Students{
  String name;
  String picture;
  String teacher;
  String department;
  String uid;
  int phone;
  int semester;
  Map sem1;
  Map sem2;
  Map sem3;
  Map sem4;
  Map sem5;
  Map sem6;
  Map sem7;
  Map sem8;

  Students({this.name,this.uid,this.picture,this.teacher,this.semester,
  this.department,this.phone,this.sem1,this.sem2,this.sem3,this.sem4,this.sem5,this.sem6,this.sem7,this.sem8});

  factory Students.initialData() {
    return Students(
      name:"",
      picture:"",
      teacher:"",
      department:"",
      uid:"",
      phone:null,
      semester: null,
      sem1:null,
      sem2:null,
      sem3:null,
      sem4:null,
      sem5:null,
      sem6:null,
      sem7:null,
      sem8:null,
    );
  }
}
