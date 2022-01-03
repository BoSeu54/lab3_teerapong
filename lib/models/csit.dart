class TCsit {
  int? no;
  String? name;
  String? checked;

  //Constructor
  TCsit(this.no, this.name, this.checked);

  static getCsit() {
    return [
      TCsit(1, 'สาขาวิทยาการคอมพิวเตอร์', 'CS'),
      TCsit(2, 'ส่าขาเทคโนโลยีสารสนเทศ', 'IT'),
    ];
  }
}
