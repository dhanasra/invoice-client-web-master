import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

import '../constants.dart';

class TagsRadio extends StatefulWidget {
  final List<String> tags;
  final ValueChanged<String> selected;

  const TagsRadio({Key? key,
    required this.tags,
    required this.selected
  }) : super(key: key);

  @override
  _TagsRadioState createState() => _TagsRadioState();
}

class _TagsRadioState extends State<TagsRadio> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 30,
        child: ListView.builder(
          shrinkWrap: true,
          scrollDirection: Axis.horizontal,
          itemCount: widget.tags.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.only(right: defaultPadding/2),
              child: InkWell(
                onTap: (){
                  setState(() {
                    selectedIndex = index;
                  });
                  widget.selected(widget.tags[index]);
                },
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                child: Container(
                    decoration: BoxDecoration(
                        color: borderColor,
                        border: Border.all(color: selectedIndex==index?btnColor:borderColor,),
                        borderRadius: const BorderRadius.all(Radius.circular(25))
                    ),
                    padding: const EdgeInsets.only(left: defaultPadding,right: defaultPadding,top: defaultPadding*0.25,bottom: defaultPadding*0.25),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                            widget.tags[index],
                            textAlign: TextAlign.center,
                            style: Theme.of(context).textTheme.caption!.copyWith(
                              color: selectedIndex==index?btnColor:textColor,
                            )
                        )
                      ],
                    )
                ),
              ),
            );
          },
        )
    );
  }
}

