import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider_examples/provider/favourite_provider.dart';
import 'package:provider_examples/screens/favourite/my_favourite.dart';

class FavouriteScreen extends StatefulWidget {
  const FavouriteScreen({super.key});

  @override
  State<FavouriteScreen> createState() => _FavouriteScreenState();
}

class _FavouriteScreenState extends State<FavouriteScreen> {

  List<int> selected= [];

  @override
  Widget build(BuildContext context) {
    // final favouriteProvider= Provider.of<FavouriteProvider>(context);
    print('build');
    return Scaffold(
      appBar: AppBar(
        title: Text('Favourite App'),
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
                itemCount: 30,
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
