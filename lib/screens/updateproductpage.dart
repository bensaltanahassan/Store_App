import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:store_app/models/product_model.dart';
import 'package:store_app/services/update_product_service.dart';
import 'package:store_app/widgets/custom_text_form_field.dart';

class UpdateProductPage extends StatefulWidget {
  UpdateProductPage({Key? key}) : super(key: key);
  static const String id = 'update_product_page';

  @override
  State<UpdateProductPage> createState() => _UpdateProductPageState();
}

class _UpdateProductPageState extends State<UpdateProductPage> {
  String? productName, productDescription, productImage;

  double? productPrice;
  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    final ProductModel product =
        ModalRoute.of(context)!.settings.arguments as ProductModel;
    return ModalProgressHUD(
      inAsyncCall: _isLoading,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Text('Update Product', style: TextStyle(color: Colors.black)),
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.only(top: 60, left: 20, right: 20),
          child: SingleChildScrollView(
            child: Column(children: [
              CustomTextField(
                obscureText: false,
                hintText: 'Enter new product name',
                onChanged: (value) {
                  productName = value;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                inputType: TextInputType.number,
                obscureText: false,
                hintText: 'Enter new product price',
                onChanged: (value) {
                  productPrice = double.parse(value);
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                obscureText: false,
                hintText: 'Enter new product description',
                onChanged: (value) {
                  productDescription = value;
                },
              ),
              SizedBox(height: 20),
              CustomTextField(
                obscureText: false,
                hintText: 'Enter new product image url',
                onChanged: (value) {
                  productImage = value;
                },
              ),
              SizedBox(height: 100),
              MaterialButton(
                onPressed: () async {
                  _isLoading = true;
                  setState(() {});
                  try {
                    await updateProduct(product);
                    print('Product updated==================');
                  } catch (e) {
                    print(e.toString());
                    _isLoading = false;
                    setState(() {});
                  }
                  _isLoading = false;
                  setState(() {});
                },
                child: Text('Update Product'),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 0,
              ),
            ]),
          ),
        ),
      ),
    );
  }

  Future<void> updateProduct(ProductModel product) async {
    await UpdateProductService().updateProduct(
      title: productName ?? product.title,
      description: productDescription ?? product.description,
      price: productPrice ?? product.price,
      image: productImage ?? product.image,
      category: product.category,
      id: product.id.toString(),
    );
  }
}
