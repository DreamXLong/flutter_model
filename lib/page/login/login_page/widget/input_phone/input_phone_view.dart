import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'input_phone_logic.dart';


class InputPhoneWidget extends StatelessWidget {
  InputPhoneWidget({Key? key}) : super(key: key);

  final logic = Get.put(InputPhoneLogic());
  final state = Get
      .find<InputPhoneLogic>()
      .state;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
