
class BreedModel {
    BreedModel({
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

    WeightModel weight;
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
}

class WeightModel {
    WeightModel({
        required this.imperial,
        required this.metric,
    });

    String imperial;
    String metric;
}
