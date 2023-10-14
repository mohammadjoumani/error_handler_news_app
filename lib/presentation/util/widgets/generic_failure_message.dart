import 'package:error_handler/presentation/util/resources/color_manager.dart';
import 'package:flutter/material.dart';

class GenericFailureMessage extends StatelessWidget {
  const GenericFailureMessage(
      {Key? key, required this.message, required this.onPress})
      : super(key: key);

  final String message;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: onPress,
            style: OutlinedButton.styleFrom(
              side: BorderSide(color: ColorManager.colorPrimaryLight),
            ),
            child: Text(
              "Retry",
              style: TextStyle(color: ColorManager.colorPrimaryLight),
            )),
        const SizedBox(
          height: 8,
        ),
        Text(
          message,
          style: TextStyle(fontSize: 15, color: ColorManager.colorBlack),
          textAlign: TextAlign.center,
        )
      ],
    );
  }
}
