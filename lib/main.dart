import 'package:flutter/material.dart';

void main() {
  runApp(RGTravelApp());
}

class RGTravelApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RG Travel Assistant',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.dark,
        primaryColor: Color(0xFF3A3F55),
        scaffoldBackgroundColor: Color(0xFF121212),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFF1F1F1F),
          foregroundColor: Colors.white,
          elevation: 2,
          titleTextStyle: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          iconTheme: IconThemeData(color: Colors.white70),
        ),
        cardColor: Color(0xFF1E1E2C),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Color(0xFF4E5D78),
            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 14),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 5,
          ),
        ),
        textTheme: TextTheme(
          headline6: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white70, fontSize: 16),
          subtitle1: TextStyle(color: Colors.white60, fontSize: 14),
        ),
        iconTheme: IconThemeData(color: Color(0xFF82AAFF)),
        dropdownMenuTheme: DropdownMenuThemeData(
          inputDecorationTheme: InputDecorationTheme(
            filled: true,
            fillColor: Color(0xFF2C2F48),
            contentPadding: EdgeInsets.symmetric(horizontal: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide.none,
            ),
          ),
          textStyle: TextStyle(color: Colors.white),
        ),
      ),
      home: CitySelectionScreen(),
    );
  }
}

class CitySelectionScreen extends StatefulWidget {
  @override
  _CitySelectionScreenState createState() => _CitySelectionScreenState();
}

class _CitySelectionScreenState extends State<CitySelectionScreen> {
  final List<String> cities = ['Delhi', 'Mumbai', 'Jaipur', 'Goa', 'Kolkata'];
  String selectedCity = 'Delhi';

  // Category -> List of places with name, description, image
  final Map<String, List<Place>> categoryPlaces = {
    'Mountains': [
      Place(
        name: 'Manali',
        description: 'A beautiful hill station in Himachal Pradesh with snowy peaks.',
        image: 'assets/images/manali.jfif',
      ),
      Place(
        name: 'Shimla',
        description: 'Famous summer capital with colonial architecture and cool weather.',
        image: 'assets/images/shimla.jfif',
      ),
      Place(
        name: 'Darjeeling',
        description: 'Known for its tea gardens and stunning views of the Himalayas.',
        image: 'assets/images/darjeeling.jfif',
      ),
      Place(
        name: 'Leh',
        description: 'High altitude desert with monasteries and adventure activities.',
        image: 'assets/images/leh.jfif',
      ),
    ],
    'Beaches': [
      Place(
        name: 'Goa Beach',
        description: 'Famous beach destination with vibrant nightlife and water sports.',
        image: 'assets/images/goa_beach.jfif',
      ),
      Place(
        name: 'Varkala',
        description: 'Cliffside beaches with natural springs and a laid-back vibe.',
        image: 'assets/images/varkala.jpg',
      ),
      Place(
        name: 'Puri',
        description: 'Popular beach in Odisha known for its temples and festivals.',
        image: 'assets/images/puri.jpg',
      ),
      Place(
        name: 'Radhanagar Beach',
        description: 'Beautiful white sand beach on Havelock Island, Andaman.',
        image: 'assets/images/radhanagar.jpg',
      ),
    ],
    'Parks': [
      Place(
        name: 'Lodhi Garden',
        description: 'Historic garden with tombs, lakes, and lush greenery in Delhi.',
        image: 'assets/images/lodhi_garden.jpg',
      ),
      Place(
        name: 'Cubbon Park',
        description: 'Large park with walking paths, trees and colonial buildings in Bangalore.',
        image: 'assets/images/cubbon_park.jpg',
      ),
      Place(
        name: 'Mughal Gardens',
        description: 'Famous gardens inside Rashtrapati Bhavan, New Delhi.',
        image: 'assets/images/mughal_gardens.jpg',
      ),
      Place(
        name: 'Botanical Garden',
        description: 'Diverse collection of plants and flowers in Kolkata.',
        image: 'assets/images/botanical_garden.jfif',
      ),
    ],
    'Temples': [
      Place(
        name: 'Golden Temple',
        description: 'The sacred Sikh shrine located in Amritsar.',
        image: 'assets/images/golden_temple.jpg',
      ),
      Place(
        name: 'Vaishno Devi',
        description: 'Pilgrimage temple dedicated to Goddess Vaishno Devi in Jammu.',
        image: 'assets/images/vaishno_devi.jfif',
      ),
      Place(
        name: 'Meenakshi Temple',
        description: 'Famous temple dedicated to Goddess Meenakshi in Madurai.',
        image: 'assets/images/meenakshi_temple.jfif',
      ),
      Place(
        name: 'Akshardham',
        description: 'Modern Hindu temple complex in Delhi known for architecture.',
        image: 'assets/images/akshardham.jpg',
      ),
    ],
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("RG Travel Assistant"),
      ),
      // Wrap with SingleChildScrollView to prevent overflow, and avoid keyboard issues
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 24),
        child: Column(
          children: [
            // Categories row, use Row with Expanded and no wrapping
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: categoryPlaces.keys.map((category) {
                return Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 6.0),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (_) => CategoryPlacesScreen(
                              category: category,
                              places: categoryPlaces[category]!,
                            ),
                          ),
                        );
                      },
                      child: Container(
                        height: 90,
                        decoration: BoxDecoration(
                          color: Color(0xFF2C2F48),
                          borderRadius: BorderRadius.circular(12),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black54,
                              offset: Offset(0, 2),
                              blurRadius: 4,
                            ),
                          ],
                        ),
                        child: Center(
                          child: Text(
                            category,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),

            SizedBox(height: 40),

            Icon(Icons.flight_takeoff, size: 100, color: Theme.of(context).iconTheme.color),

            SizedBox(height: 24),

            Text(
              "Choose Your City",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600, color: Colors.white70),
            ),

            SizedBox(height: 16),

            DropdownButtonFormField<String>(
              value: selectedCity,
              decoration: InputDecoration(
                labelText: 'Select City',
                labelStyle: TextStyle(color: Colors.white70),
              ),
              dropdownColor: Color(0xFF2C2F48),
              items: cities.map((city) {
                return DropdownMenuItem(
                  value: city,
                  child: Text(city),
                );
              }).toList(),
              onChanged: (val) {
                setState(() {
                  selectedCity = val!;
                });
              },
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),

            SizedBox(height: 36),

            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => CityInfoScreen(city: selectedCity)),
                );
              },
              child: Text("Show Travel Info", style: TextStyle(fontSize: 18)),
            ),

            SizedBox(height: 20), // Added some bottom spacing to avoid overflow
          ],
        ),
      ),
    );
  }
}

class CategoryPlacesScreen extends StatelessWidget {
  final String category;
  final List<Place> places;

  CategoryPlacesScreen({required this.category, required this.places});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(category),
      ),
      body: ListView.separated(
        padding: EdgeInsets.all(16),
        itemCount: places.length,
        separatorBuilder: (_, __) => SizedBox(height: 16),
        itemBuilder: (context, index) {
          final place = places[index];
          return Card(
            color: Color(0xFF1E1E2C),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            elevation: 6,
            child: ListTile(
              contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
              title: Text(
                place.name,
                style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: 18),
              ),
              trailing: Icon(Icons.arrow_forward_ios, color: Color(0xFF82AAFF), size: 18),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => PlaceDetailScreen(place: place),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}

class PlaceDetailScreen extends StatelessWidget {
  final Place place;

  PlaceDetailScreen({required this.place});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(place.name),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              place.image,
              height: 220,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 220,
                  color: Colors.grey[800],
                  child: Center(
                    child: Icon(Icons.broken_image, size: 60, color: Colors.grey[600]),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 24),
          Text(
            place.name,
            style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 16),
          Text(
            place.description,
            style: TextStyle(fontSize: 18, color: Colors.white70),
          ),
        ],
      ),
    );
  }
}

class Place {
  final String name;
  final String description;
  final String image;

  Place({required this.name, required this.description, required this.image});
}

// Existing CityInfoScreen and InfoCard remain unchanged here...

class CityInfoScreen extends StatelessWidget {
  final String city;

  CityInfoScreen({required this.city});

  final Map<String, Map<String, String>> travelInfo = {
    'Delhi': {
      'weather': 'Hot summers, cold winters',
      'attractions': 'Red Fort, India Gate, Qutub Minar',
      'tips': 'Best visited in Oct-Mar. Avoid peak summer.',
      'hotels': 'Taj Palace, The Leela, ITC Maurya',
      'image': 'assets/images/delhi.jpg',
    },
    'Mumbai': {
      'weather': 'Humid and warm year-round',
      'attractions': 'Gateway of India, Marine Drive, Elephanta Caves',
      'tips': 'Carry light clothes. Avoid monsoon.',
      'hotels': 'The Taj Mahal Palace, Trident, The St. Regis',
      'image': 'assets/images/mumbai.jpg',
    },
    'Jaipur': {
      'weather': 'Hot and dry',
      'attractions': 'Hawa Mahal, Amber Fort, City Palace',
      'tips': 'Visit in winter. Great for shopping local crafts.',
      'hotels': 'Rambagh Palace, Jai Mahal, ITC Rajputana',
      'image': 'assets/images/jaipur.jpg',
    },
    'Goa': {
      'weather': 'Tropical, hot summers',
      'attractions': 'Beaches, Churches, Fort Aguada',
      'tips': 'Best time Nov–Feb. Rent a scooter to explore.',
      'hotels': 'Taj Exotica, Park Hyatt, Marriot Goa',
      'image': 'assets/images/goa.jpg',
    },
    'Kolkata': {
      'weather': 'Humid and rainy',
      'attractions': 'Victoria Memorial, Howrah Bridge',
      'tips': 'Durga Puja is a great time to visit.',
      'hotels': 'The Oberoi Grand, ITC Sonar, Taj Bengal',
      'image': 'assets/images/kolkata.jpg',
    },
  };

  void _showPopup(BuildContext context, String title, String content) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: Color(0xFF2C2F48),
        title: Text(title, style: TextStyle(color: Colors.white)),
        content: Text(content, style: TextStyle(color: Colors.white70)),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Close", style: TextStyle(color: Color(0xFF82AAFF))),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final cityData = travelInfo[city]!;

    return Scaffold(
      appBar: AppBar(
        title: Text("Info: $city"),
      ),
      body: ListView(
        padding: EdgeInsets.all(16),
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(16),
            child: Image.asset(
              cityData['image']!,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
            ),
          ),
          SizedBox(height: 24),
          InfoCard(
            icon: Icons.cloud,
            title: 'Weather',
            content: cityData['weather']!,
            onTap: () => _showPopup(context, 'Weather in $city', cityData['weather']!),
          ),
          InfoCard(
            icon: Icons.place,
            title: 'Top Attractions',
            content: cityData['attractions']!,
            onTap: () => _showPopup(context, 'Attractions in $city', cityData['attractions']!),
          ),
          InfoCard(
            icon: Icons.lightbulb,
            title: 'Travel Tip',
            content: cityData['tips']!,
            onTap: () => _showPopup(context, 'Travel Tips for $city', cityData['tips']!),
          ),
          InfoCard(
            icon: Icons.hotel,
            title: 'Popular Hotels',
            content: cityData['hotels']!,
            onTap: () => _showPopup(context, 'Hotels in $city', cityData['hotels']!),
          ),
        ],
      ),
    );
  }
}

class InfoCard extends StatelessWidget {
  final String title;
  final String content;
  final IconData icon;
  final VoidCallback onTap;

  InfoCard({required this.title, required this.content, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Card(
        color: Color(0xFF1E1E2C),
        margin: EdgeInsets.only(bottom: 20),
        elevation: 6,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Icon(icon, size: 28, color: Color(0xFF82AAFF)),
              SizedBox(width: 16),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title, style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
                    SizedBox(height: 6),
                    Text(content, style: TextStyle(fontSize: 16, color: Colors.white70)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
