import 'package:flutter/material.dart';

import '../constant/size.dart';
import '../master_widget/master_field_dropdown.dart';
import '../model/reu_dropdown_model.dart';
import '../tablet/tablet_padding.dart';
import '../widget/text_field_widget.dart';

class EditScheduleItemPage extends StatefulWidget {
  const EditScheduleItemPage({super.key});

  @override
  State<EditScheduleItemPage> createState() => _EditScheduleItemPageState();
}

class _EditScheduleItemPageState extends State<EditScheduleItemPage> {
  @override
  Widget build(BuildContext context) {
    final paddingHorizontal = getTabletPaddingM(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Edit Schedyle Item Page")),
      bottomNavigationBar: Card(
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
                onPressed: () {},
                child: const Text("Save Schedule"),
              ),
            ),
          ),
        ),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          const TextFieldWidget(hintText: "Title"),
          const SizedBox(height: 20),
          const TextFieldWidget(hintText: "Description"),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: MasterFieldDropdown<String>(
              label: "Choose Preferance",
              items: <ReuDropdownModel<String>>[
                ReuDropdownModel<String>(value: "Main Target"),
                ReuDropdownModel<String>(value: "Side Target"),
              ],
              onChanged: (value) {
                debugPrint(value.value);
              },
              indexOfInitialValue: 0,
            ),
          ),
        ],
      ),
    );
  }
}
