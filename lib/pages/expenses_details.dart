import 'package:exp_app/models/combined_model.dart';
import 'package:exp_app/utils/math_operations.dart';
import 'package:exp_app/utils/utils.dart';
import 'package:exp_app/providers/expenses_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../utils/constants.dart';

class ExpensesDetails extends StatefulWidget {
  const ExpensesDetails({Key? key}) : super(key: key);

  @override
  State<ExpensesDetails> createState() => _ExpensesDetailsState();
}

class _ExpensesDetailsState extends State<ExpensesDetails> {
  final _scrollController = ScrollController();
  double _offset = 0;

  void _listener(){
    setState(() {
      _offset = _scrollController.offset/100;
      print(_offset);
      
      
    });

  }

  @override
  void initState() {
    _scrollController.addListener(_listener);
    
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listener);
    _scrollController.dispose();
    // TODO: implement dispose
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final exProvider = context.watch<ExpensesProvider>();
    final cList = exProvider.allItemList;
    double totalExp = 0.0;
    totalExp = cList.map((e) => e.amount).fold( 0.0, (a, b) => a + b);

    if(_offset > 0.80 ) _offset = 0.80;
    // final expenses = exProvider.eList;
    // final features = exProvider.fList;
    // List<CombinedModel> cList = [];

    // for (var x in expenses) {
    //   for (var y in features) { 
    //     if(x.link == y.id){
    //       cList.add(CombinedModel(
    //         category: y.category,
    //         color: y.color,
    //         icon: y.icon,
    //         amount: x.expense,
    //         comment: x.comment
    //       ));

    //     }
    //   }
    // }
    return  Scaffold(
      backgroundColor: Theme.of(context).primaryColorDark,
      body:  CustomScrollView(
        controller: _scrollController,
        slivers: [
           SliverAppBar(
            expandedHeight: 125.0,
            title: const Text('Desglose de  gastos'),
            pinned: true,
            flexibleSpace: FlexibleSpaceBar(
              title: Align(
                alignment: Alignment(_offset,1),
                
                child: Text(getAmountFormat(totalExp))),
              centerTitle: true,
              background: const Align(
                alignment: AlignmentDirectional.bottomCenter,
                child: Text('Total'),
              ),

            ),
          ),

          SliverToBoxAdapter(
            child: Container(
              padding: const EdgeInsets.only(top: 15.0),
              height: 40.0,
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Container(
                decoration: Constants.sheetBoxDecoration(
                  Theme.of(context).primaryColorDark,
                ),
              ),
            ),
          ),
          SliverList(delegate: SliverChildBuilderDelegate(
            (context, i) {
              var item = cList[i];
            return ListTile(
              leading: Stack(
                alignment: AlignmentDirectional.center,
                children: [
                   Icon(
                    Icons.calendar_today,
                    color: item.color.toColor(),
                    size: 40.0,),
                  Positioned(
                    top: 16,
                    child: Text(item.day.toString(),
                    ))
                ],
              ),
              title: Row(
                children: [
                  Text(item.category),
                  const SizedBox(width: 8.0,), 
                  Icon(
                    item.icon.toIcon(),
                    color: item.color.toColor(),
                    // size: 18.0,
                  )
                ],
              ),
              subtitle: Text(item.comment, ),
              trailing: Column(
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    getAmountFormat(item.amount),
                    style: const TextStyle(
                      fontWeight:  FontWeight.bold
                    ),

                  ),
                  Text(
                    '${(100 * item.amount / totalExp).toStringAsFixed(2)}%',
                    style: const TextStyle(
                      fontSize: 11.0
                    ),
                    )
                ],
              ),

            );
            
          },
          childCount: cList.length,
          ))
        ],
      ),
    );
  }
}