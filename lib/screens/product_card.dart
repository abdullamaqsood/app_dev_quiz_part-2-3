import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/product_bloc.dart';

class ProductCard extends StatefulWidget {
  @override
  State<ProductCard> createState() => _ProductCardState();
}

class _ProductCardState extends State<ProductCard> {
  int selectedColorIndex = 0;

  final List<Color> baseColors = [
    Colors.black,
    Colors.redAccent,
    Colors.green.shade200,
    Colors.white,
    Colors.purple, // hidden (extra) color
  ];

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProductBloc, ProductState>(
      builder: (context, state) {
        final product = state.product;

        return Container(
          padding: EdgeInsets.all(16),
          margin: EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header Row
              Row(
                children: [
                  Expanded(
                    child: Text(
                      "Recommended for your devices",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "See All",
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                  )
                ],
              ),
              SizedBox(height: 16),

              /// Product Image
              Stack(
                children: [
                  Center(
                    child: Image.network(
                      product.imageUrl,
                      height: 180,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    child: IconButton(
                      icon: Icon(
                        product.isBookmarked
                            ? Icons.bookmark
                            : Icons.bookmark_border,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        context.read<ProductBloc>().add(ToggleBookmark());
                      },
                    ),
                  ),
                ],
              ),
              SizedBox(height: 16),

              /// Info
              Center(
                child: Column(
                  children: [
                    Text(
                      "Free Engraving",
                      style: TextStyle(color: Colors.amberAccent, fontSize: 12),
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.name,
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    SizedBox(height: 4),
                    Text(
                      product.price,
                      style: TextStyle(color: Colors.white70),
                    ),
                    SizedBox(height: 12),

                    /// Color Dots (max 4) + "+N more"
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ...List.generate(
                          4,
                          (index) {
                            final baseColor = baseColors[index];
                            final lightShade = Color.alphaBlend(
                              Colors.white.withOpacity(0.3),
                              baseColor,
                            );
                            final darkShade = Color.alphaBlend(
                              Colors.black.withOpacity(0.3),
                              baseColor,
                            );

                            return GestureDetector(
                              onTap: () {
                                setState(() {
                                  selectedColorIndex = index;
                                });
                              },
                              child: Container(
                                margin: EdgeInsets.symmetric(horizontal: 4),
                                width: 16,
                                height: 16,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  gradient: LinearGradient(
                                    begin: Alignment.topCenter,
                                    end: Alignment.bottomCenter,
                                    colors: [lightShade, darkShade],
                                  ),
                                  border: Border.all(
                                    color: selectedColorIndex == index
                                        ? Colors.white
                                        : Colors.transparent,
                                    width: 2,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                        if (baseColors.length > 4)
                          Padding(
                            padding: const EdgeInsets.only(left: 8),
                            child: Text(
                              "+${baseColors.length - 4} more",
                              style: TextStyle(
                                  color: Colors.grey.shade400, fontSize: 12),
                            ),
                          ),
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
        );
      },
    );
  }
}
