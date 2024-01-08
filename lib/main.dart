import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_ecommerce_application_ui/Shop.dart';
import 'package:page_transition/page_transition.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  late AnimationController _scaleController;
  late Animation<double> _scaleAnimation;
  bool hide = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scaleController = AnimationController(
        vsync: this,
      duration: Duration(milliseconds: 800),
    );

    _scaleAnimation = Tween<double>(
      begin: 1.0,
      end: 30.0,
    ).animate(_scaleController
    )..addStatusListener((status) {
      if(status == AnimationStatus.completed){
        Navigator.push(context,
            PageTransition(
                type: PageTransitionType.fade,
              child: Shop(),
            )
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/splash.jpg'),
          fit: BoxFit.cover,
        )),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.bottomRight,
                  colors: [
            Colors.black.withOpacity(.9),
            Colors.black.withOpacity(.3)
          ])),
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Text("Brand New Perspective",style: TextStyle(color: Colors.white, fontSize: 40, fontWeight: FontWeight.bold) ),
                SizedBox(height: 20,),
                Text("Let's start with our summer collection", textAlign: TextAlign.center ,style: TextStyle(color: Colors.white, fontSize: 20) ),
                SizedBox(height: 100,),
                InkWell(
                  onTap: (){
                    setState(() {
                      hide = true;
                    });
                    _scaleController.forward();

                  },
                  child: AnimatedBuilder(
                    animation: _scaleController,
                    builder: (context, child)=> Transform.scale(
                      scale: _scaleAnimation.value,
                      child: Container(
                        height: 50,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(50),
                        ),
                        child: Center(
                          child: hide==false ? Text("Get Start", style: TextStyle(fontWeight: FontWeight.bold),): Container(),
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                Container(
                  height: 50,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.white),
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(
                    child: Text("Create Account",  style: TextStyle( color: Colors.white ,fontWeight: FontWeight.bold),
                  ),
                ),),
                SizedBox(height: 30,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
