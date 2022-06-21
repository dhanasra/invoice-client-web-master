import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../constants.dart';

class SingleSelect extends StatefulWidget {
  const SingleSelect({
    Key? key,
    required this.value,
    required this.options,
    this.width = 300,
    this.isTextInputAdded = false
  }) : super(key: key);

  final String value;
  final List<String> options;
  final double width;
  final bool isTextInputAdded;

  @override
  _SingleSelectState createState() => _SingleSelectState();
}

class _SingleSelectState extends State<SingleSelect> {
  var value;

  @override
  void initState() {
    super.initState();
    value = widget.value;
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: widget.width,
        height: 40,
        child: Container(
          child: DropdownButtonHideUnderline(
            child: DropdownButton2(
              value: value,
              focusColor: white,
              isExpanded: true,
              buttonPadding: const EdgeInsets.only(left: defaultPadding/2,right: defaultPadding/2),
              buttonHeight: 50,
              buttonWidth: 160,
              itemHeight: 40,
              itemWidth: widget.width,
              items: widget.options.map((e) {
                return DropdownMenuItem<String>(
                    value: e,
                    child: SizedBox(
                      width: 300,
                      child: Text(e,style:Theme.of(context).textTheme.caption!.copyWith(color: textColor)),
                    )
                );}).toList(),
              onChanged: (val){
                setState(() {
                  value = val as String;
                });
              },
              dropdownDecoration: const BoxDecoration(
                color: white,
              ),
            ),
          ),
          decoration: BoxDecoration(
              border: Border.all(
                color: promptColor,
                width: 1,
              ),
              borderRadius: widget.isTextInputAdded
                  ? const BorderRadius.only(topRight: Radius.circular(4),bottomRight: Radius.circular(4))
                  : BorderRadius.circular(4)
          ),
        )
    );
  }
}
