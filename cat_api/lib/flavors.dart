
import 'package:cat_api/properties.dart';

enum Flavors{
  qa,production
  
}
extension FlavorsExtension on Flavors {

  String get baseUrlApi {
    switch (this) {
      case Flavors.production:
        return "https://api.thecatapi.com/v1/";
      case Flavors.qa:
        return "https://api.thecatapi.com/v1/";
    }
  }
  String get xApiKey{
    switch(this){
      case Flavors.production:
        return xApiKeyProduction;
      case Flavors.qa:
        return xApiKeyQa;
    }
  }
  
}

class Flavor {
  static Flavors? flavor;
}