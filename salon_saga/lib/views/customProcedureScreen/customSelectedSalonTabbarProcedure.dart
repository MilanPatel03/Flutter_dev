import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Customselectedsalontabbarprocedure extends StatefulWidget {
  const Customselectedsalontabbarprocedure({super.key});

  @override
  State<Customselectedsalontabbarprocedure> createState() => _CustomselectedsalontabbarprocedureState();
}

class _CustomselectedsalontabbarprocedureState extends State<Customselectedsalontabbarprocedure> {

  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    //_tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Tab(

    );
  }
}
