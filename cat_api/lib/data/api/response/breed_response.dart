import 'dart:convert';

BreedResponse breedResponseFromJson(String str) => BreedResponse.fromJson(json.decode(str));

class BreedResponse {
    BreedResponse({
        required this.weight,
        required this.id,
        required this.name,
        required this.temperament,
        required this.origin,
        required this.description,
        required this.lifeSpan,
        required this.adaptability,
        required this.affectionLevel,
        required this.childFriendly,
        required this.dogFriendly,
        required this.energyLevel,
        required this.grooming,
        required this.healthIssues,
        required this.intelligence,
        required this.sheddingLevel,
        required this.socialNeeds,
        required this.strangerFriendly,
        required this.vocalisation,
        required this.natural,
        required this.rare,
        required this.wikipediaUrl,
        required this.hypoallergenic,
        required this.referenceImageId,
    });

    Weight weight;
    String id;
    String name;
    String temperament;
    String origin;
    String description;
    String lifeSpan;
    int adaptability;
    int affectionLevel;
    int childFriendly;
    int dogFriendly;
    int energyLevel;
    int grooming;
    int healthIssues;
    int intelligence;
    int sheddingLevel;
    int socialNeeds;
    int strangerFriendly;
    int vocalisation;
    int natural;
    int rare;
    String? wikipediaUrl;
    int hypoallergenic;
    String? referenceImageId;

    factory BreedResponse.fromJson(Map<String, dynamic> json) => BreedResponse(
        weight: Weight.fromJson(json["weight"]),
        id: json["id"],
        name: json["name"],
        temperament: json["temperament"],
        origin: json["origin"],
        description: json["description"],
        lifeSpan: json["life_span"],
        adaptability: json["adaptability"],
        affectionLevel: json["affection_level"],
        childFriendly: json["child_friendly"],
        dogFriendly: json["dog_friendly"],
        energyLevel: json["energy_level"],
        grooming: json["grooming"],
        healthIssues: json["health_issues"],
        intelligence: json["intelligence"],
        sheddingLevel: json["shedding_level"],
        socialNeeds: json["social_needs"],
        strangerFriendly: json["stranger_friendly"],
        vocalisation: json["vocalisation"],
        natural: json["natural"],
        rare: json["rare"],
        wikipediaUrl: json["wikipedia_url"],
        hypoallergenic: json["hypoallergenic"],
        referenceImageId: json["reference_image_id"],
    );
}

class Weight {
    Weight({
        required this.imperial,
        required this.metric,
    });

    String imperial;
    String metric;

    factory Weight.fromJson(Map<String, dynamic> json) => Weight(
        imperial: json["imperial"],
        metric: json["metric"],
    );

    Map<String, dynamic> toJson() => {
        "imperial": imperial,
        "metric": metric,
    };
}
