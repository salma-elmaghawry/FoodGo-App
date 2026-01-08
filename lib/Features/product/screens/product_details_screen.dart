import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:foodgo_app/Features/product/widgets/bottom_order_bar.dart';
import 'package:foodgo_app/Features/product/widgets/product_header_section.dart';
import 'package:foodgo_app/Features/product/widgets/product_options_section.dart';

class ProductDetailsScreen extends StatefulWidget {
  const ProductDetailsScreen({super.key});

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  final ScrollController _scrollController = ScrollController();
  bool _isScrolled = false;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      if (_scrollController.offset > 50 && !_isScrolled) {
        setState(() {
          _isScrolled = true;
        });
      } else if (_scrollController.offset <= 50 && _isScrolled) {
        setState(() {
          _isScrolled = false;
        });
      }
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final List<ProductOptionModel> toppings = [
      ProductOptionModel(label: "Tomato", imagePath: "assets/test/c1.png"),
      ProductOptionModel(label: "Onions", imagePath: "assets/test/c2.png"),
      ProductOptionModel(label: "Pickles", imagePath: "assets/test/c3.png"),
      ProductOptionModel(label: "Bacons", imagePath: "assets/test/c4.png"),
    ];

    final List<ProductOptionModel> sideOptions = [
      ProductOptionModel(label: "Fries", imagePath: "assets/test/c5.png"),
      ProductOptionModel(label: "Coleslaw", imagePath: "assets/test/c6.png"),
      ProductOptionModel(label: "Salad", imagePath: "assets/test/c7.png"),
      ProductOptionModel(label: "Onion", imagePath: "assets/test/c1.png"),
    ];

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: _isScrolled ? Colors.white : Colors.transparent,
        elevation: _isScrolled ? 1 : 0,
        scrolledUnderElevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Safe area space for transparent app bar
            SizedBox(height: MediaQuery.of(context).padding.top + 56.h),
            //details and slider
            const ProductHeaderSection(),
            SizedBox(height: 20.h),
            //Toppings
            ProductOptionsSection(title: "Toppings", options: toppings),
            SizedBox(height: 20.h),
            //Side options
            ProductOptionsSection(title: "Side options", options: sideOptions),
            SizedBox(height: 100.h),
          ],
        ),
      ),
      bottomNavigationBar: BottomOrderBar(
        price: "16.49",
        onOrder: () {
          // Order action
        },
      ),
    );
  }
}
