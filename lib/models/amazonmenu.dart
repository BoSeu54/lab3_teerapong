class Menu {
  String? engname;
  int? price;
  bool? checked;

  //Constructor
  Menu(this.engname, this.price, this.checked);

  static getMenu() {
    return [
      Menu('White choc macchiato Frappe', 75, true),
      Menu('Espressso Frappe', 60, false),
      Menu('Cappuccino Frappe', 65, false),
      Menu('Mocha Frappe', 70, false),
      Menu('Latte Amazon Frappe', 70, false),
    ];
  }
}
