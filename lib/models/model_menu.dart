class Menu {
  String title;
  String icon;
  String colorBox;
  String iconColor;
  String press;

  Menu({
    this.title,
    this.icon,
    this.colorBox,
    this.iconColor,
    this.press,
  });

  Menu.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    icon = json['icon'];
    colorBox = json['colorBox'];
    iconColor = json['iconColor'];
    press = json['press'];
  }
}
