import 'package:flutter/material.dart';
import 'package:fourth/provider/my_provider.dart';
import 'package:fourth/shared/styles/colors.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
class SettingsTab extends StatelessWidget {
  static const String routeName="SettingsTab";
  bool language=false;
  @override
  Widget build(BuildContext context) {
    MyProvider provider= Provider.of<MyProvider>(context);
    showLanguageBottomSheet( context) {
      showModalBottomSheet(
        backgroundColor:Theme.of(context).colorScheme.onPrimary,
        isScrollControlled: true,
        shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide(color:Theme.of(context).colorScheme.onSurface,)
        ),
        context: context, builder: (context) {
        return Container(height: MediaQuery.of(context).size.height * 0.5,
          child:Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(onTap: () {
                  provider.changeLanguage("en");
                },child: Row(
                  children: [
                    language==false?Text(AppLocalizations.of(context)!.english,style: Theme.of(context).textTheme.bodyMedium):Text(AppLocalizations.of(context)!.english,style: TextStyle(  color:Colors.black54)  ),
                    Spacer(),
                    provider.Language=="en"?Icon(Icons.done,color: appbarcolor,size: 35,):SizedBox.shrink(),
                  ],
                )),
                SizedBox(height: 25,),
                InkWell(onTap: () {
                  language=true;
                  provider.changeLanguage("ar");
                //  AppLocalizations.of(context)!.localeName=Locale("en");
                  // setState(() {});
                },child: Row(
                  children: [
                    language==true?Text(AppLocalizations.of(context)!.arabic,style:Theme.of(context).textTheme.bodyMedium):Text(AppLocalizations.of(context)!.arabic,style: TextStyle( color:Colors.black54)  ),
                    Spacer(),
                    provider.Language=="ar"?Icon(Icons.done,color:appbarcolor,size: 35,):SizedBox.shrink(),
                  ],
                )),

              ],
            ),
          ),
        );
      },
      );
    }
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(fit: BoxFit.cover,image: AssetImage("assets/images/pattern.png"))
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Padding(
            padding: const EdgeInsets.all(18.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(AppLocalizations.of(context)!.language,style:GoogleFonts.poppins(color: blacked,fontSize: 14,fontWeight:FontWeight.w700 )),
                InkWell(
                  onTap: () {
                    showLanguageBottomSheet(context);
                  },
                  child: Container(
                      margin: EdgeInsets.all(18),
                      width: double.infinity,
                      decoration: BoxDecoration(
                           color: onappbar,
                          borderRadius: BorderRadius.circular(0),
                          border: Border.all(color: appbarcolor)
                      ), child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: provider.Language=="en"?Text(AppLocalizations.of(context)!.english,style: GoogleFonts.inter(color: appbarcolor,fontSize: 14,fontWeight:FontWeight.w400 ),) : Text(AppLocalizations.of(context)!.arabic,style:GoogleFonts.inter(color: appbarcolor,fontSize: 14,fontWeight:FontWeight.w400 ),),
                  )),
                ),

              ],
            ),
          )
          // Container(color: Colors.red,),
        ],
      ),
    );
  }
}