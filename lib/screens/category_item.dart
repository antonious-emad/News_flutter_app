import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../models/category_model.dart';

class CategoryItem extends StatelessWidget {
  CategoryModel categoryModel;

  CategoryItem(this.categoryModel);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: categoryModel.color,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(25),
              bottomRight: categoryModel.index.isEven
                  ? Radius.circular(0)
                  : Radius.circular(25),
              topLeft: Radius.circular(25),
              bottomLeft: categoryModel.index.isOdd
                  ? Radius.circular(0)
                  : Radius.circular(25),
            )
        ),
        child:
        Column(
          children: [
            Expanded(child: Image.asset(categoryModel.image)),
            categoryModel.name == "Politics" ? Text(
              AppLocalizations.of(context)!.general, style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22),) : categoryModel.name == "Sports" ? Text(
              AppLocalizations.of(context)!.sports, style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22),) : categoryModel.name == "Business" ? Text(
              AppLocalizations.of(context)!.business, style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22),) : categoryModel.name == "Health" ? Text(
              AppLocalizations.of(context)!.health, style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22),) : categoryModel.name == "Science" ? Text(
              AppLocalizations.of(context)!.science, style: GoogleFonts.exo(
                color: Colors.white,
                fontWeight: FontWeight.w400,
                fontSize: 22),) :Text(
              AppLocalizations.of(context)!.entertainment,
              style: GoogleFonts.exo(color: Colors.white,
                  fontWeight: FontWeight.w400,
                  fontSize: 22),)
          ],
        ),
      ),
    );
  }
}