import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class FilterByTitle extends StatelessWidget {
  const FilterByTitle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'ALL PRODUCTS',
            style: GoogleFonts.nunito(
              color: Colors.black,
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const Icon(Icons.keyboard_arrow_down_rounded, color: Colors.black)
        ],
      ),
    );
  }
}
