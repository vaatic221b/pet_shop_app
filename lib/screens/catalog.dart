import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop_app/bottom_bar_utility.dart';
import 'package:pet_shop_app/pet_model.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:pet_shop_app/screens/pet.dart';
import 'package:provider/provider.dart';

class CatalogPage extends StatefulWidget {
  const CatalogPage({super.key});

  @override
  State<CatalogPage> createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {
  CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: BottomNavBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Container(
            width: 400,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                topText(),
                const SizedBox(height: 15),
                searchBar(),
                const SizedBox(height: 5),
                petCatalog(cartProvider)
        
              ],
            ),
          ),
        ),
      ),
    );
  }

Container petCatalog(cartProvider) {
  return Container(
    color: Colors.white,
    height: 600,
    width: 350,
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2, 
        crossAxisSpacing: 30.0,
        mainAxisSpacing: 30.0, 
      ),
      itemCount: PETS.length,
      itemBuilder: (context, index) {
        PetModel pet = PETS[index];
        return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return PetPage(petIndex: index); 
                  },
                ),
              );
            },
          child: petCard(pet, cartProvider));
      },
    ),
  );
}

Widget petCard(pet, cartProvider) {
  bool isInCart = cartProvider.items.contains(pet);
  return Material(
    elevation: 1,
    borderRadius: BorderRadius.circular(20),
    child: Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20)
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 8, 8, 0),
            child: Container(
              height: 105,
              width: 155,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: AssetImage(pet.cardPic), 
                  fit: BoxFit.cover, 
                ),
              ),
            ),
          ),
          const SizedBox(height: 5), 
          Align(
            alignment: Alignment.centerLeft,
            child: Text('  ${pet.breed} ${pet.species}',
              style: GoogleFonts.inter(
                fontWeight: FontWeight.w600,
                fontSize: 14
              ),
            ), 
          ),
          const SizedBox(height: 5),
          Row(
            children: [
              Text(
                '   \$${pet.price.toStringAsFixed(0)}',
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w600,
                  fontSize: 11,
                  color: const Color(0xFFE8BE13),
                ),
              ),
              const Spacer(),
              GestureDetector(
                onLongPress: () {
                  setState(() {
                    if (isInCart) {
                      // If the item is already in the cart, remove it
                      cartProvider.remove(pet);
                    } else {
                      // If the item is not in the cart, add it
                      cartProvider.add(pet);
                    }
                  });
                },
                child: Container(
                  width: 15,
                  height: 15,
                  decoration: BoxDecoration(
                    color: isInCart ? Colors.black : Colors.white,
                    borderRadius: BorderRadius.circular(3)
                  ),
                  child: SvgPicture.asset(
                    'assets/icons/cart.svg',
                    width: 12, 
                    height: 12, 
                  ),
                ),
              ),
              const SizedBox(width: 15)
            ],
          )
        ],
      ),
  
    ),
  );
}

  Text topText() {
    return Text('Store',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                )
              );
  }
  
Widget searchBar() {
  return Container(
    margin: const EdgeInsets.only(left: 30, right: 30),
    child: TextField(
      decoration: InputDecoration(
        filled: true,
        fillColor: const Color(0xFFF2F3F2),
        contentPadding: const EdgeInsets.symmetric(vertical: 10, horizontal: 25),
        hintText: 'Search Product or Brand',
        hintStyle: GoogleFonts.poppins(
          color: const Color(0xFF7C7C7C),
          fontSize: 14,
          fontWeight: FontWeight.w500
        ),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(top: 3, right: 14, left: 14, bottom: 14), 
          child: SvgPicture.asset(
              'assets/icons/search.svg',
            ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: BorderSide.none
        )
      )
    ),
  );
}



}