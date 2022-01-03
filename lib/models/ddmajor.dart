class ListMajor {
  int? value;
  String? mname;

  ListMajor(this.value, this.mname);

  static getMajor() {
    return [
      ListMajor(1, 'คณะวิทยาศาสตร์'),
      ListMajor(2, 'คณะวิทยาการสุขภาพและการกีฬา'),
      ListMajor(3, 'คณะเทคโนโลยีและการพัฒนาชุมชน'),
      ListMajor(4, 'คณะนิติศาสตร์'),
      ListMajor(5, 'คณะวิศวกรรมศาสตร์ '),
      ListMajor(6, 'คณะอุตสากรรมเกษตรและชีวภาพ'),
      ListMajor(7, 'คณะพยาบาลศาสตร์ '),
    ];
  }
}
