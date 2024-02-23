import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop_app/bottom_bar_utility.dart';
import 'package:pet_shop_app/pet_model.dart';
import 'package:pet_shop_app/providers/cart_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const SizedBox(
        height: 90,
        child: BottomNavBar(),
      ),     
      body: Consumer<CartProvider>(builder: (context, provider, _){
        return Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              topText(),
              SizedBox(
                height: 500,
                child: ListView.builder(
                  itemCount: provider.items.length,
                  itemBuilder: (context, index){
                    PetModel pet = provider.items[index];
                      return Material(
                        elevation: 3,
                        child: ListTile(
                          contentPadding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
                          leading: CircleAvatar(
                            radius: 24,
                            backgroundImage: AssetImage(pet.cardPic),
                          ),
                          title: Text(
                            '${pet.breed} ${pet.species}',
                            style: GoogleFonts.inter(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          subtitle: Text(
                            'Price: \$${pet.price}',
                            style: GoogleFonts.inter(
                              fontSize: 16,
                            ),
                          ),
                          trailing: IconButton(
                            icon: const Icon(Icons.remove_circle),
                            color: Colors.red,
                            onPressed: () {
                              provider.remove(pet);
                            },
                          ),
                        ),
                      );

                }),
              ),
              Text("Cart Total: \$${provider.getCartTotal()}"),
              startButton(),
            ],
          ),
        );
      },
      ),
    );
  }
  
  Text topText() {
    return Text('Shopping Cart',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w400
                )
              );
  }
  
  Widget startButton() {
    return ElevatedButton(
      onPressed: () async {

      },
      style: ElevatedButton.styleFrom(
        elevation: 1,
        fixedSize: const Size(367, 53),
        backgroundColor: const Color(0xFFE8BE13),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Checkout/Pay',
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }
}