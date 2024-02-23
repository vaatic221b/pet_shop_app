class PetModel{
  String cardPic;
  String detailPic;
  String breed;
  String species;
  String location;
  String distance;
  String weight;
  String height;
  String color;
  String description;
  double price;

  PetModel({
  required this.cardPic,
  required this.detailPic,
  required this.breed,
  required this.species,
  required this.location,
  required this.distance,
  required this.weight,
  required this.height,
  required this.color,
  required this.description,
  required this.price 

  });

}

// ignore: non_constant_identifier_names
final List<PetModel> PETS = [
  PetModel(
    cardPic: 'assets/images/persian.png',
    detailPic: 'assets/images/persian.png',
    breed: 'Persian', 
    species: 'Cat', 
    location: 'Persia', 
    distance: '10m', 
    weight: '3.6 kg', 
    height: '22 cm', 
    color: 'Beige', 
    description: "The Persian cat, known for its luxurious long fur and distinctive flat face, exudes elegance and grace. With a gentle and calm demeanor, Persians make wonderful companions, often found lounging in regal poses.",
    price: 85
  ),

  PetModel(
    cardPic: 'assets/images/sphinx.png',
    detailPic: 'assets/images/big_sphinx.png',
    breed: 'Sphinx', 
    species: 'Cat', 
    location: 'Egypt', 
    distance: '8m', 
    weight: '3.5 kg', 
    height: '22 cm', 
    color: 'Dark pink', 
    description: "The Sphinx cat, hairless and charming, boasts a velvety skin in various colors and patterns. Playful and affectionate, they capture hearts with their unique appearance and lively personalities.",
    price: 60
  ),

  PetModel(
    cardPic: 'assets/images/bengal.png',
    detailPic: 'assets/images/bengal.png',
    breed: 'Bengal', 
    species: 'Cat', 
    location: 'Bangladesh', 
    distance: '150m', 
    weight: '3.7 kg', 
    height: '22 cm', 
    color: 'Brown', 
    description: "The Bengal cat, with its striking leopard-like spots and sleek coat, embodies the spirit of the wild within a domestic setting. Intelligent and active, Bengals thrive on interaction and play, often engaging in games of chase and exploration. ",
    price: 90
  ),

  PetModel(
    cardPic: 'assets/images/abyssinian.png',
    detailPic: 'assets/images/abyssinian.png',
    breed: 'Abyssinian', 
    species: 'Cat', 
    location: 'Canada', 
    distance: '40m', 
    weight: '3.4 kg', 
    height: '22 cm', 
    color: 'Orange', 
    description: "The Abyssinian cat, with its striking ticked coat and vibrant personality, radiates charm and vitality. Agile and playful, Abyssinians are natural-born athletes, often seen leaping and climbing with grace and agility. ",
    price: 75
  ),

  PetModel(
    cardPic: 'assets/images/burmese.png',
    detailPic: 'assets/images/burmese.png',
    breed: 'Burmese', 
    species: 'Cat', 
    location: 'Burma', 
    distance: '110m', 
    weight: '3.5 kg', 
    height: '22 cm', 
    color: 'White', 
    description: "The Burmese cat, with its sleek and muscular build, emanates warmth and affection. Known for their loving and loyal nature, Burmese cats form strong bonds with their human companions, often seeking out cuddles and companionship.",
    price: 75
  ),

  PetModel(
    cardPic: 'assets/images/russian.png',
    detailPic: 'assets/images/russian.png',
    breed: 'Russian Blue', 
    species: 'Cat', 
    location: 'Russia', 
    distance: '70m', 
    weight: '3.6 kg', 
    height: '22 cm', 
    color: 'Gray', 
    description: "The Russian Blue cat, with its shimmering silver-blue coat and captivating green eyes, exudes an air of elegance and mystery. Reserved yet affectionate, Russian Blues are known for their gentle and loyal nature, forming deep attachments with their chosen human companions.",
    price: 60
  ),
];