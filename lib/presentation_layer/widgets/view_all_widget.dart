import 'package:flutter/material.dart';
import 'package:lab_store/core/style/color_manager.dart';
import 'package:lab_store/presentation_layer/widgets/text_widget.dart';

class ViewAllWidget extends StatelessWidget {
  String title, subtitle;
  Function onPressed;

  ViewAllWidget(
      {Key? key,
      required this.title,
      required this.subtitle,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextWidget(
                text: title,
                color: Colors.black,
                textSize: 26,
                isTitle: true,
              ),
              TextWidget(
                text: subtitle,
                color: Colors.grey,
                textSize: 15,
              ),
            ],
          ),
          TextButton(
            onPressed: () {
              onPressed();
            },
            child: TextWidget(
              text: 'view all',
              color: ColorManager.primary,
              textSize: 15,
            ),
          ),
        ],
      ),
    );
  }
}
