import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:state_provider_stateless/screen/favourite/my_favourite.dart';

import '../../provider/favourite_provider.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({Key? key}) : super(key: key);

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {



  @override
  Widget build(BuildContext context) {
    //final favouriteProvider=Provider.of<FavouriteItemProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
        actions: [
          InkWell(
            onTap:(){
              Navigator.push(context, MaterialPageRoute(builder: (context)=>MyFavouriteItemScreen()) );
            },
            child: Icon(Icons.favorite)),
              SizedBox(width: 20),

        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(itemBuilder: (context, index){
              return Consumer<FavouriteItemProvider>(builder: (context, value, child){
                return ListTile(
                  onTap: (){
                    if(value.selectedItem.contains(index)){
                      value.removeItem(index);
                    } else{
                      value.addItem(index);
                    }
                    value.addItem(index);

                  },
                  title: Text('Item' + index.toString()),
                  trailing: Icon(value.selectedItem.contains(index)?Icons.favorite: Icons.favorite_outline_outlined),
                );
              });

            }),
          )
        ],
      ),
    );
  }
}
