import 'package:flutter/material.dart';

class BalancePage extends StatelessWidget {
  const BalancePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomScrollView(
      slivers: 
      [
        SliverAppBar(
          elevation: 0.0,
          expandedHeight: 120.0,
          flexibleSpace: FlexibleSpaceBar(
            background: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Text(
                  '\$ 2,500.00',
                  style: TextStyle(
                    fontSize: 30.0
                  ),),

                Text(
                  'Balance',
                  style: TextStyle(
                    fontSize: 14.0
                  ),
                  )

              ],
            ),
          ),
        ),

        SliverList(
          
          delegate: SliverChildListDelegate(
            
            [

             Stack(
              children: [
                Container(
                  height: 250.0,
                  decoration: BoxDecoration(
                    color: Theme.of(context).primaryColorDark,
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(30.0),
                      topRight: Radius.circular(30.0)
                    )
                  ),
                ),
                 Padding(
                   padding: const EdgeInsets.only(top: 90.0),
                   child: Container(
                    height: 800.0,
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColorLight,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0)
                      )
                    ),
                ),
                ),
              ],

             )
            ]
            
            
            ))
      ],
    );
  }
}