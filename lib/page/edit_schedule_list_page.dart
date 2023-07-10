import 'package:flutter/material.dart';

import '../constant/size.dart';
import '../tablet/tablet_padding.dart';
import 'edit_schedule_item_page.dart';

class EditScheduleListPage extends StatefulWidget {
  const EditScheduleListPage({super.key});

  @override
  State<EditScheduleListPage> createState() => _EditScheduleListPageState();
}

class _EditScheduleListPageState extends State<EditScheduleListPage> {
  @override
  Widget build(BuildContext context) {
    final paddingHorizontal = getTabletPaddingM(context);
    return Scaffold(
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 80),
            child: Column(
              children: const [
                SizedBox(height: 20),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.zero,
              shape: const RoundedRectangleBorder(), // Remove border radius
              child: SafeArea(
                top: false,
                child: Container(
                  padding: EdgeInsets.symmetric(
                    vertical: sizeMS,
                    horizontal: paddingHorizontal,
                  ),
                  width: double.infinity,
                  child: SizedBox(
                    height: 40,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: EdgeInsets.zero,
                        minimumSize: const Size(0, 0),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (cxt) => const EditScheduleItemPage(),
                          ),
                        );
                      },
                      child: const Text("Add New Schedule"),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
