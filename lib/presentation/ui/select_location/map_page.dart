// import 'package:Itine/screens/home/home_screen.dart';
// import 'package:Itine/screens/sign_in/sign_in_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:itine/core/constants/app_colors.dart';
import 'package:itine/core/services/sesion_storage_service.dart';
import 'package:itine/presentation/controllers/request/request_controller.dart';
import 'package:itine/presentation/routes/app_routes.dart';
import 'package:latlong2/latlong.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../controllers/auth/session_controller.dart';
// import 'package:provider/provider.dart';
// import '../../../UseridProvider.dart';

class MapPage extends StatelessWidget {
  final String selectedLocation; // Lieu sélectionné depuis la recherche
  final SessionController _sessionController = Get.put(SessionController());
  final RequestController _requestController = Get.put(RequestController());
  final SessionStorageService storageService = SessionStorageService();

  final double latitude; // Latitude du lieu sélectionné
  final double longitude; // Longitude du lieu sélectionné
  final List<double>? boundingBox;
  final TextEditingController _addressController = TextEditingController();

  MapPage(
      {required this.selectedLocation,
      required this.latitude,
      required this.longitude,
      this.boundingBox // Rendre boundingBox nullable
      });

  Future<void> saveAddressToSharedPreferences() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('confirmed_address', selectedLocation);
    // Vous pouvez également ajouter d'autres données dans SharedPreferences si nécessaire
  }

  Future<void> saveEmailToSharedPreferences(String email) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('user_email', email);
  }

  bool _isEligibleAddress() {
    // Vérifier si l'adresse est éligible en utilisant Nominatim API ou autre méthode
    // Exemple de vérification basée sur le texte de l'adresse sélectionnée
    List<String> eligibleCities = [
      'Paris',
      'Marseille',
      'Bordeaux',
      'Lille',
      'Lyon'
    ];
    String address = selectedLocation.toLowerCase();
    for (var city in eligibleCities) {
      if (address.contains(city.toLowerCase())) {
        return true;
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(selectedLocation),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios), // Icône arrow_back_ios
          onPressed: () {
            Navigator.of(context).pop(); // Fonction pour revenir en arrière
          },
        ),
        titleSpacing: -10,
      ),
      body: Stack(
        children: [
          /*Padding(
            padding: EdgeInsets.all(16.0),
            child: TextFormField(
              readOnly: true,
              initialValue: selectedLocation, // Lieu sélectionné en lecture seule
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Lieu choisi',
              ),
            ),
          ),*/

          FlutterMap(
            options: MapOptions(
              initialCenter: LatLng(latitude, longitude),
              initialZoom: 18,
            ),
            children: [
              TileLayer(
                urlTemplate: 'https://tile.openstreetmap.org/{z}/{x}/{y}.png',
                userAgentPackageName: 'com.example.app',
              ),
              if (boundingBox != null &&
                  boundingBox!.length ==
                      4) // Vérifier si boundingBox n'est pas null
                PolygonLayer(
                  polygons: [
                    Polygon(
                      points: [
                        LatLng(boundingBox![0],
                            boundingBox![2]), // Coin supérieur gauche
                        LatLng(boundingBox![0],
                            boundingBox![3]), // Coin supérieur droit
                        LatLng(boundingBox![1],
                            boundingBox![3]), // Coin inférieur droit
                        LatLng(boundingBox![1],
                            boundingBox![2]), // Coin inférieur gauche
                      ],
                      color: Colors.blue, // Épaisseur de la bordure
                      isFilled: true,
                    ),
                  ],
                ),
              MarkerLayer(
                markers: [
                  Marker(
                    point: LatLng(latitude, longitude),
                    width: 80,
                    height: 80,
                    child: Container(
                      child: Icon(
                        Icons.location_on,
                        color: Colors.red,
                        size: 40.0,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          /*DraggableScrollableSheet(
             // ...
             builder: (BuildContext context, ScrollController scrollController) {
               return Container(
                 decoration: BoxDecoration(
                   color: Colors.white,
                   borderRadius: BorderRadius.only(
                     topLeft: Radius.circular(8.0),
                     topRight: Radius.circular(8.0),
                   ),
                   boxShadow: [
                     BoxShadow(
                       color: Colors.grey.withOpacity(0.5),
                       spreadRadius: 2,
                       blurRadius: 5,
                       offset: Offset(0, 2), // Changement de l'ombre vers le bas
                     ),
                   ],
                 ),
                 child: Column(
                   children: [
                     Container(
                       height: 4.0, // Hauteur de la poignée de glissement
                       width: 40.0, // Largeur de la poignée de glissement
                       margin: EdgeInsets.symmetric(vertical: 8.0), // Marge autour de la poignée
                       decoration: BoxDecoration(
                         color: Colors.grey[400],
                         borderRadius: BorderRadius.circular(2.0),
                       ),
                     ),
                     // Le reste de votre formulaire ici
                     // ...
                   ],
                 ),
               );
             },
           ),*/
          DraggableScrollableSheet(
            initialChildSize:
                0.45, // Taille initiale du DraggableScrollableSheet (50% de la hauteur de l'écran)
            minChildSize:
                0.20, // Taille minimale du DraggableScrollableSheet (10% de la hauteur de l'écran)
            maxChildSize:
                0.5, // Taille maximale du DraggableScrollableSheet (100% de la hauteur de l'écran)
            builder: (BuildContext context, ScrollController scrollController) {
              return _isEligibleAddress()
                  ? Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(160.0),
                                  height:
                                      4.0, // Hauteur de la poignée de glissement
                                  width:
                                      40.0, // Largeur de la poignée de glissement
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          8.0), // Marge autour de la poignée
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                                top: 10.0, bottom: 16, left: 16, right: 16),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Votre adresse est éligible.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                SizedBox(height: 8.0),
                                TextFormField(
                                  readOnly: true,
                                  initialValue: selectedLocation,
                                  decoration: InputDecoration(
                                    contentPadding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    prefixIcon:
                                        Icon(Icons.location_on, size: 20.0),
                                    suffixIcon: Icon(
                                      Icons.check_circle,
                                      size: 20.0,
                                      color: Colors.greenAccent,
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  decoration: InputDecoration(
                                    labelText: 'Note additionnelle',
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  maxLines: 3,
                                ),
                                SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    /*var userProvider = Provider.of<UserProvider>(context, listen: false);
                                var user_id = userProvider.user_id;
                                print(userProvider);
                                print(user_id);
                                var isAuth = false;
                                if(user_id != null && user_id != 0){
                                    isAuth = true;
                                    Navigator.pushNamed(context, HomeScreen.routeName);
                                }
                                else{*/
                                    await storageService.save(
                                        Keys.firstTime, 'true');
                                    Get.toNamed(AppRoutes.main);
                                    /*}*/
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: const Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      'Confirmez votre adresse',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    )
                  : Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.0),
                          topRight: Radius.circular(8.0),
                        ),
                      ),
                      child: ListView(
                        controller: scrollController,
                        children: [
                          Padding(
                            padding: EdgeInsets.all(6.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding: EdgeInsets.all(160.0),
                                  height:
                                      4.0, // Hauteur de la poignée de glissement
                                  width:
                                      40.0, // Largeur de la poignée de glissement
                                  margin: EdgeInsets.symmetric(
                                      vertical:
                                          8.0), // Marge autour de la poignée
                                  decoration: BoxDecoration(
                                    color: Colors.grey[400],
                                    borderRadius: BorderRadius.circular(2.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(16.0),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(8.0),
                                topRight: Radius.circular(8.0),
                              ),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Text(
                                  'Votre adresse n\'est pas éligible.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  'Veuillez entrez votre adresse email pour entrer dans la file d\'attente.',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.normal,
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                TextFormField(
                                  controller: _addressController,
                                  decoration: InputDecoration(
                                    labelText: 'Adresse email',
                                    prefixIcon:
                                        Icon(Icons.email_outlined, size: 20.0),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                SizedBox(height: 16.0),
                                ElevatedButton(
                                  onPressed: () async {
                                    // Logique pour sauvegarder l'adresse e-mail
                                    // Exemple d'appel à une fonction pour sauvegarder dans SharedPreferences
                                    //saveEmailToSharedPreferences(email);
                                    String email = _addressController
                                        .text; // Récupérer l'email saisi dans le TextFormField
                                    await saveEmailToSharedPreferences(email);
                                    // Affichage d'un snackbar pour indiquer que l'email a été enregistré
                                    final snackBar = SnackBar(
                                        content: Text(
                                            'Adresse email enregistrée avec succès !'));
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(snackBar);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    primary: AppColors.primary,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 10.0),
                                    child: Text(
                                      'Confirmer',
                                      style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    );
            },
          ),
        ],
      ),
    );
  }
}
