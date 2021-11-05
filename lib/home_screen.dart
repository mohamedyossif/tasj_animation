import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>
    with SingleTickerProviderStateMixin {
  AnimationController? animationController;
  Animation<double>? animation;
  var isCheckContainer=true;
  var isCheckRow=true;
  @override
  void initState() {
    super.initState();
    animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    animation = Tween(begin: 70.0, end: 100.0).animate(animationController!)
      ..addListener(() {
        setState(() {}); 
      })
      ..addStatusListener((status) async {
        if (status == AnimationStatus.completed) {
          setState(() {
            animationController!.reverse();
          });
        } else if (status == AnimationStatus.dismissed) {
           if(isCheckContainer==false){
            
              isCheckRow=!isCheckRow;
          }
            isCheckContainer=!isCheckContainer;
           
          setState(() {
            animationController!.forward();
          });
        } 
      });
      animationController!.forward();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Container(
                color: Colors.red,
                width: isCheckContainer==true&&isCheckRow==true? animation!.value:70.0,
                height: isCheckContainer==true&&isCheckRow==true? animation!.value:70.0,
              ),
              const SizedBox(
            width: 20.0,
          ),
          Container(
            color: Colors.green,
            width: isCheckContainer==false&&isCheckRow==true ?animation!.value:70.0,
            height:isCheckContainer==false&&isCheckRow==true?animation!.value:70.0,
          )
            ],
          ),
          const SizedBox(height: 20.0,),
           Row(
            children: [
              Container(
                color: Colors.yellow,
                width: isCheckContainer==true &&isCheckRow==false? animation!.value:70.0,
                height: isCheckContainer==true &&isCheckRow==false? animation!.value:70.0,
              ),
              const SizedBox(
            width: 20.0,
          ),
          Container(
            color: Colors.purple,
            width: isCheckContainer==false &&isCheckRow==false?animation!.value:70.0,
            height:isCheckContainer==false &&isCheckRow==false?animation!.value:70.0,
          )
            ],
          ),
          ],
      ),
    ));
  }
 
}
