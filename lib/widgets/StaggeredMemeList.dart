import 'package:flutter/cupertino.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class StaggeredMemeList extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return StaggeredMemeListState();
  }



}

class StaggeredMemeListState extends State<StaggeredMemeList>
{
  @override
  Widget build(BuildContext context) {
  return  StaggeredGridView.countBuilder(
    crossAxisCount: 4,
    itemCount: 27,
    itemBuilder: (BuildContext context, int index) {
      return Image.asset("bgListImg/image${++index}");
    },

    staggeredTileBuilder: (int index) =>
    new StaggeredTile.fit(2),
    mainAxisSpacing: 4.0,
    crossAxisSpacing: 4.0,
  );
  }

}