import 'dart:convert';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/presentation/ui/select_location/map_page.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:geolocator/geolocator.dart';

class AddressSearchPage extends StatefulWidget {
  static String routeName = "/select_location";

  const AddressSearchPage({super.key});
  @override
  _AddressSearchPageState createState() => _AddressSearchPageState();
}

class _AddressSearchPageState extends State<AddressSearchPage> {
  List<dynamic> searchResults = [];
  final TextEditingController _textController = TextEditingController();
  bool valid_address_found = true;

  Future<void> searchAddress(String query) async {
    if (query != '') {
      String baseUrl = 'https://nominatim.openstreetmap.org/search';
      //String countryCodes = 'FR,DE,ES';
      //String params = '?format=json&q=$query&countrycodes=$countryCodes'; // Ajoutez les codes de pays séparés par des virgules
      String params =
          '?format=json&q=$query'; // Ajoutez les codes de pays séparés par des virgules
      String url = '$baseUrl$params';

      try {
        var response = await http.get(Uri.parse(url));
        if (response.statusCode == 200) {
          List<dynamic> jsonResponse = json.decode(response.body);
          // Filtrer les résultats pour obtenir des adresses précises (contenant un numéro de rue)
          List<dynamic> filteredResults = jsonResponse.where((result) {
            // Insérez votre logique de filtrage ici
            // Par exemple, vous pouvez vérifier si 'address' contient un numéro de rue
            return result['osm_type'] == 'node' || result['osm_type'] == 'way';
          }).toList();

          setState(() {
            searchResults = jsonResponse;
            if (filteredResults.length == 0) {
              valid_address_found = false;
            } else {
              valid_address_found = true;
            }
            print(searchResults);
          });

          /*setState(() {
            searchResults = json.decode(response.body);
            print(searchResults);
          });*/
        } else {
          print('Erreur de recherche : ${response.statusCode}');
        }
      } catch (e) {
        print('Erreur de connexion : $e');
      }
    } else {
      setState(() {
        valid_address_found = true;
        searchResults = [];
      });
    }
  }

  void navigateToMapPage(BuildContext context, String selectedLocation,
      double latitude, double longitude, List<double>? boundingBox) {
    print(longitude);
    print(latitude);
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => MapPage(
          selectedLocation: selectedLocation,
          latitude: latitude,
          longitude: longitude,
        ),
      ),
    );
  }

  Future<void> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Les services de localisation sont désactivés');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('L\'accès à la localisation est refusé');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'L\'accès à la localisation est refusé de manière permanente');
    }

    Position position = await Geolocator.getCurrentPosition();
    print('Latitude: ${position.latitude}, Longitude: ${position.longitude}');
    searchAddress(
        'latitude=${position.latitude}&longitude=${position.longitude}');

    var latitude = position.latitude;
    var longitude = position.longitude;

    if (latitude <= -90) {
      latitude = -90;
    }
    if (latitude <= -180) {
      latitude = -180;
    }

    if (latitude != null && longitude != null) {
      navigateToMapPage(
          context, "Position actuelle", latitude, longitude, null);
    } else {
      // Gérer le cas où la conversion échoue
      print('Les coordonnées de latitude ou longitude sont invalides.');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Sélectionnez votre addresse'),
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios), // Icône arrow_back_ios
            onPressed: () {
              Navigator.of(context).pop(); // Fonction pour revenir en arrière
            },
          ),
          titleSpacing: -10,
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Row(
                  children: [
                    /*IconButton(
                    icon: Icon(Icons.arrow_back_ios),
                    onPressed: () {
                      Navigator.of(context).pop(); // Retourne en arrière
                    },
                  ),*/
                    Expanded(
                      child: TextFormField(
                        controller: _textController,
                        decoration: InputDecoration(
                          hintText: 'Rechercher une adresse',
                          contentPadding: EdgeInsets.symmetric(vertical: 10.0),
                          prefixIcon: Icon(Icons.location_on, size: 20.0),
                          suffixIcon: IconButton(
                            icon: Icon(Icons.clear, size: 20.0),
                            onPressed: () {
                              _textController.clear();
                              setState(() {
                                searchResults =
                                    []; // Effacer les résultats de recherche
                              });
                            },
                          ),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                          ),
                        ),
                        onChanged: (value) {
                          if (value.isNotEmpty) {
                            searchAddress(value);
                          } else {
                            setState(() {
                              searchResults = [];
                              valid_address_found = false;
                            });
                          }
                        },
                      ),
                    ),
                  ],
                ),
                SizedBox(
                    height:
                        10.0), // Espace vertical entre le champ de recherche et l'option "Utiliser l'emplacement actuel"
                GestureDetector(
                  onTap: () {
                    getCurrentLocation().catchError((error) {
                      print(
                          'Erreur lors de la récupération de la localisation : $error');
                    });
                  },
                  child: Padding(
                    padding: EdgeInsets.only(
                        top: 8.0, bottom: 8.0), // Marges supplémentaires
                    child: Row(
                      children: [
                        Icon(Icons.my_location,
                            size: 20.0), // Réduire la taille de l'icône
                        SizedBox(width: 10.0),
                        Text(
                          'Utiliser l\'emplacement actuel',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 10.0),
                if (valid_address_found == false)
                  Padding(
                    padding: EdgeInsets.only(left: 18),
                    child: Text('Entrer un numéro de rue',
                        style:
                            TextStyle(fontSize: 16, color: AppColors.primary)),
                  ),

                SizedBox(height: 10.0),

                Expanded(
                  child: ListView.separated(
                    itemCount: searchResults.length,
                    separatorBuilder: (BuildContext context, int index) {
                      return Divider(); // Ajoute un trait de séparation entre les éléments
                    },
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(searchResults[index]['display_name']),
                        onTap: () {
                          if (searchResults[index]['osm_type'] == 'node' ||
                              searchResults[index]['osm_type'] == 'way') {
                            setState(() {
                              valid_address_found = true;
                            });
                            var latitudeString = searchResults[index]['lat'];
                            var longitudeString = searchResults[index]['lon'];

                            double? latitude =
                                double.tryParse(latitudeString) ?? 0;
                            double? longitude =
                                double.tryParse(longitudeString) ?? 0;

                            if (latitude <= -90) {
                              latitude = -90;
                            }
                            if (latitude <= -180) {
                              latitude = -180;
                            }

                            // Suppose boundingBox est de type List<dynamic> dans AddressSearchPage

                            // Avant la navigation vers MapPage, assurez-vous de convertir boundingBox en List<double>?
                            var boundingBox =
                                searchResults[index]['boundingbox'];
                            List<double>? boundingBoxConverted;

                            if (boundingBox != null &&
                                boundingBox.length == 4) {
                              try {
                                boundingBoxConverted =
                                    boundingBox.map<double>((dynamic value) {
                                  if (value is String) {
                                    return double.parse(value);
                                  } else {
                                    throw FormatException(
                                        'Invalid value in boundingBox');
                                  }
                                }).toList();
                              } catch (e) {
                                print('Error parsing boundingBox: $e');
                                boundingBoxConverted = null;
                              }
                            }
                            print('Bounding Box');
                            print(boundingBoxConverted);
                            print(boundingBoxConverted!.length);
                            print(boundingBoxConverted![0]);
                            print(boundingBoxConverted![1]);
                            print(boundingBoxConverted![2]);
                            print(boundingBoxConverted![3]);

                            if (latitude != null && longitude != null) {
                              navigateToMapPage(
                                  context,
                                  searchResults[index]['display_name'],
                                  latitude,
                                  longitude,
                                  boundingBoxConverted);
                            } else {
                              // Gérer le cas où la conversion échoue
                              print(
                                  'Les coordonnées de latitude ou longitude sont invalides.');
                            }
                          } else {
                            setState(() {
                              valid_address_found = false;
                            });
                          }
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
