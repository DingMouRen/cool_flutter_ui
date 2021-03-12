import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ui/config/RouterManager.dart';
import 'package:oktoast/oktoast.dart';

class HomePage extends StatelessWidget{

  final List<String> listGif = [
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',
    'assets/image/test.gif',

  ];
  
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("flutter ui"),
        centerTitle: true,
      ),
      body: _getGridView(context),
    );
  }

  _getGridView(BuildContext context) {
    return Container(
      color: Colors.white,
      padding: EdgeInsets.only(left: 16,right: 16,top: 10,bottom: 10),
      child: GridView.builder(
          itemCount: listGif.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            //横轴元素数量
            crossAxisCount: 2,
            //纵轴间距
            mainAxisSpacing: 10,
            //横轴间距
            crossAxisSpacing: 10,
            childAspectRatio: 1
          ),
          itemBuilder: (context,index){
            return _getItem(index,context);
          }
      ),
    );
  }

  _getItem(int index,BuildContext context) {
    return  InkWell(
      onTap: (){
        RouterManager.to('page1', context);
      },
      child: Card(
          child: Image.asset(listGif[index]),
          elevation: 6,
          shadowColor: Colors.primaries[index % Colors.primaries.length],
          color: Colors.primaries[index % Colors.primaries.length],
        ),
    );
  }
}
