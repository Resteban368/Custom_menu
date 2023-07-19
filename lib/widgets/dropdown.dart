// ignore_for_file: must_be_immutable


import 'package:collection/collection.dart';
import 'package:custom_menu/blocs/dropdownItem/dropdown_item_bloc.dart';
import 'package:custom_menu/models/dropdown_item.dart';
import 'package:custom_menu/utils/constanst.dart';
import 'package:custom_menu/widgets/dropdown_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tinycolor2/tinycolor2.dart';

class WDropdown extends StatelessWidget {
  WDropdown({Key? key}) : super(key: key);

  late AnimationController animationController;

  late Animation simpleAnimation;

  
  @override
  Widget build(BuildContext context) {
    final _myBloc = BlocProvider.of<DropdownItemBloc>(context);
    return Scaffold(
      body: BlocBuilder<DropdownItemBloc, DropdownItemState>(
        builder: (context, state) {

          return Stack(
            alignment: Alignment.center,
            clipBehavior: Clip.none,
            fit: StackFit.expand,
            children: items.reversed
                .mapIndexed(
                  (index, item) => AnimatedPositioned(
                    curve: Curves.easeInOutExpo,
                    duration: const Duration(
                      milliseconds: 300,
                    ),
                    // bottom: index * heightFactor,
                    top: index * state.heightFactor,
                    bottom: state.isExpanded
                        ? -1 * MediaQuery.of(context).size.height / 2
                        : 0,
                    width: AppConstants.minItemWidth,
                    child: Center(
                      child: AnimatedScale(
                        curve: Curves.bounceOut,
                        duration: const Duration(milliseconds: 300),
                        scale: state.isExpanded ? 1 : 1 - (0.05 * (1 - index)),
                        child: WDropdownItem(
                          expanded: state.isExpanded,
                          item: item,
                          color: const Color(0xff302d30).tint(index * 2),
                          onHeaderTap: () {
                            _myBloc.add(ChangeisExpandedEvent());
                          },
                        ),
                      ),
                    ),
                  ),
                )
                .toList(),
          );
        },
      ),
    );

    // toggleDropdown() {
    //   setState(() {
    //     isExpanded = !isExpanded;
    //   });
    // }
  }
}
