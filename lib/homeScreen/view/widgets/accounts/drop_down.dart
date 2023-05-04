// ignore_for_file: type_annotate_public_apis, lines_longer_than_80_chars

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:foodieapp/homeScreen/bloc/home_screen_bloc.dart';

class DropdownSelection extends StatefulWidget {
  const DropdownSelection({super.key});

  @override
  State<DropdownSelection> createState() => _DropdownSelectionState();
}

class _DropdownSelectionState extends State<DropdownSelection> {
// List of items in our dropdown menu
  var items = [
    'Male',
    'Female',
  ];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeScreenBloc, HomeScreenState>(
      builder: (context, state) {
        return DropdownButton<String>(
          value: state.dropdownvalue,
          icon: const Icon(Icons.keyboard_arrow_down),
          items: state.items.map((String items) {
            return DropdownMenuItem(
              value: items,
              child: Text(items),
            );
          }).toList(),
          onChanged: (String? newValue) {
            if (newValue is String) {
             context.read<HomeScreenBloc>().add(DropDownGender(genderRes: newValue));
            }
          },
          isExpanded: true,
        );
      },
    );
  }
}
