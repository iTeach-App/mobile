import 'package:flutter/material.dart';
import 'package:myapp/page_2.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: ElevatedButton(onPressed: (){
      Navigator.of(context).push(MaterialPageRoute(builder: (BuildContext context){
        return const Page2();
      },
      ),
      );
    }, child: const Text('Sium'),),
    );
  }
}
