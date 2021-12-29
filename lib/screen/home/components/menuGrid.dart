import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '/components/loadingWidget.dart';
import '/restapi/api_services.dart';
import '../../../size_config.dart';
import '../../../models/model_menu.dart' as menuModel;

class MenuGrid extends StatefulWidget {
  @override
  _MenuGridState createState() => _MenuGridState();
}

class _MenuGridState extends State<MenuGrid> {
  APIService apiService;

  @override
  void initState() {
    apiService = new APIService();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: getProportionateScreenHeight(20)),
        _menusList(),
      ],
    );
  }

  Widget _menusList() {
    return new FutureBuilder(
      future: apiService.getMenus(),
      builder: (
        BuildContext context,
        AsyncSnapshot<List<menuModel.Menu>> model,
      ) {
        if (model.hasData) {
          return _buildMenusList(model.data);
        }

        return Container(
          height: 350,
          child: LodingWidget(),
        );
      },
    );
  }

  Widget _buildMenusList(List<menuModel.Menu> menus) {
    return Container(
      padding: const EdgeInsets.all(8.0),
      child: ScrollConfiguration(
        behavior: MyBehavior(),
        child: GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 110.0,
              childAspectRatio: 1.5,
              crossAxisSpacing: 20,
              mainAxisSpacing: 20,
            ),
            itemCount: menus.length,
            itemBuilder: (context, index) {
              var data = menus[index];
              return MenuUtamaItem(
                title: data.title,
                icon: data.icon,
                colorBox: data.colorBox,
                iconColor: data.iconColor,
                press: data.press,
                isSelected: false,
              );
            }),
      ),
    );
  }
}

class MyBehavior extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}

Color _getColorFromHex(String hexColor) {
  hexColor = hexColor.replaceAll("#", "");
  if (hexColor.length == 6) {
    hexColor = "FF" + hexColor;
  }
  if (hexColor.length == 8) {
    return Color(int.parse("0x$hexColor"));
  }
}

class MenuUtamaItem extends StatelessWidget {
  final String title, icon, colorBox, iconColor, press;
  final bool isSelected;
  MenuUtamaItem({
    this.title,
    this.icon,
    this.colorBox,
    this.iconColor,
    this.press,
    this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        GestureDetector(
          onTap: () {
            // Navigator.pushNamed(context, press);
          },
          child: Container(
            height: 50.0,
            width: 50.0,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                border:
                    Border.all(color: _getColorFromHex(colorBox), width: 2)),
            child: new Icon(
              MdiIcons.fromString(icon),
              color: _getColorFromHex(colorBox),
              size: 35,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 5.0),
          child: Text(
            title,
            style: TextStyle(fontSize: 12.0),
            textAlign: TextAlign.center,
          ),
        )
      ],
    );
  }
}
