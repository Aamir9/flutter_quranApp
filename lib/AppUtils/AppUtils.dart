import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quran/AppConstants/AppContants.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:toast/toast.dart';



class AppUtils{

  appBar() {
    return PreferredSize(
        preferredSize: Size.fromHeight(0),
        child: AppBar(
          backgroundColor: greenColor,
        ));
  }

  headingTextStyle(color,{isArabic}){
    return TextStyle(
        fontSize: isArabic==null ? headingFontSize:activeFontSize,
        color: color,
        fontWeight: xBold,
        fontFamily: isArabic==null?"Poppins":arabicFonts[activeFont]
    );
  }
  titleTextStyle(color,{isArabic}){
    return TextStyle(
        fontSize: isArabic==null ? newTitleFontSize:activeFontSize,
        color: color,
        fontWeight:bold,
      fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont]
    );
  }
  subTitleTextStyle(color,{isArabic}){
    return TextStyle(
        fontSize: isArabic==null ? titleFontSize:activeFontSize,
        color: color,
        fontWeight:bold,
        fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont]
    );
  }

  labelTextStyle(color,{isArabic,}){
    return TextStyle(
        fontSize: isArabic==null ? labelFontSize:activeFontSize,
        color: color,
        fontWeight:bold,
        fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont]
    );
  }

  labelFontTextStyle(color,{isArabic,font}){
    return TextStyle(
        fontSize: isArabic==null ? labelFontSize:activeFontSize,
        color: color,
        fontWeight:bold,
        fontFamily:  isArabic==null?"Poppins":font
    );
  }

  descriptionTextStyle(color,{isArabic}){
    return TextStyle(
        fontSize: isArabic==null ? labelFontSize:activeFontSize,
        color: color,
        fontWeight:normal,
        fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont]
    );
  }
  fontSizeText(color, double fontSize,{isArabic}) {
    return TextStyle(
        fontSize: isArabic==null ? fontSize:activeFontSize,
        color: color,
        fontWeight:normal,
        fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont]
    );
  }

  smallTextStyle(color,{isUnderline,isArabic,fontSize}){
    return TextStyle(
        fontSize: isArabic==null ? smallFontSize:activeFontSize,
        color: color,
        fontWeight:normal,
        fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont],
        decoration: isUnderline!=null && isUnderline == true?TextDecoration.underline:TextDecoration.none
    );
  }
  quranTextStyle(color,{isUnderline,isArabic}){
    return TextStyle(
        fontSize: isArabic==null ? titleFontSize:activeFontSize,
        color: color,
        fontWeight:bold,
        fontFamily:  isArabic==null?"Poppins":arabicFonts[activeFont],
        decoration: isUnderline!=null && isUnderline == true?TextDecoration.underline:TextDecoration.none
    );
  }
  boxShadow()
  {
    return [
      BoxShadow(
        color: Colors.grey.withOpacity(0.3),
        spreadRadius: 5,
        blurRadius: 7,
        offset: Offset(0, 3), // changes position of shadow
      ),
    ];
  }

  buttonTextStyle(color){
    return TextStyle(
        fontSize: labelFontSize,
        color: color,
        fontWeight:light,
        fontFamily: "Poppins"
    );
  }

  slider(value,min,max,onChange)
  {
    return SliderTheme(
      data: SliderThemeData(
          thumbColor: greenColor,
          activeTickMarkColor: greenColor,
          activeTrackColor: greenColor,
          inactiveTrackColor: greenColor.withOpacity(.5),
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 7)),
      child: Slider(
        min: min,
        max: max,
        value: value,
        onChanged: onChange
      ),
    );
  }
  smallSlider(value,min,max,onChange)
  {
    return SliderTheme(
      data: SliderThemeData(
          thumbColor: greenColor,
          activeTickMarkColor: greenColor,
          activeTrackColor: greenColor,
          inactiveTrackColor: greenColor.withOpacity(.5),
          trackHeight: 4,
          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 5)),
      child: Slider(
          min: min,
          max: max,
          value: value,
          onChanged: onChange
      ),
    );
  }


  button(leftColor,rightColor,text,icon,textColor,onclick,{hPadding,borderColor}){
    return InkWell(
      onTap: onclick,
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: hPadding!=null?hPadding:15),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(7)),
          border: borderColor!=null?Border.all(color: borderColor,width: 2,style: BorderStyle.solid):null,
          gradient: LinearGradient(
              colors: [leftColor, rightColor],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight
          ),
        ),
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: icon==null?[
              Text(
                text,
                style: buttonTextStyle(textColor),
                overflow: TextOverflow.ellipsis,
              ),
            ]:[
              Icon(icon,color: whiteColor,size:20),
              SizedBox(width:7),
              Text(
                text,
                style: buttonTextStyle(textColor),
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }


  searchInputField(controller,hint,backgroundColor,textColor,{isReadOnly,onChange})
  {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10,),
      decoration: BoxDecoration(
          color: backgroundColor,
          borderRadius: BorderRadius.circular(7)
      ),
      child: Row(
          children: [
            Expanded(
                flex: 5,
                child:TextField(
                  onChanged: onChange==null?(val){}:onChange,
                  readOnly: isReadOnly!=null && isReadOnly?true:false,
                  style: labelTextStyle(textColor),
                  controller: controller,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.symmetric(vertical: 2,horizontal: 10),
                    border: InputBorder.none,
                    hintText: hint,
                    hintStyle: labelTextStyle(textColor.withOpacity(.7)),
                  ),
                )
            ),
            Container(
              child: Icon(CupertinoIcons.search,color: greenDarkColor,size: 20,),
            )
          ]
      ),
    );
  }

  categoriesItem(image,title,color)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1,),
      color: Colors.transparent,
      width: 110,
      child: Column(
          children: [
          Container(
            height: 100,
            width: 100,
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(15),
            ),
            child:Center(
              child: Container(
                height: 40,
                width: 40,
                child: Image.asset(image,width: 40,height: 40,fit: BoxFit.contain,),
              ),
            )
          ),
          SizedBox(height: 5,),
          Container(
              padding:EdgeInsets.symmetric(horizontal: 5),
              child: Text(title,style: labelTextStyle(greenColor),textAlign: TextAlign.center,maxLines: 3,overflow: TextOverflow.ellipsis,)
          )
        ],
      ),
    );
  }
  duaListItem(dua,translation)
  {
    // dom.Document document = htmlparser.parse(dua);

    return Container(
      margin: EdgeInsets.symmetric(vertical: 1,),
      color: Colors.transparent,
      width: 110,
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10,vertical: 15),
          child: Column(
            children: [
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Dua",style: titleTextStyle(greenColor),)
              ),
              SizedBox(height: 5,),
              Container(
                  padding:EdgeInsets.symmetric(horizontal: 5),
                  child:Text(dua,style: quranTextStyle(blackColor,isArabic:true,),textAlign: TextAlign.center,)
              ),
              SizedBox(height: 10,),
              Container(
                  padding: EdgeInsets.symmetric(horizontal: 15),
                  child: Text("Translation",style: titleTextStyle(greenColor),)
              ),
              SizedBox(height: 5,),
              Container(
                  padding:EdgeInsets.symmetric(horizontal: 5),
                  child: Text(translation,style: descriptionTextStyle(blackColor,),textAlign: TextAlign.center,)
              ),

            ],
          ),
        ),
      ),
    );
  }

  dashboardCategoryItem(image,title,color)
  {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 7,horizontal: 5),
      color: Colors.transparent,
      child: Column(
        children: [
          Container(
            decoration: BoxDecoration(
              color: whiteColor,
              borderRadius: BorderRadius.circular(12)),
            child: Container(
                height: 70,
                width: 70,
                child:Center(
                  child: Container(
                    height: 45,
                    width: 45,
                    child: Image.asset(image,fit: BoxFit.contain,),
                  ),
                )
            ),
          ),
          Text(title,style: smallTextStyle(greenColor),)
        ],
      ),
    );
  }

  musicPlayer({surahName,sliderValue,onChange,onNext,onPrevious,isPlaying,onPlayPause})
  {
    return Container(
      child: Stack(
        clipBehavior: Clip.none, children: [
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(7),
                color: greenColor,
              boxShadow:boxShadow()
            ),
            width: 190,
            height: 150,
            child: Container(
              margin: EdgeInsets.only(top: 7),
              padding: EdgeInsets.symmetric(horizontal: 15,vertical: 10),
              color: Colors.white,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Now Playing",style: smallTextStyle(greenColor),),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(surahName.toString(),style: labelTextStyle(greenColor),),
                      Icon(CupertinoIcons.chevron_down,color: greenColor,size: 20,)
                    ],
                  ),
                  Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("0:00",style: smallTextStyle(greenColor),),
                            Text("0:00",style: smallTextStyle(greenColor),),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          SizedBox(width: 3,),
                          Expanded(
                            child: smallSlider(sliderValue, 0.0, 100.0, onChange)
                          ),
                          SizedBox(width: 7,),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: -25,left: -20,right: -20,
            child: Stack(
              clipBehavior: Clip.none, children: [
                Container(
                  margin: EdgeInsets.only(top: 10),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 23),
                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: whiteColor,boxShadow: boxShadow()),
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(width: 10,),
                      InkWell(
                        onTap: onPrevious,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.arrowtriangle_left_fill,color: greenColor,size: 18,),
                            Icon(CupertinoIcons.arrowtriangle_left_fill,color: greenColor,size: 18,)
                          ],
                        ),
                      ),
                      Container(
                        decoration: BoxDecoration(color: greenColor,shape: BoxShape.circle),
                        padding: EdgeInsets.all(20),
                        child:  Center(child:
                        InkWell(
                          onTap: onPlayPause,
                            child: Icon(isPlaying!=null&& isPlaying?CupertinoIcons.pause_fill:CupertinoIcons.arrowtriangle_right_fill,color: Colors.white,size: 25,))
                        ),
                      ),
                      InkWell(
                        onTap: onNext,
                        child: Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(CupertinoIcons.arrowtriangle_right_fill,color: greenColor,size: 18,),
                            Icon(CupertinoIcons.arrowtriangle_right_fill,color: greenColor,size: 18,)
                          ],
                        ),
                      ),
                      SizedBox(width: 10,),
                    ],
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  showToast(text, context) {
     return Toast.show(text, context, duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
   }


}