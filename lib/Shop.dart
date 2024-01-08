import 'package:flutter/material.dart';
import 'package:flutter_ecommerce_application_ui/CategoryPage.dart';

class Shop extends StatefulWidget {
  const Shop({super.key});

  @override
  State<Shop> createState() => _ShopState();
}

class _ShopState extends State<Shop> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              height: 500,
              decoration: BoxDecoration(
                image: DecorationImage(
                    image: AssetImage('assets/images/background.jpg'),
                    fit: BoxFit.cover),
              ),
              child: Container(
                decoration: BoxDecoration(
                  gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.2)
                  ]),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.favorite, color: Colors.white,)
                          ),
                          IconButton(
                              onPressed: (){},
                              icon: Icon(Icons.shopping_cart, color: Colors.white,)
                          ),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(20.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Our New Products", style: TextStyle(color: Colors.white, fontSize: 35, fontWeight: FontWeight.bold),),
                            SizedBox(height: 15,),
                            Row(
                              children: [
                                Text("VIEW MORE", style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600),),
                                SizedBox(width: 5,),
                                Icon(Icons.arrow_forward_ios, color: Colors.white, size: 15,)
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Categories", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("All")
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeCategory(image: 'assets/images/beauty.jpg', title: 'Beauty', tag: 'beauty'),
                        makeCategory(image: 'assets/images/clothes.jpg', title: 'Clothes', tag: 'clothes'),
                        makeCategory(image: 'assets/images/perfume.jpg', title: 'Perfume', tag: 'perfume'),
                        makeCategory(image: 'assets/images/glass.jpg', title: 'Glass', tag: 'glass'),
                      ],
                    ),
                  ),
                  SizedBox(height: 40,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Best Selling By Category", style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),),
                      Text("All")
                    ],
                  ),
                  SizedBox(height: 30,),
                  Container(
                    height: 150,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: [
                        makeBestCategory(image: 'assets/images/tech.jpg', title: 'Tech'),
                        makeBestCategory(image: 'assets/images/watch.jpg', title: 'Watch'),
                        makeBestCategory(image: 'assets/images/perfume.jpg', title: 'Perfume'),
                        makeBestCategory(image: 'assets/images/glass.jpg', title: 'Glass'),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
  Widget makeCategory({image, title, tag}){
    return AspectRatio(
      aspectRatio: 2/2.2,
      child: Hero(
        tag: tag,
        child: GestureDetector(
          onTap: (){
            Navigator.push(context, MaterialPageRoute(builder: (context)=> CategoryPage(title: title, image: image, tag: tag)));
          },
          child: Material(
            child: Container(
              margin: EdgeInsets.only(right: 20),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(image),
                    fit: BoxFit.cover,
                  )
              ),
              child: Container(
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
                    Colors.black.withOpacity(.8),
                    Colors.black.withOpacity(.0)
                  ]),
                ),
                child: Align(
                  alignment: Alignment.bottomLeft,
                  child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget makeBestCategory({image, title}){
    return AspectRatio(
      aspectRatio: 3/2.2,
      child: Container(
        margin: EdgeInsets.only(right: 20),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage(image),
              fit: BoxFit.cover,
            )
        ),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(begin: Alignment.bottomRight, colors: [
              Colors.black.withOpacity(.8),
              Colors.black.withOpacity(.0)
            ]),
          ),
          child: Align(
            alignment: Alignment.bottomLeft,
            child: Text(title, style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 15),),
          ),
        ),
      ),
    );
  }

}
