import 'package:custom_menu/models/dropdown_item.dart';
import 'package:custom_menu/utils/constanst.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class WDropdownItem extends StatelessWidget {
  const WDropdownItem({
    Key? key,
    required this.item,
    required this.onHeaderTap,
    this.expanded = false,
    this.shadowColor = Colors.black,
    this.color = const Color(0xff302d30),
  }) : super(key: key);

  final DropdownItem item;

  final VoidCallback onHeaderTap;

  final bool expanded;

  final Color shadowColor;

  final Color color;

  // factory WDropdownItem.header(WDropdownItem item)=> header
  @override
  Widget build(BuildContext context) => Container(
        height: AppConstants.dropdownHeight,
        padding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 8,
        ),
        margin: const EdgeInsets.symmetric(
          vertical: 12,
        ),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(
            8,
          ),
          boxShadow: [
            BoxShadow(
              color: shadowColor.withOpacity(0.045),
              offset: const Offset(0, -.5),
              blurRadius: 0,
            ),
            BoxShadow(
              color: shadowColor.withOpacity(0.037),
              offset: const Offset(0, -1.5),
              blurRadius: 1.5,
            ),
            BoxShadow(
              color: shadowColor.withOpacity(0.018),
              offset: const Offset(0, -3),
              blurRadius: 3,
            ),
            BoxShadow(
              color: shadowColor.withOpacity(0.004),
              offset: const Offset(0, -10),
              blurRadius: 5,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            Container(
              padding: const EdgeInsets.all(10),
              decoration: ShapeDecoration(
                color: Colors.indigo,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    8,
                  ),
                ),
              ),
              child: Icon(
                item.iconData,
                color: Colors.white,
                size: 18,
              ),
            ),
            const SizedBox(
              width: 20,
            ),
            Expanded(
              child: Text(
                item.name,
                style: GoogleFonts.outfit(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.normal,
                  shadows: [],
                ),
              ),
            ),
            AnimatedSwitcher(
              switchInCurve: Curves.easeInExpo,
              switchOutCurve: Curves.easeOutExpo,
              duration: const Duration(milliseconds: 400),
              child: expanded && item.header
                  ? const Icon(
                      Icons.keyboard_arrow_down,
                      color: Colors.white,
                    )
                  : const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.white,
                    ),
            ),
          ],
        ),
      ).addTap(() {
        
        switch (item.name) {
          case 'CATEGORY':
            break;
          case 'PROJECTS':
            Navigator.pushNamed(context, '/projects');
            break;
          case 'MESSAGES':
            Navigator.pushNamed(context, '/messages');
            break;
          case 'GAME':
            Navigator.pushNamed(context, '/game');
            break;
          case 'SETTINGS':
            Navigator.pushNamed(context, '/settings');
            break;
          default:
        }


        if (item.header) {
          onHeaderTap.call();
        }
      });
}

extension GestExt on Widget {
  Widget addTap(VoidCallback onTap) => GestureDetector(
        onTap: onTap,
        child: this,
      );
}
