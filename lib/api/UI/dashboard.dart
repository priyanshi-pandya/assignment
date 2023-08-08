import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/api_bloc.dart';
import '../constants/colors.dart';
import '../modal/image_modal.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  List btnColors = List.filled(3, false);
  final searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    context.read<APIBLoc>().add(FetchDataEvent());
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              //greeting container
              Padding(
                padding: const EdgeInsets.only(top: 10.0, right: 20, left: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        //hello label
                        Text(
                          "Hello!",
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                          ),
                        ),
                        SizedBox(
                          height: 2,
                        ),
                        //user name label
                        Text(
                          "User",
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.w700,
                            fontFamily: 'Inter',
                          ),
                        ),
                      ],
                    ),
                    //image container
                    Container(
                      height: 44,
                      width: 44,
                      decoration: BoxDecoration(
                        color: KColors.kGrey,
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.asset(
                          'asset/images/user.jpeg',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 15.0, horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Container(
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 1,
                              color: KColors.kGrey,
                              spreadRadius: 0,
                            ),
                          ],
                        ),
                        child: TextField(
                          onTapOutside: (event) =>
                              FocusScope.of(context).unfocus(),
                          controller: searchController,
                          readOnly: true,
                          cursorColor: KColors.kBlue,
                          decoration: const InputDecoration(
                            prefixIcon: Icon(
                              Icons.search,
                              color: KColors.kBlue,
                              size: 24,
                            ),
                            hintText: "Search",
                            border: InputBorder.none,
                            isDense: true,
                            contentPadding: EdgeInsets.symmetric(
                                horizontal: 15, vertical: 15),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 9,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        // dataBloc.add(FetchDataEvent());
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: KColors.kBlue,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        padding: const EdgeInsets.symmetric(
                            vertical: 18.0, horizontal: 25.0),
                      ),
                      child: const Text(
                        "Filter",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              //all property label
             const Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 18.0, horizontal: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "All Property",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w700,
                      fontFamily: 'Inter',
                    ),
                  ),
                ),
              ),
              //all properties list
              SizedBox(
                height: 270,
                child:
                    BlocBuilder<APIBLoc, DataState>(
                        builder: (context, state) {
                    switch (state.runtimeType) {
                      case InitialDataState:
                        {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      case LoadedDataState:
                        {
                          print("Entered in Loaded data state");
                          var currentState = state as LoadedDataState;
                          ImageDataFromPexel mydata = currentState.data;
                          return ListView.builder(
                            itemCount: mydata.photos?.length,
                            padding: const EdgeInsets.only(left: 18),
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (context, index) => Card(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    //image container
                                    Container(
                                      margin: const EdgeInsets.all(10),
                                      height: 180,
                                      width: 180,
                                      decoration: BoxDecoration(
                                        color: KColors.kGrey,
                                        borderRadius: BorderRadius.circular(30),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(30),
                                        child: Image.network(
                                          "${mydata.photos?[index].src?.medium}" ??
                                              "ERROR 403",
                                          errorBuilder:
                                              (context, error, stackTrace) =>
                                                  Center(child: Text("$error")),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    //description container
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: SizedBox(
                                        width: 180,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Text(
                                              "3 Story Office",
                                              style: TextStyle(
                                                color: KColors.kHeadingColour,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                              ),
                                            ),
                                            Spacer(),
                                            Text(
                                              "\$267000",
                                              style: TextStyle(
                                                color: KColors.kBlue,
                                                fontWeight: FontWeight.w700,
                                                fontFamily: 'Inter',
                                                fontSize: 12,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 2,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.symmetric(horizontal: 12),
                                      child: SizedBox(
                                        width: 180,
                                        child: Row(
                                          children: [
                                            Text(
                                              "2000sqft",
                                              style: TextStyle(
                                                color: KColors.kBorderColor,
                                                fontWeight: FontWeight.w400,
                                                fontFamily: 'Inter',
                                                fontSize: 10,
                                              ),
                                            ),
                                            Spacer(),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Icon(
                                                    Icons.person_outline_outlined,
                                                    size: 12,
                                                    color: KColors.kOrange),
                                                Text(
                                                  "25",
                                                  style: TextStyle(
                                                    color: KColors.kBorderColor,
                                                    fontWeight: FontWeight.w400,
                                                    fontFamily: 'Inter',
                                                    fontSize: 10,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }
                      case ErrorDataState:
                        {
                          var errorState = state as ErrorDataState;
                          return Center(
                              child:
                                  Text("Error imma called ${errorState.error}"));
                        }
                      default:
                        {
                          print("Noob");
                          return Text("Noob");
                        }
                    }
                }),
              ),
              //featured property label
              const Padding(
                padding: EdgeInsets.only(top: 25.0, bottom: 10, left: 20),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    "Featured Property",
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 18,
                      fontFamily: 'Inter',
                      color: KColors.kHeadingColour,
                    ),
                  ),
                ),
              ),
              //featured property list
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ListView.builder(
                  primary: false,
                  reverse: true,
                  shrinkWrap: true,
                  itemCount: 5,
                  itemBuilder: (context, index) => Card(
                    margin:
                        const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Row(
                        children: [
                          //image section
                          Container(
                            height: 70,
                            width: 70,
                            decoration: BoxDecoration(
                              color: KColors.kGrey,
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child:

                            BlocBuilder<APIBLoc, DataState>(
                              builder: (context, state){
                                switch(state.runtimeType){
                                  case InitialDataState: {
                                    return const Center(child: CircularProgressIndicator());
                                  }
                                  case LoadedDataState: {
                                    var states = state as LoadedDataState;
                                    var mydata = states.data;
                                    return ClipRRect(
                                      borderRadius: BorderRadius.circular(20),
                                      child: Image.network(
                                          "${mydata.photos?[index].src?.medium}",
                                          fit: BoxFit.cover),
                                    );
                                  }
                                  case ErrorDataState: {
                                    var error = state as LoadedDataState;
                                    return Text("$error");
                                  }
                                  default:{
                                    return const SizedBox();
                                  }
                                }
                              }
                            ),
                          ),
                          const Flexible(
                            child: Column(
                              children: [
                                //price and title
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "2 Story Office",
                                        style: TextStyle(
                                          color: KColors.kHeadingColour,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w700,
                                          fontFamily: 'Inter',
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        "\$267000",
                                        style: TextStyle(
                                            color: KColors.kBlue,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Inter'),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(
                                      left: 9, top: 6, bottom: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: KColors.kGrey,
                                        size: 14,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        "BW Street, NY New York",
                                        style: TextStyle(
                                          color: KColors.kBorderColor,
                                          fontFamily: 'Inter',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                //area section
                                Padding(
                                  padding: EdgeInsets.only(left: 12),
                                  child: Row(
                                    children: [
                                      Text(
                                        "2000 sqft",
                                        style: TextStyle(
                                          color: KColors.kBorderColor,
                                          fontFamily: 'Inter',
                                          fontSize: 10,
                                          fontWeight: FontWeight.w400,
                                        ),
                                      ),
                                      Spacer(),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.end,
                                        children: [
                                          Icon(
                                            Icons.person_outline_outlined,
                                            size: 14,
                                            color: KColors.kOrange,
                                          ),
                                          Text(
                                            "25",
                                            style: TextStyle(
                                              color: KColors.kBorderColor,
                                              fontFamily: 'Inter',
                                              fontSize: 10,
                                              fontWeight: FontWeight.w400,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
