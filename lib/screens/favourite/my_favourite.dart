import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_examples/provider/favourite_provider.dart';

class MyFavouriteItems extends StatefulWidget {
  const MyFavouriteItems({super.key});

  @override
  State<MyFavouriteItems> createState() => _MyFavouriteItemsState();
}

class _MyFavouriteItemsState extends State<MyFavouriteItems> {
  @override
  Widget build(BuildContext context) {
    final favouriteProvider= Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('My Favourite Items'),
        actions: [
          InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => MyFavouriteItems()));
              },
              child: Icon(Icons.favorite)),
          SizedBox(width: 20,),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
                itemCount: favouriteProvider.selected.length,
                itemBuilder: (context, index){
                  return Consumer<FavouriteProvider>(builder: (context, value, child){
                    return ListTile(
                      onTap: (){
                        // favouriteProvider.addItem(index);

                        if(value.selected.contains(index)){
                          value.removeItem(index);
                        }
                        else{
                          value.addItem(index);
                        }

                        // setState(() {
                        //
                        // });
                      },
                      title: Text('Item '+ index.toString()),
                      trailing: Icon( value.selected.contains(index)
                      // favouriteProvider.selected.contains(index)
                      // selected.contains(index)
                          ? Icons.favorite :
                      Icons.favorite_outline),
                    );
                  });
                }),
          ),
        ],
      ),
    );
  }
}
