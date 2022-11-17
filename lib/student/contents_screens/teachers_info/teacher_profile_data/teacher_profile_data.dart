class TeacherProfileViewDataModel {
  final String teacherName;
  final String subject;
  final String mobileNum;
  final String email;

  TeacherProfileViewDataModel(
    this.teacherName,
    this.subject,
    this.mobileNum,
    this.email,
  );
}

List<TeacherProfileViewDataModel> teachersList = [
  TeacherProfileViewDataModel(
      'Sheena M', 'Computer Science', "9887766554", 'sheenam@gmail.com'),
  TeacherProfileViewDataModel(
      'Sharath V', 'Chemistry', "9988776655", 'sharathv@gmail.com'),
  TeacherProfileViewDataModel(
      'Fabina MK', 'Mathematics', "9998887776", 'fabinamk@gmail.com'),
  TeacherProfileViewDataModel(
      'Sunitha VM', 'Language', "9998979695", 'sunithavm@gmail.com'),
  TeacherProfileViewDataModel(
      'Farzin P', 'Physics', "9080706050", 'farzinp@gmail.com'),
  TeacherProfileViewDataModel(
      'Ashiya MK', 'English', "9192939495", 'ashiyamk@gmail.com'),
];
