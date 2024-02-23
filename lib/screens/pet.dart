import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop_app/bottom_bar_utility.dart';
import 'package:pet_shop_app/pet_model.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class PetPage extends StatefulWidget {
  final int petIndex;
  const PetPage({super.key, required this.petIndex});

  @override
  State<PetPage> createState() => _PetPageState();
}

class _PetPageState extends State<PetPage> {
  bool isButtonPressed = false;

  @override
  Widget build(BuildContext context) {
    CartProvider cartProvider = Provider.of<CartProvider>(context);
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: BottomNavBar(),
      ),
      body: Stack(
        children: [
          backgroundImage(),
          Container(
            color: Colors.transparent,
            width: 400,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                petPost(cartProvider)
              ],
            ),
          ),
        ],
      ),
    );
  }
  

  Widget backgroundImage() {
    return Container(
      height: 400,
      color: Colors.amber,
      child: Image.asset(
          PETS[widget.petIndex].detailPic,
          fit: BoxFit.fill,
          width: 500,
          height: 500,
        ),
    );
  }
  
  Widget petPost(cartProvider) {
    return Padding(
      padding: const EdgeInsets.only(top: 100),
      child: Column(
        children: [
          headerDetails(cartProvider),
          const SizedBox(height: 15),
            aboutPet(),
            const  SizedBox(height: 15),
              physicalTraits(),
              description(),
        ],
      ),
    );
  }

  Padding description() {
    return Padding(
              padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
              child: Text(
                PETS[widget.petIndex].description,
                style: GoogleFonts.poppins(
                  fontWeight: FontWeight.w400,
                  fontSize: 14.5,
                  color: const Color(0xFFA1A1A1)
                ),
              ),
            );
  }

  Padding physicalTraits() {
    return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                    Container(
                      height: 70,
                      width: 105, 
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5FFF5),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Weight',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: const Color(0xFF5F5F63)
                              ),
                            ),
                            Text(PETS[widget.petIndex].weight,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: const Color(0xFFE8BE13)
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    const Spacer(),
                    Container(
                      height: 70,
                      width: 105, 
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5FFF5),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Height',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: const Color(0xFF5F5F63)
                              ),
                            ),
                            Text(PETS[widget.petIndex].height,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: const Color(0xFFE8BE13)
                              ),
                            ),
                          ],
                        ),
                      ),                        
                    ),   
                    const Spacer(),
                    Container(
                      height: 70,
                      width: 105, 
                      decoration: BoxDecoration(
                        color: const Color(0xFFF5FFF5),
                        borderRadius: BorderRadius.circular(15)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Color',
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w400,
                                fontSize: 15,
                                color: const Color(0xFF5F5F63)
                              ),
                            ),
                            Text(PETS[widget.petIndex].color,
                              style: GoogleFonts.poppins(
                                fontWeight: FontWeight.w600,
                                fontSize: 17,
                                color: const Color(0xFFE8BE13)
                              ),
                            ),
                          ],
                        ),
                      ),                        
                    ),                                                                   
                ],
              )
            );
  }

  Padding aboutPet() {
    return Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                children: [
                  SvgPicture.asset('assets/icons/paw.svg'),
                  Text(' About ${PETS[widget.petIndex].breed}',
                    style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w700,
                      fontSize: 19
                    ),
                  )
                ],
              ),
            );
  }

  Material headerDetails(cartProvider) {
    return Material(
          elevation: 1,
          borderRadius: BorderRadius.circular(35),
          child: Container(
            width: 350,
            height: 105,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(35),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('${PETS[widget.petIndex].breed} ${PETS[widget.petIndex].species}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w700,
                          fontSize: 26
                        ),
                      ),
                      const SizedBox(height: 5),
                      Text('${PETS[widget.petIndex].location} · ${PETS[widget.petIndex].distance}',
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.w400,
                          fontSize: 17,
                          color: const Color(0xFF5F5F63)
                        ),                                         
                      )
                    ],
                  ),
                  const Spacer(),
                  addToCart(cartProvider),
                ],
              ),
            ),

          ),
        );
  }

ElevatedButton addToCart(cartProvider) {
  bool isInCart = cartProvider.items.contains(PETS[widget.petIndex]);

  return ElevatedButton(
    onPressed: () {
      setState(() {
        if (isInCart) {
          // If the item is already in the cart, remove it
          cartProvider.remove(PETS[widget.petIndex]);
        } else {
          // If the item is not in the cart, add it
          cartProvider.add(PETS[widget.petIndex]);
        }
      });
    },
    style: ElevatedButton.styleFrom(
      backgroundColor: isInCart ? const Color(0xFFE8BE13) : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
    ),
    child: Container(
      width: 40,
      height: 60,
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Icon(
        Icons.shopping_cart,
        color: isInCart ? Colors.black : Colors.black,
      ),
    ),
  );
}



}