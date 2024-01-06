import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'bottom_sheet.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      clipBehavior: Clip.antiAlias,
      decoration: ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0xFFF1F1F1)),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ElevatedButton(
            onPressed: (){
              showModalBottomSheet(
                context: context,
                builder: (BuildContext context) {
                  // Use the BottomSheetContent widget as the content of the bottom sheet
                  return BottomSheetContent();
                },
              );
            },
            style: ElevatedButton.styleFrom(
              elevation: 0,
              fixedSize: Size(171, 32),
              backgroundColor: Color(0xFF25C26E),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Buy',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                height: 0.12,
              ),
            ),
          ),


          SizedBox(width: 16),

          ElevatedButton(
            onPressed: (){},
            style: ElevatedButton.styleFrom(
              elevation: 0,
              fixedSize: Size(171, 32),
              backgroundColor: Color(0xFFFF5449),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
            ),
            child: Text(
              'Sell',
              style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'Satoshi',
                fontWeight: FontWeight.w700,
                height: 0.12,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
