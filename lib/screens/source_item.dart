import 'package:flutter/material.dart';
import 'package:fourth/shared/styles/colors.dart';
import 'package:google_fonts/google_fonts.dart';

import '../models/sources_model.dart';

class SourceItem extends StatelessWidget {
  Sources onesource;
  bool selected;
  SourceItem(this.onesource, this.selected);

  @override
  Widget build(BuildContext context) {
    return Container(padding: EdgeInsets.symmetric(vertical: 6,horizontal: 12),decoration: BoxDecoration(color:selected?appbarcolor:onappbar,border: Border.all(width:2,color: appbarcolor),borderRadius: BorderRadius.circular(25)) ,child: Text(onesource.name??"",style:GoogleFonts.exo (fontSize: 14,fontWeight: FontWeight.w400,color:selected? onappbar:appbarcolor, ),),);
  }

}
