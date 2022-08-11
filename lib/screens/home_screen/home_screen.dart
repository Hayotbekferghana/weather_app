import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_weather_app/api/api_provider/api_provider.dart';
import 'package:my_weather_app/api/models/current/current_weather.dart';
import 'package:my_weather_app/api/models/one_call/one_call_data.dart';

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
          width: 200,
          height: 40,
          child:
          TextField(

            style: const TextStyle(
              color: Colors.white
            ),
            cursorColor: Colors.white,
            onSubmitted: (v) {
              const CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Colors.white),);
              update(searchText: searchController.text);
              setState((){});
              searchController.clear();
            },
            controller: searchController,
            textInputAction: TextInputAction.search,
            decoration: InputDecoration(
              filled: true,
              fillColor: Colors.cyanAccent.withOpacity(0.4),
              labelText: "Enter region",
              labelStyle: const TextStyle(color: Colors.white),
              prefixIcon: const Icon(
                Icons.search,
                color: Colors.white,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(100),
                  borderSide: const BorderSide(color: Colors.white)),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(100),
                borderSide: const BorderSide(color: Colors.white),
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
                    Colors.blueAccent
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
                  child: Container(
                    width: double.infinity,
                    height: MediaQuery.of(context).size.height,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                          colors: [
                            Colors.lightBlueAccent,
                            Colors.blueAccent.withOpacity(0.5),
                            Colors.lightBlueAccent,
                            Colors.lightBlueAccent,
                            Colors.blueAccent.withOpacity(0.9),
                            // Colors.blueAccent
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              (currentWeather.mainItem.temp -
                                                      270)
                                                  .floor()
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 36,
                                                color: Colors.white
                                              ),
                                            ),
                                            Text(
                                              (DateFormat.Hm().format(DateTime
                                                      .fromMillisecondsSinceEpoch(
                                                          currentWeather.dt *
                                                              1000)))
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                  Text(
                                    currentWeather.weatherItem[0].main,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
    );
  }
}
