import 'package:flutter/material.dart';

class BrandBanner extends StatelessWidget {
  final Color? backgroundColor;
  final double height;
  final EdgeInsets padding;
  final double headerLineSpacing;
  final String bannerHeader;
  final Color bannerHeaderColor;
  final double bannerHeaderSize;
  final String bannerSubheader;
  final Color bannerSubheaderColor;
  final double bannerSubheaderSize;
  const BrandBanner({
    Key? key, 
    this.backgroundColor = Colors.black, 
    this.height = 400, 
    this.padding = const EdgeInsets.all(15), 
    this.headerLineSpacing = 5,
    this.bannerHeader = "Blue Hive Store", 
    this.bannerHeaderColor = Colors.white, 
    this.bannerHeaderSize = 30, 
    this.bannerSubheader = 'Flutter e-commerce application.', 
    this.bannerSubheaderColor = Colors.white, 
    this.bannerSubheaderSize = 20,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return // * auth screen banner
              Container(
                width: double.infinity,
                height: height,
                padding: padding,
                // width: 300,
                // height: 300,
                color: backgroundColor,
                // color: Colors.grey[400],
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [

                    
                    Text(
                      bannerHeader,
                      style: TextStyle(
                        color: bannerHeaderColor,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,

                      ),
                    ),

                    Container(height: 0,),

                    Text(
                      bannerSubheader,
                      style: TextStyle(
                        color: bannerSubheaderColor,
                        fontSize: bannerSubheaderSize,
                        // fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              );
  }
}