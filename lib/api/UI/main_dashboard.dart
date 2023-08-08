import 'package:assignment/api/UI/bookmark.dart';
import 'package:assignment/api/UI/message.dart';
import 'package:assignment/api/UI/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/api_bloc.dart';
import '../constants/colors.dart';
import 'dashboard.dart';
import 'dial.dart';

class DashboardMainScreen extends StatefulWidget {
  const DashboardMainScreen({Key? key}) : super(key: key);

  @override
  State<DashboardMainScreen> createState() => _DashboardMainScreenState();
}

class _DashboardMainScreenState extends State<DashboardMainScreen> {
  int _selectedIndex = 0;
  final screens = [
    BlocProvider(
      create: (_) => APIBLoc(),
      child: const Dashboard(),
    ),
    const Bookmark(),
    const Dial(),
    const Message(),
    const Settings(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _selectedIndex,
        children: screens,
      ),
      bottomNavigationBar: Container(
        height: 95,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              spreadRadius: 6,
              blurRadius: 7,
            )
          ],
        ),
        child: ClipRRect(
          clipBehavior: Clip.hardEdge,
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(36),
            topRight: Radius.circular(36),
          ),
          child: Stack(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 0;
                          });
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 0
                                ? KColors.kBlue.withOpacity(0.2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.home_outlined,
                            color: KColors.kBlue,
                            size: 30,
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 1;
                          });
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 1
                                ? KColors.kBlue.withOpacity(0.2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.bookmark_border,
                            color: KColors.kBlue,
                            size: 30.0,
                          ),
                        ),
                      ),
                      Container(
                        width: 48.0,
                        height: 48.0,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 3;
                          });
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 3
                                ? KColors.kBlue.withOpacity(0.2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.message_outlined,
                            color: KColors.kBlue,
                            size: 30.0,
                          ),
                        ),
                      ),
                      GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          setState(() {
                            _selectedIndex = 4;
                          });
                        },
                        child: Container(
                          width: 48.0,
                          height: 48.0,
                          decoration: BoxDecoration(
                            color: _selectedIndex == 4
                                ? KColors.kBlue.withOpacity(0.2)
                                : null,
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: const Icon(
                            Icons.settings_outlined,
                            color: KColors.kBlue,
                            size: 30.0,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Align(
                alignment: Alignment.topCenter,
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      _selectedIndex = 2;
                    });
                  },
                  child: Container(
                    width: 72.0,
                    height: 72.0,
                    decoration: const BoxDecoration(
                      color: KColors.kBlue,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.dialpad,
                      color: Colors.white,
                      size: 30,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
