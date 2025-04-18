import 'package:flutter/material.dart';

class MobileWrapper extends StatefulWidget {
  final Widget body;
  final Widget? bottom;
  final Widget? floatingButton;
  final PreferredSizeWidget? appBar;

  const MobileWrapper({
    super.key,
    required this.body,
    this.floatingButton,
    this.bottom,
    this.appBar,
  });

  @override
  State<MobileWrapper> createState() => _MobileRetailCashierWrapperState();
}

class _MobileRetailCashierWrapperState extends State<MobileWrapper> {
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: SafeArea(
          child: Padding(
            padding: EdgeInsets.zero,
            child: widget.bottom,
          ),
        ),
        floatingActionButton: widget.floatingButton,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        body: widget.body,
        appBar: widget.appBar);
  }
}
