class StudentListViewDataModel {
  final String firstName;
  final String lastName;
  final String registerNum;
  final int admissionNum;
  final String dateOfBirth;
  final String department;
  final String email;
  final String parentInfo;
  final int mobileNum;

  StudentListViewDataModel(
    this.firstName,
    this.lastName,
    this.registerNum,
    this.admissionNum,
    this.dateOfBirth,
    this.department,
    this.email,
    this.parentInfo,
    this.mobileNum,
  );
}

List<StudentListViewDataModel> studentList = [
  StudentListViewDataModel(
    'Jabir',
    'MK',
    'GVATCS024',
    000001,
    '01 Dec 2000',
    'Computer Science',
    'jabirmk@gmail.com',
    'Zainul Habid',
    8589952276,
  ),
  StudentListViewDataModel(
    'Fawas',
    'MK',
    'GVATCS025',
    000002,
    '02 Nov 2000',
    'Computer Science',
    'fawasmk@gmail.com',
    'Khalid',
    9207447877,
  ),
  StudentListViewDataModel(
    'Farzana',
    'Khalid',
    'GVATCS026',
    000003,
    '03 Sep 2000',
    'Computer Science',
    'farzanakhalid@gmail.com',
    'Khalid',
    9946319946,
  ),
  StudentListViewDataModel(
    'Murshida',
    'MK',
    'GVATBCA027',
    000004,
    '04 Oct 2000',
    'Computer Science',
    'murshidamk@gmail.com',
    'Ibrahim',
    9946445464,
  ),
  StudentListViewDataModel(
    'Nihad',
    'K',
    'GVATBCA028',
    000005,
    '05 Aug 2000',
    'Computer Science',
    'nihadk@gmail.com',
    'Ahammed Ali',
    9020495969,
  ),
];
