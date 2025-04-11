import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:salonverse/Commons/CommonColors.dart';

class CommonAppbar extends StatelessWidget {
  Widget? leading,title;
  List<Widget>? actions;
  CommonAppbar({super.key, this.leading,this.title,this.actions});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      iconTheme: const IconThemeData(color: Colors.white),
      backgroundColor: AppColors.screenColor,
      centerTitle: true,
      leading: leading,
      title: title,
      actions: actions,
    );
  }
}
