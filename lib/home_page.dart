import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:mywidget/category_card.dart';

class HomePage extends StatefulWidget{
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  late Color mainColor;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    mainColor = Colors.indigo;

    return Scaffold(
      
      bottomNavigationBar: Container(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        height: 80,
        color: Colors.indigo,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            BottomNavItem(title: "Trending", svgSrc: "assets/images/trending.svg", press: (){},),
            BottomNavItem(title: "Home", svgSrc: "assets/images/calendar.svg", isActive: true, press: (){},),
            BottomNavItem(title: "Saya", svgSrc: "assets/images/account.svg",press: (){},),
          ],
        ),
      ),
      body: Stack(
        children: <Widget>[
          Container(
            height: size.height * .45,
            decoration: BoxDecoration(
              color: mainColor,
              image: DecorationImage(
                image: AssetImage("assets/images/honeybg.png"),
                alignment: Alignment.centerLeft,
                colorFilter: ColorFilter.mode(mainColor.withOpacity(0.1), BlendMode.dstATop )
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      alignment: Alignment.center,
                      height: 52,
                      width: 52,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: SvgPicture.asset("assets/images/natural.svg"),
                    ),
                  ),
                  Text(
                    "Halo \nAyah & Bunda",
                    style: TextStyle(
                      fontWeight: FontWeight.w900,
                      fontSize: 42,
                    )
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    padding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(29.5),
                    ),
                    child: TextField( 
                      decoration: InputDecoration(
                        hintText: "Cari",
                        icon: SvgPicture.asset("assets/images/search.svg"),
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                  Expanded(
                    
                    child: GridView.count(
                      
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 15,
                      mainAxisSpacing: 15,
                      
                      children: <Widget>[
                        CategoryCard(
                          svgSrc: "assets/images/healthy (1).svg",
                          title: "Kalkulator Gizi",
                        ),
                        CategoryCard(
                          svgSrc: "assets/images/eat-healthy (1).svg",
                          title: "Asupan Sehat",
                        ),
                        CategoryCard(
                          svgSrc: "assets/images/sleep.svg",
                          title: "Kualitas Tidur",
                        ),
                        CategoryCard(
                          svgSrc: "assets/images/healthy-study.svg",
                          title: "Pembelajaran Kesehatan",
                        ),
                        
                      ],
                    )
                  ),
                ],
              ),
            )
          )
        ],
      ),
    );
  }
  
}

class BottomNavItem extends StatelessWidget {
  final String svgSrc;
  final String title;
  final Function press;
  final bool isActive;
  const BottomNavItem({
    super.key, required this.svgSrc, required this.title, required this.press, this.isActive = false,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){},
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: <Widget>[
          SvgPicture.asset(
            svgSrc,
            width: 40,
            height: 40,
            color: isActive? Colors.white : Colors.black,
            ),
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isActive? Colors.white : Colors.black
            ),
          ),
        ],
      ),
    );
  }
}

