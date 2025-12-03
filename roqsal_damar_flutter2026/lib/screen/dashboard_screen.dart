

import 'package:dynamic_themes/dynamic_themes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../screen/section/section_controller.dart';
import '../../screen/sliderAds/ads_controller.dart';


import '../Constants.dart';
import '../theme_example.dart';
import '../widget/auth_favorite.dart';
import '../widget/my_colors.dart';
import '../widget/my_data.dart';
import '../widget/my_text.dart';
import 'allShop/allShop_controller.dart';
import 'connect_with_us/connect_with_us.dart';
import 'favorite/favorite.dart';
import 'favorite/favorite_controller.dart';
import 'home_screen.dart';
import 'login/login_model.dart';
import 'notifications/notifications.dart';
import 'notifications/notifications_contraller.dart';
class AppThemes {
  static const int LightBlue = 0;
  static const int LightRed = 1;
  static const int DarkBlue = 2;
  static const int DarkRed = 3;
  static const int nDarkRed = 3;

  static String toStr(int themeId) {
    switch (themeId) {
      case LightBlue:
        return "Light Blue";
      case LightRed:
        return "Light Red";
      case DarkBlue:
        return "Dark Blue";
      case DarkRed:
        return "Dark Red";
      default:
        return "Unknown";
    }
  }
}

class DashBoardScreen  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final dark = ThemeData.dark();
    final darkButtonTheme = dark.buttonTheme.copyWith(buttonColor: Colors.grey[700]);
    final darkFABTheme = dark.floatingActionButtonTheme;

    final themeCollection = ThemeCollection(
        themes: {
          AppThemes.LightBlue: ThemeData(textSelectionTheme: TextSelectionThemeData(
          cursorColor: kColorsWhite,
          ),
          textTheme: TextTheme(
          headlineSmall: TextStyle(
          fontSize: 16.0.sp,
          // fontWeight: FontWeight.w300,
          color: kColorsLightBlack
          ),
          headlineMedium: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.w500,
          color: Colors.black),
          displaySmall: TextStyle(
          fontSize: 14.0.sp,
          fontWeight: FontWeight.w500,
          color: kColorsLightBlack),
          displayLarge: TextStyle(
          fontSize: 20.0.sp,
          fontWeight: FontWeight.bold,
          color: kColorsBlack),
    displayMedium: TextStyle(
    fontSize: 18.0.sp,
    fontWeight: FontWeight.w300,
    color: Colors.black),
    titleLarge: TextStyle(
    fontSize: 14.0.sp,
    fontWeight: FontWeight.w500,
    color:Colors.black),
    bodyMedium:
    TextStyle(fontSize: 14.0.sp, color: kColorsBlack),
    bodyLarge: TextStyle(fontSize: 12.0.sp, color: kColorsBlack, fontWeight: FontWeight.w300,),
    bodySmall: TextStyle(fontSize: 10.0.sp, color: Colors.grey, fontWeight: FontWeight.w300,)

    ),
    iconTheme: IconThemeData(
    color: kColorsBlack,

    ),
    scaffoldBackgroundColor: kColorsDeepWhite,
    appBarTheme: AppBarTheme(
    iconTheme: IconThemeData(
    color: kColorsBlack
    ),
    backgroundColor: kColorsDeepWhite
    ),

    // primaryIconTheme:IconThemeData( color: kColorsBackground,) ,
    focusColor: kColorsWhite,
    hintColor: kColorsWhite,
    primaryColor: kColorsWhite,
    fontFamily:  'ArbFONTS-DINNextLTArabic',
    primarySwatch: Colors.red,
    ),
          AppThemes.LightRed: ThemeData(primarySwatch: Colors.red),
          AppThemes.DarkBlue: dark.copyWith(
              hintColor: Colors.blue,
              buttonTheme: darkButtonTheme,
              floatingActionButtonTheme: darkFABTheme.copyWith(backgroundColor: Colors.blue)),
          AppThemes.DarkRed: ThemeData.from(colorScheme: ColorScheme.dark(primary: Colors.red, secondary: Colors.red)),

        }
    );

    return DynamicTheme(
        themeCollection: themeCollection,
        defaultThemeId: AppThemes.LightBlue,
        builder: (context, theme) {
          return  DynamicThemesExampleApp();
        }
    );
  }
}

class DynamicThemesExampleApp extends StatefulWidget {
  const DynamicThemesExampleApp({Key? key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DynamicThemesExampleApp> {

   int currentIndex=0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    currentIndex = 0;
    Get.put(sectionController());
    Get.put(adsController());
    Get.put(allShopController());
    Get.put(NotificationsController());
    if(MyData.auth_user){
      late LoginModel loginModle = LoginModel.fromJson(GetStorage().read('store'));
      Get.put(favoriteController()).getFavoriteApi(loginModle.id.toString());
    }

  }


  void changePage(int? index) {
    setState(() {
      currentIndex = index!;
    });
  }
  int dropdownValue = 0;
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
   // dropdownValue = DynamicTheme.of(context)!.themeId;
    return Scaffold(

   body: IndexedStack(
     index: currentIndex,
     children: [
       HomeScreen(),
       MyData.auth_user==true? favoriteScreen():authFavorite(),
       NotificationsScreen(),
       ConnectWithUsScreen(),
      ],
   ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
              context: context, builder: (_) => CustomChampionDialog());

        },
        // backgroundColor: Colors.green,
        child: const Icon(Icons.volunteer_activism),
      ),

      // bottomNavigationBar: BubbleBottomBar(
      //   hasNotch: true,
      //   // fabLocation: BubbleBottomBarFabLocation.end,
      //   opacity: .2,
      //   currentIndex: currentIndex,
      //   onTap: changePage,
      //   borderRadius: BorderRadius.vertical(
      //     top: Radius.circular(16),
      //   ), //border radius doesn't work when the notch is enabled.
      //   elevation: 8,
      //   tilesPadding: EdgeInsets.symmetric(
      //     vertical: 8.0,
      //   ),
      //   items: <BubbleBottomBarItem>[
      //     BubbleBottomBarItem(
      //
      //       backgroundColor: Theme.of(context).primaryColor,
      //       icon: Icon(
      //         Icons.home,
      //         color: Colors.black,
      //       ),
      //       activeIcon: Icon(
      //         Icons.home,
      //         color: Theme.of(context).primaryColor,
      //       ),
      //       title: Text("Home".tr),
      //     ),
      //     BubbleBottomBarItem(
      //       // showBadge: true,
      //       // badge: Text("0",style:  Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
      //       // badgeColor: Colors.red,
      //         backgroundColor: Theme.of(context).primaryColor,
      //         icon: Icon(
      //           Icons.favorite_border,
      //           color: Colors.black,
      //         ),
      //         activeIcon: Icon(
      //           Icons.favorite,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         title: Text("favorite".tr)),
      //     BubbleBottomBarItem(
      //         showBadge: true,
      //         badge: Text(MyData.Number_of_notifications,style:  Theme.of(context).textTheme.headlineSmall!.copyWith(color: Colors.white),),
      //         badgeColor: Colors.red,
      //         backgroundColor: Theme.of(context).primaryColor,
      //         icon: Icon(
      //           Icons.notifications_active_outlined,
      //           color: Colors.black,
      //         ),
      //         activeIcon: Icon(
      //           Icons.notifications,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         title: Text("Notifications".tr)),
      //     BubbleBottomBarItem(
      //         backgroundColor: Theme.of(context).primaryColor,
      //         icon: Icon(
      //           Icons.call,
      //           color: Colors.black,
      //         ),
      //         activeIcon: Icon(
      //           Icons.call,
      //           color: Theme.of(context).primaryColor,
      //         ),
      //         title: Text("Contact us".tr))
      //   ],
      // ),


      // bottomNavigationBar: Container(
      //   height: 70,
      //   child: ClipRRect(
      //     borderRadius: BorderRadius.only(
      //         topLeft: Radius.circular(40),
      //         topRight: Radius.circular(40)),
      //     child:

          // BottomNavigationBar(
          //     type: BottomNavigationBarType.fixed,
          //     // backgroundColor: Color.fromARGB(255, 193, 209, 240),
          //     iconSize: 20.0,
          //     selectedIconTheme: IconThemeData(size: 28.0),
          //     // selectedItemColor: Color.fromARGB(255, 46, 90, 172),
          //     unselectedItemColor: Colors.black,
          //     selectedFontSize: 16.0,
          //     unselectedFontSize: 12,
          //     currentIndex: currentIndex,
          //     onTap: (index){
          //       setState(() {
          //         currentIndex = index;
          //       });
          //       //    currentIndex: index;
          //       print(index);
          //     },
          //     items: <BottomNavigationBarItem>[
          //
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.home),
          //         label: "Home".tr,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.favorite),
          //         label:"favorite".tr,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.notifications),
          //         label: "Notifications".tr,
          //       ),
          //       BottomNavigationBarItem(
          //         icon: Icon(Icons.call),
          //         label: "Contact us".tr,
          //       ),
          //     ]),
          // Replace the entire bottomNavigationBar section with this:

          bottomNavigationBar: Container(
          height: 70,
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              iconSize: 20.0,
              selectedIconTheme: IconThemeData(size: 28.0),
              unselectedItemColor: Colors.black,
              selectedFontSize: 12.0, // Reduced from 16.0
              unselectedFontSize: 10, // Reduced from 12
              currentIndex: currentIndex,
              onTap: (index) {
                setState(() {
                  currentIndex = index;
                });
                print(index);
              },
              items: <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: "Home".tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.favorite),
                  label: "favorite".tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.notifications),
                  label: "Notifications".tr,
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.call),
                  label: "Contact us".tr,
                ),
              ],
            ),
          ),
        ),


    );
  }
}
class CustomChampionDialog extends StatefulWidget {


  @override
  CustomChampionDialogState createState() => new CustomChampionDialogState();
}

class CustomChampionDialogState extends State<CustomChampionDialog> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.transparent,
      child: Container(width: 160,
        child: Card(
          shape: RoundedRectangleBorder( borderRadius: BorderRadius.circular(4),),
          color: Colors.white,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Wrap(
            children: <Widget>[
              Container(
                padding: EdgeInsets.all(20),
                width : double.infinity,
                child: Column(
                  children: <Widget>[
                    Container(height: 15),
                    Text("عزيزي المستخدم لاستعراض خدماتك عبر منصة ذمار بين يديك يرجى الدخول على موقعنا بنقر على زر موافق", textAlign: TextAlign.center,style: MyText.title(context)?.copyWith(color:Theme.of(context).primaryColor)),
                    Container(height: 70),
                     Container(height: 15),
                    Text("أو التواصل مع الدعم الفني عبر الارقام التالية",  textAlign: TextAlign.center,style: MyText.title(context)?.copyWith(color: Colors.black)),
                    Container(height: 20),
                    Text("771611353", textAlign : TextAlign.center, style: MyText.subhead(context)?.copyWith(color: MyColors.grey_40)),
                    Container(height: 10),
                  ],
                ),
              ),
              InkWell(
                onTap: () async {
                  const url = "https://test.link-pm.com/PHP/Control/C_Login_Admin.php";
                  if (await canLaunch(url))
                    await launch(url);
                  else
                    // can't launch url, there is some error
                    throw "Could not launch $url";

                  // if (await canLaunch("https://frha2.000webhostapp.com/PHP/Control/C_Login_User.php")) {
                  //   await launch("https://frha2.000webhostapp.com/PHP/Control/C_Login_User.php");
                  // } else {
                  //   throw 'Could not launch '+"https://frha2.000webhostapp.com/PHP/Control/C_Login_User.php";
                  // }

                },
                child: Container(
                  padding: EdgeInsets.all(20),
                  width : double.infinity, color:Theme.of(context).primaryColor,
                  child: Column(
                    children: <Widget>[
                      Text("موافق", style: MyText.title(context)?.copyWith(color: Colors.white)),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
