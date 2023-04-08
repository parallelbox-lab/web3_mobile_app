import 'package:flutter/material.dart';
import 'package:web3_mobile_app/core/base/base_view.dart';
import 'package:web3_mobile_app/core/service_injector/balance_list.dart';
import 'package:web3_mobile_app/modules/dashboard_module/dashboard_view_model/dashboard_view_model.dart';
import 'package:web3_mobile_app/shared/custom_text.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseView(
    vmBuilder: (context)=>  DashboardViewModel(),
     builder: _buildScreen );
  }
   Widget _buildScreen(BuildContext context,  DashboardViewModel model){
    final size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor:const Color.fromARGB(255, 3, 101, 181),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child:getAppbar(context) ),
       body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: size.width,
            height: size.height * 0.25,
            decoration:const BoxDecoration(
              color: Color.fromARGB(255, 3, 101, 181) 
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: size.width,
                  height: 110,
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: List.generate(balanceLists.length, (index) {
                       return Padding(
                         padding: const EdgeInsets.only(right:8.0),
                         child: SizedBox(
                            width: size.width * 0.7,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CustomText(text:balanceLists[index]['currency'],color: Colors.white, ),
                                    const SizedBox(width: 5,),
                                    CustomText(text:balanceLists[index]['amount'],color: Colors.white,size: size.width / 9,weight: FontWeight.w600, ),
                                    
                                  ],
                                ),
                                 const  SizedBox(height: 3,),
                                 CustomText(text:balanceLists[index]['description'],color: Colors.white,size: size.width / 29,weight: FontWeight.w600, ),
                  
                              ],
                            ),
                          ),
                       );
                      }),
                    ),
                  ),
                )
              ],

            ),

          ),
          Expanded(
             
            child: SizedBox(
              width: size.width,
              child: Row(children: [
                Container(
                  child: CustomText(text: "Add Money", color: Colors.white,),
                )
                
              ],),
            ),
          )

        ],
       ) ,
    );
   }
   Widget getAppbar(BuildContext context) {
      final size = MediaQuery.of(context).size;
    return AppBar(
      elevation: 0,
      backgroundColor: const Color.fromARGB(255, 3, 101, 181),
      leading: IconButton(onPressed: (){}, icon:  Icon(Icons.account_circle_outlined, size: size.width / 10,)),
      actions: [
        IconButton(onPressed: (){}, icon: Icon(Icons.search_outlined,size: size.width / 10,)),
        const SizedBox(width: 5,)
      ],
    );
   }
}