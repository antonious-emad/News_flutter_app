import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../models/category_model.dart';
import 'category_item.dart';

class CategoriesTab extends StatelessWidget {
  List<CategoryModel> categories;

  Function onClick;

  CategoriesTab(this.categories, this.onClick);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Text(AppLocalizations.of(context)!.title,style: GoogleFonts.poppins(fontSize: 22,fontWeight: FontWeight.w700,color: Color(0xFF4F5A69)),),
        ),

        Expanded(
          child: Expanded(
            flex: 25,
            child: GridView(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2, mainAxisSpacing: 12, crossAxisSpacing: 12),
              children: categories
                  .map((cat) => InkWell(
                      onTap: () {
                        onClick(cat);
                      },
                      child: CategoryItem(cat)))
                  .toList(),
            ),
          ),
        )
      ],
    );
  }
}
