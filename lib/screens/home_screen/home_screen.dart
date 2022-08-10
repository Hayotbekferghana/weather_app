import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_weather_app/api/api_provider/api_provider.dart';
import 'package:my_weather_app/api/models/current_weather.dart';

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

  void init() async {
    isLoading = true;
    setState(() {});
    currentWeather = await ApiProvider.getCurrentWeatherByLatLong(lat: widget.lat, long: widget.long);
    isLoading = false;
    setState(() {});
  }

  Future<void> update({required String searchText}) async {
    isLoading = true;
    setState(() {});
    try {
      currentWeather =
          await ApiProvider.getCurrentWeatherByText(searchText: searchText);
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
        appBar: AppBar(
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.lightBlueAccent,
            statusBarBrightness: Brightness.light,
            statusBarIconBrightness: Brightness.light,
          ),
          centerTitle: true,
          backgroundColor: Colors.transparent,
          flexibleSpace: Container(
            decoration:  BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.lightBlueAccent,
                  Colors.lightBlueAccent,
                  Colors.blueAccent.withOpacity(0.9),
                  Colors.blueAccent
                ],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter
              )
            ),
          ),
          elevation: 0.0,
          title: SizedBox(
            width: 200,
            height: 36,
            child: TextField(
              onTap: () async {
                update(searchText: searchController.text);
                setState(() {});
              },
              controller: searchController,
              textInputAction: TextInputAction.search,
              decoration: InputDecoration(
                  labelText: "enter region",
                  labelStyle: const TextStyle(
                    color: Colors.white54
                  ),
                  prefixIcon: const Icon(Icons.search,color: Colors.white54,),
                  focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.white)
                  ),
                  enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(100),
                      borderSide: const BorderSide(color: Colors.white)
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(100),
                    borderSide: const BorderSide(color: Colors.white)
                  )),
            ),
          ),

        ),
        body: isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : isError
                ? const Center(
                    child: Text("Error occurred"),
                  )
                : Column(
                    children: [Text(currentWeather.name)],
                  ));
  }
}
