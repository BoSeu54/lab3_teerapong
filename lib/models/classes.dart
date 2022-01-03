class Classes {
  int? no;
  String? name;
  String? checked;

  //Constructor
  Classes(this.no, this.name, this.checked);

  static getClass() {
    return [
      Classes(1, 'กำลังศึกษาชั้นปีที่ 1', 'ปี1'),
      Classes(2, 'กำลังศึกษาชั้นปีที่ 2', 'ปี2'),
      Classes(3, 'กำลังศึกษาชั้นปีที่ 3', 'ปี3'),
      Classes(4, 'กำลังศึกษาชั้นปีที่ 4', 'ปี4'),
    ];
  }
}
