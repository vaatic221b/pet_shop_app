import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pet_shop_app/screens/catalog.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class StartPage extends StatelessWidget {
  StartPage({super.key});

  final _controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          backgroundImage(),
          Container(
            color: Colors.transparent,
            child: Column(
              children: [
                welcomeText(context),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Image backgroundImage() {
    return Image.asset(
        'assets/images/start_cat.png',
        fit: BoxFit.fill,
        width: 500,
        height: 500,
      );
  }

  Widget welcomeText(context) {
    return Padding(
      padding: const EdgeInsets.only(top: 450),
      child: Container(
                width: 400,
                height: 350,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(35),
                ),
                child: Padding(
                  padding: const EdgeInsets.only(top: 50),
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: SmoothPageIndicator(
                  controller: _controller,
                  count: 3,
                  effect: const SlideEffect(
                      paintStyle: PaintingStyle.stroke,
                      activeDotColor: Color(0xFFE8BE13),
                      dotColor: Color(0xFFE0E0E1),
                      dotHeight: 5,
                      dotWidth: 15),
                  onDotClicked: (index) {
                    _controller.animateToPage(index,
                        duration: const Duration(milliseconds: 300),
                        curve: Curves.easeInOut);
                  },
                )
                        ),
                        const SizedBox(height: 30),
                        Center(
                          child: SizedBox(
                            height: 165,
                            width: 367,
                            child: SizedBox(
                              child: PageView(
                                controller: _controller,
                                children: [
                                  message1(),
                                  message2(),
                                  message3()
                                ]
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(height: 35),
                        Center(child: startButton(context)),
                        
                      ],
                    ),
                  ),
                ),
              ),
    );
  }

  Widget startButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () async {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) {
              return const CatalogPage();
            },
          ),
        );
      },
      style: ElevatedButton.styleFrom(
        elevation: 0,
        fixedSize: const Size(367, 53),
        backgroundColor: const Color(0xFFE8BE13),
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
      child: Text(
        'Get Started',
        style: GoogleFonts.inter(
          fontSize: 17,
          fontWeight: FontWeight.w700,
        ),
      ),
    );
  }

  Widget message1() {
    return Column(
      children: [
        Text("Find Your Furry Friend's Perfect Match!",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text("Discover local pet lovers ready to provide grooming, training, and veterinary services tailored to your pet's needs.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFFA1A1A1),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Widget message2() {
    return Column(
      children: [
        Text('Your One-Stop Pet Shop Experience!',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text('Connect with 5-star pet caregivers near you who offer boarding, walking, house sitting or day care.',
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFFA1A1A1),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }

  Widget message3() {
    return Column(
      children: [
        Text("Paw-some Adventures Await!",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
          fontSize: 26,
          fontWeight: FontWeight.w700,
          ),
        ),
        const SizedBox(height: 10),
        Text("Explore pet-friendly activities, parks, and events in your area, curated just for you and your beloved companion.",
          textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
            color: const Color(0xFFA1A1A1),
            fontSize: 17,
            fontWeight: FontWeight.w400,
          ),
        )
      ],
    );
  }
}