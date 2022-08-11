import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_weather_app/api/api_provider/api_provider.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key? key,
    required this.lat,
    required this.long,
  }) : super(key: key);
  final double lat;
  final double long;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isLoading = true;
  bool isError = false;
  late CurrentWeather currentWeather;
  late OneCallData oneCallData;

  void init() async {
    isLoading = true;
    setState(() {});
    currentWeather = await ApiProvider.getCurrentWeatherByLatLong(
        lat: widget.lat, long: widget.long);
    oneCallData = await ApiProvider.getOneCallDataByLatlong(
        latitude: widget.lat, longitude: widget.long);
    isLoading = false;
    setState(() {});
  }

  Future<void> update({required String searchText}) async {
    isLoading = true;
    setState(() {});
    try {
      currentWeather =
          await ApiProvider.getCurrentWeatherByText(searchText: searchText);
      oneCallData = await ApiProvider.getOneCallDataByLatlong(
          latitude: widget.lat, longitude: widget.long);
      isLoading = false;
      isError = false;
      setState(() {});
    } catch (e) {
      isError = true;
      isLoading = false;
      setState(() {});
    }
  }

  @override
  void initState() {
    init();
    super.initState();
  }

  final TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.lightBlueAccent,
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarColor: Colors.lightBlueAccent,
          statusBarBrightness: Brightness.light,
          statusBarIconBrightness: Brightness.light,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(36))),
        flexibleSpace: Container(
          height: 78,
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
                Colors.lightBlueAccent,
                Colors.lightBlueAccent,
                Colors.blue.withOpacity(0.9),
                Colors.blue,
              ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
              borderRadius:
                  const BorderRadius.vertical(bottom: Radius.circular(36))),
        ),
        title: SizedBox(
          width: double.infinity,
          height: 40,
          child: TextField(
            style: const TextStyle(color: Colors.white),
            cursorColor: Colors.white,
            onSubmitted: (v) {
              const CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
              );
              update(searchText: searchController.text);
              setState(() {});
              searchController.clear();
            },
            controller: searchController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.cyanAccent.withOpacity(0.4),
              labelText: "Enter region",
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: IconButton(
                icon: const Icon(
                  Icons.search,
                  color: Colors.white,
                ),
                onPressed: () {
                  update(searchText: searchController.text);
                  searchController.clear();
                },
              ),
              focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.vertical(bottom: Radius.circular(36),top: Radius.circular(36)),
                  borderSide: BorderSide(color: Colors.white)),
              enabledBorder: const OutlineInputBorder(
                borderRadius: BorderRadius.vertical(bottom: Radius.circular(20),top: Radius.circular(5)),
                borderSide: BorderSide(color: Colors.white),
              ),
            ),
          ),
        ),
      ),
      body: isLoading
          ? SafeArea(
              child: Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.height,
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    Colors.lightBlueAccent,
                    Colors.lightBlueAccent,
                    Colors.blueAccent.withOpacity(0.9),
                    Colors.blueAccent,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            )
          : isError
              ? SafeArea(
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.lightBlueAccent,
                            Colors.blueAccent.withOpacity(0.9),
                            Colors.blueAccent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: const Center(
                      child: Text("Error occurred"),
                    ),
                  ),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    child: Container(
                      width: double.infinity,
                      height: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                            colors: [
                              Colors.lightBlueAccent,
                              Colors.white.withOpacity(0.2),
                              Colors.lightBlueAccent.withOpacity(0.1),
                              Colors.white.withOpacity(0.2),
                              // Colors.blueAccent
                            ],
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "${currentWeather.name}  ",
                                    style: const TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.w500),
                                  ),
                                  const Icon(
                                    Icons.location_on,
                                    color: Colors.white,
                                  )
                                ],
                              ),
                              Container(
                                width: 225,
                                margin: const EdgeInsets.only(top: 10),
                                decoration: BoxDecoration(
                                    color: Colors.white.withAlpha(80),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Expanded(
                                          flex: 7,
                                          child: Image.network(
                                            "http://openweathermap.org/img/wn/${currentWeather.weatherItem[0].icon}@2x.png",
                                            scale: 0.5,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                        Container(
                                          width: 1,
                                          height: 100,
                                          margin:
                                              const EdgeInsets.only(right: 10),
                                          decoration: BoxDecoration(
                                              color: Colors.white,
                                              borderRadius:
                                                  BorderRadius.circular(100)),
                                        ),
                                        Expanded(
                                          flex: 6,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    ((currentWeather
                                                                .mainItem.temp -
                                                            271)
                                                        .floor()
                                                        .toString()),
                                                    style: const TextStyle(
                                                        fontSize: 36,
                                                        color: Colors.white),
                                                  ),
                                                  const Text(
                                                    "°C",
                                                    style: TextStyle(
                                                        fontSize: 16,
                                                        color: Colors.white),
                                                  )
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 20,
                                              ),
                                              GradientText(
                                                (DateFormat.Hm().format(DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            currentWeather.dt *
                                                                1000)))
                                                    .toString(),
                                                colors: const [
                                                  Colors.black,
                                                  Colors.blue,
                                                  Colors.black,
                                                ],
                                                gradientDirection:
                                                    GradientDirection.rtl,
                                                style: const TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 18),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                    Text(
                                      currentWeather.weatherItem[0].main,
                                      style: const TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.w500),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          SizedBox(
                            height: 100,
                            child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: List.generate(
                                  oneCallData.hourlyItem.length,
                                  (index) => Container(
                                    width: 60,
                                    height: 100,
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2, vertical: 3),
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    decoration: BoxDecoration(
                                      color: Colors.white.withOpacity(0.6),
                                      borderRadius: BorderRadius.vertical(top: Radius.circular(8),bottom: Radius.circular(50)),
                                    ),
                                    child: Column(
                                      // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GradientText(
                                          DateFormat.Hm().format(
                                            DateTime.fromMillisecondsSinceEpoch(
                                                oneCallData
                                                        .hourlyItem[index].dt *
                                                    1000),
                                          ),
                                          colors: [
                                            Colors.blue,
                                            Colors.black.withOpacity(0.6),
                                            Colors.blue,
                                          ],
                                        ),
                                        Image.network(
                                            "http://openweathermap.org/img/wn/${oneCallData.hourlyItem[index].weather[0].icon}@2x.png"),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            GradientText(
                                              "${((oneCallData.hourlyItem[index].temp.toInt()))}°C",
                                              colors: [
                                                Colors.blue,
                                                Colors.black.withOpacity(0.6),
                                                Colors.blue
                                              ],
                                              style: const TextStyle(
                                                fontSize: 16,
                                              ),
                                            ),
                                            const Text(
                                              "",
                                              style: TextStyle(
                                                  fontSize: 16,
                                                  color: Colors.white),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                )),
                          ),
                          Container(
                            margin: const EdgeInsets.all(10),
                            width: double.infinity,
                            height: 289,
                            decoration: BoxDecoration(
                                color: Colors.white.withAlpha(90),
                                borderRadius: BorderRadius.circular(10)),
                            child: ListView.builder(
                                physics: const BouncingScrollPhysics(),
                                itemCount: oneCallData.dailyItem.length,
                                itemBuilder: (ctx, index) {
                                  return Container(
                                      height: 50,
                                      margin: const EdgeInsets.all(2),
                                      decoration: const BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.white38))),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(DateFormat.EEEE().format(
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            oneCallData
                                                                    .dailyItem[
                                                                        index]
                                                                    .dt *
                                                                1000))),
                                                Text(DateFormat.MMMd().format(
                                                    DateTime
                                                        .fromMillisecondsSinceEpoch(
                                                            oneCallData
                                                                    .dailyItem[
                                                                        index]
                                                                    .dt *
                                                                1000))),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                3,
                                            child: Image.network(
                                                "http://openweathermap.org/img/wn/${oneCallData.dailyItem[index].weather[0].icon}@2x.png"),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
                                                5,
                                            child: Row(
                                              children: [
                                                Text(oneCallData
                                                    .dailyItem[index].temp.max
                                                    .floor()
                                                    .toString()),
                                                Text(
                                                  "/${oneCallData.dailyItem[index].temp.min.floor()}°C",
                                                  style: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.5)),
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ));
                                }),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
    );
  }
}
