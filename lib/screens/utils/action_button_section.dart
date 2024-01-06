import 'package:flutter/material.dart';
import 'bottom_sheet.dart';

class ActionButtonSection extends StatelessWidget {
  const ActionButtonSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1, color: const Color(0xFFF1F1F1)),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          _buildActionButton(
            label: 'Buy',
            onPressed: () => _showBuyBottomSheet(context),
            backgroundColor: const Color(0xFF25C26E),
          ),
          const SizedBox(width: 16),
          _buildActionButton(
            label: 'Sell',
            onPressed: () => _showSellBottomSheet(context),
            backgroundColor: const Color(0xFFFF5449),
          ),
        ],
      ),
    );
  }

  ElevatedButton _buildActionButton({
    required String label,
    required VoidCallback onPressed,
    required Color backgroundColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(171, 32),
        backgroundColor: backgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8.0),
        ),
      ),
      child: Text(
        label,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 16,
          fontFamily: 'Satoshi',
          fontWeight: FontWeight.w700,
          height: 0.12,
        ),
      ),
    );
  }

  void _showBuyBottomSheet(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return BottomSheetContent();
      },
    );
  }

  void _showSellBottomSheet(BuildContext context) {
    // Handle the sell action
  }
}
