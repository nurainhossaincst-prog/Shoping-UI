
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'categorydetails.dart';

class Home extends StatefulWidget {
const Home({super.key});

@override
State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
final TextEditingController searchController =
TextEditingController();

int selectedIndex = 0;
int selectedindexcatagory = -1;
String searchText = '';

final Color primaryColor = const Color(0xFF00897B);
final Color backgroundColor = const Color(0xFFF5F7FA);

final List<Map<String, dynamic>> category = [
{
'name': 'Apple',
'image': 'imag/svg/apple-svgrepo-com.svg',
'description':
'Apple is a fresh and nutritious fruit rich in fiber, vitamins, and antioxidants.'
    ' It has a sweet and slightly sour taste and is perfect for healthy snacks, fruit salads, and juices.',
},
{
'name': 'Avocado',
'image': 'imag/svg/avocado-svgrepo-com.svg',
'description':
'Avocado is a nutritious fruit rich in healthy fats, fiber, vitamins, and minerals. It has a creamy texture and mild flavor. Avocado is perfect for salads, smoothies, sandwiches, and healthy meals.',
},
{
'name': 'Beaker',
'image': 'imag/svg/beaker-svgrepo-com.svg',
'description':
'Discover science materials, experiments and learning resources.',
},
{
'name': 'Beer',
'image': 'imag/svg/beer-part2-svgrepo-com.svg',
'description':
'Beer is an alcoholic beverage typically made from water, malted grains, hops, and yeast. It comes in different varieties with unique flavors, aromas, and colors.',
},
{
'name': 'Beer',
'image': 'imag/svg/beer-svgrepo-com.svg',
'description':
'Beer is an alcoholic beverage typically made from water, malted grains, hops, and yeast. It comes in different varieties with unique flavors, aromas, and colors.',
},
{
'name': 'Cherry',
'image': 'imag/svg/cherry-svgrepo-com.svg',
'description':
'Cherry is a small, juicy fruit with a sweet or slightly sour taste. It contains vitamins, antioxidants, and fiber. Cherries are perfect for fruit salads, desserts, juices, and healthy snacks.',
},
  {
    'name': 'Coffee',
    'image': 'imag/svg/coffee-svgrepo-com.svg',
    'description':
    'Coffee is a popular beverage made from roasted coffee beans. It has a rich aroma and a distinctive flavor. Coffee contains caffeine, which can help increase alertness, and can be enjoyed hot or cold.',
  },
  {
    'name': 'Fish',
    'image': 'imag/svg/fish-svgrepo-com.svg',
    'description':
    'Fish is a nutritious food rich in high-quality protein, omega-3 fatty acids, vitamins, and minerals. It supports a balanced diet and can be prepared in many ways, including grilling, baking, steaming, and frying.',
  },
  {
    'name': 'Grape',
    'image': 'imag/svg/grape.svg',
    'description':
    'Grapes are small, juicy fruits that grow in clusters. They come in green, red, and purple varieties and are rich in vitamins, antioxidants, and natural sugars. Grapes are perfect for healthy snacks, fruit salads, juices, and desserts.',
  },
  {
    'name': 'Peach',
    'image': 'imag/svg/peach-svgrepo-com.svg',
    'description':
    'Peach is a juicy fruit with soft, fuzzy skin and a sweet, refreshing taste. It contains vitamins, fiber, and antioxidants. Peaches are perfect for fresh snacks, fruit salads, smoothies, juices, and desserts.',
  },
  {
    'name': 'Pineapple',
    'image': 'imag/svg/pineapple-svgrepo-com.svg',
    'description':
    'Pineapple is a tropical fruit with a sweet and tangy taste. It is rich in vitamin C, fiber, and antioxidants. Pineapple is perfect for fresh snacks, fruit salads, smoothies, juices, and desserts.',
  },
  {
    'name': 'Soda',
    'image': 'imag/svg/soda-water-svgrepo-com.svg',
    'description':
    'Soda is a refreshing carbonated beverage available in a variety of flavors. It contains fizzy bubbles and can be enjoyed chilled. Some sodas contain added sugar, while others are available in sugar-free varieties.',
  },
  {
    'name': 'Beaker',
    'image': 'imag/svg/beaker-svgrepo-com.svg',
    'description':
    'Discover science materials, experiments and learning resources.',
  },
];

@override
void dispose() {
searchController.dispose();
super.dispose();
}

@override
Widget build(BuildContext context) {
final filteredCategory = category.where((item) {
return item['name']
    .toString()
    .toLowerCase()
    .contains(searchText.toLowerCase());
}).toList();

return Scaffold(
backgroundColor: backgroundColor,
appBar: AppBar(
backgroundColor: primaryColor,
foregroundColor: Colors.white,
centerTitle: true,
title: const Text(
'Shopping',
style: TextStyle(
fontWeight: FontWeight.bold,
),
),
),

drawer: Drawer(
backgroundColor: Colors.white,
child: Column(
children: [
DrawerHeader(
decoration: BoxDecoration(
color: primaryColor,
),
child: const Center(
child: Text(
'Shopping Menu',
style: TextStyle(
fontSize: 24,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),
),
),
const ListTile(
leading: Icon(Icons.home_outlined),
title: Text('Home'),
),
const ListTile(
leading: Icon(Icons.category_outlined),
title: Text('Categories'),
),
const ListTile(
leading: Icon(Icons.favorite_outline),
title: Text('Favorites'),
),
const ListTile(
leading: Icon(Icons.person_outline),
title: Text('Profile'),
),
],
),
),

body: IndexedStack(
index: selectedIndex,
children: [
// HOME PAGE
Column(
children: [
Padding(
padding: const EdgeInsets.all(16),
child: TextField(
controller: searchController,
onChanged: (value) {
setState(() {
searchText = value;
});
},
decoration: InputDecoration(
hintText: 'Search category...',
prefixIcon: Icon(
Icons.search,
color: primaryColor,
),
suffixIcon: IconButton(
icon: const Icon(Icons.clear),
onPressed: () {
searchController.clear();
setState(() {
searchText = '';
});
},
),
filled: true,
fillColor: Colors.white,
border: OutlineInputBorder(
borderRadius: BorderRadius.circular(16),
borderSide: BorderSide.none,
),
enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(16),
borderSide: BorderSide(
color: Colors.grey.shade200,
),
),
focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(16),
borderSide: BorderSide(
color: primaryColor,
width: 1.5,
),
),
),
),
),

Expanded(
child: filteredCategory.isEmpty
? const Center(
child: Text('No category found!'),
)
    : GridView.builder(
padding: const EdgeInsets.fromLTRB(
12, 0, 12, 16,
),
gridDelegate:
const SliverGridDelegateWithFixedCrossAxisCount(
crossAxisCount: 2,
crossAxisSpacing: 12,
mainAxisSpacing: 12,
childAspectRatio: 0.90,
),
itemCount: filteredCategory.length,
itemBuilder: (context, index) {
final item = filteredCategory[index];
final originalIndex =
category.indexOf(item);

final selected =
selectedindexcatagory ==
originalIndex;

return Card(
color: selected
? const Color(0xFFE0F2F1)
    : Colors.white,
elevation: selected ? 5 : 2,
shape: RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(18),
side: BorderSide(
color: selected
? primaryColor
    : Colors.grey.shade200,
width: selected ? 2 : 1,
),
),
clipBehavior: Clip.antiAlias,
child: InkWell(
borderRadius:
BorderRadius.circular(18),

// CARD CLICK -> DETAILS PAGE
onTap: () {
setState(() {
selectedindexcatagory =
originalIndex;
});

Navigator.push(
context,
MaterialPageRoute(
builder: (context) =>
CategoryDetails(
name: item['name'],
image: item['image'],
description:
item['description'],
primaryColor: primaryColor,
),
),
);
},

child: Padding(
padding:
const EdgeInsets.all(14),
child: Column(
mainAxisAlignment:
MainAxisAlignment.center,
children: [
Expanded(
child: SvgPicture.asset(
item['image'],
fit: BoxFit.contain,
placeholderBuilder:
(context) => Icon(
Icons.category,
size: 65,
color: primaryColor,
),
),
),
const SizedBox(height: 12),
Text(
item['name'],
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 17,
fontWeight:
FontWeight.bold,
color: selected
? primaryColor
    : const Color(
0xFF263238,
),
),
),
const SizedBox(height: 5),
Text(
'View details',
style: TextStyle(
fontSize: 12,
color: primaryColor,
),
),
],
),
),
),
);
},
),
),
],
),

// CATEGORY TAB
const Center(
child: Text(
'Category Page',
style: TextStyle(fontSize: 24),
),
),

// FAVORITE TAB
const Center(
child: Text(
'Favorite Page',
style: TextStyle(fontSize: 24),
),
),

// PROFILE TAB
const Center(
child: Text(
'Profile Page',
style: TextStyle(fontSize: 24),
),
),
],
),

bottomNavigationBar: NavigationBar(
backgroundColor: Colors.white,
indicatorColor: const Color(0xFFB2DFDB),
selectedIndex: selectedIndex,
onDestinationSelected: (index) {
setState(() {
selectedIndex = index;
});
},
destinations: const [
NavigationDestination(
icon: Icon(Icons.home_outlined),
selectedIcon: Icon(Icons.home),
label: 'Home',
),
NavigationDestination(
icon: Icon(Icons.category_outlined),
selectedIcon: Icon(Icons.category),
label: 'Category',
),
NavigationDestination(
icon: Icon(Icons.favorite_outline),
selectedIcon: Icon(Icons.favorite),
label: 'Favorite',
),
NavigationDestination(
icon: Icon(Icons.person_outline),
selectedIcon: Icon(Icons.person),
label: 'Profile',
),
],
),
);
}
}

// ========================================
// CATEGORY DETAILS PAGE
// ========================================



