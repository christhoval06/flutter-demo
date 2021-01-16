import 'package:moolax/ui/views/bmi_input/card_title.dart';
import 'package:moolax/ui/views/bmi_input/height/height_picker.dart';
import 'package:moolax/utils/app_bar.dart';
import 'package:flutter/material.dart';

class HeightCard extends StatelessWidget {
  final int height;
  final ValueChanged<int> onChanged;

  const HeightCard({Key key, this.height = 170, this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.only(
        right: screenAwareSize(16.0, context),
        left: screenAwareSize(4.0, context),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          CardTitle("HEIGHT", subtitle: "(cm)"),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: screenAwareSize(8.0, context)),
              child: LayoutBuilder(builder: (context, constraints) {
                return HeightPicker(
                  widgetHeight: constraints.maxHeight,
                  height: height,
                  onChange: (val) => onChanged(val),
                );
              }),
            ),
          ),
        ],
      ),
    );
  }
}
