import 'package:get/get.dart';
import 'package:sample/models/products.dart';

class ProductController extends GetxController {
  // Store selected product's index
  var selectedProductIndex = 0.obs;
  // Store attributes of selected product
  var productTitle = "";
  var productBrand = "";
  var productPrice = "";
  var productMarketUrl = "";
  var productCategory = "";
  var productDiscountCode = "";
  var productBrandLogo = "";
  var productImage = "";
  var productUrl = "";
  var isBookmarked = false.obs;

  // Define a variable to check whether the discount code is copied or not
  var isCopied = false.obs;

  // Method to toggle the bookmark status
  void toggleBookmark() {
    isBookmarked.value = !isBookmarked.value;
  }

  // Methods to toggle the copy status
  void setCopied() {
    isCopied.value = true;
  }

  void openCopyButton() {
    isCopied.value = false;
  }

  // Store selected product
  void storeSelectedProduct(int productIndex) {
    selectedProductIndex.value = productIndex;
    storeSelectedProductDetails();
  }

  // Extract selected product details
  void storeSelectedProductDetails() {
    Product selectedProduct =
        Product.fromJSON(data[selectedProductIndex.value]);
    productTitle = selectedProduct.title;
    productBrand = selectedProduct.brand;
    productPrice = selectedProduct.price;
    productMarketUrl = selectedProduct.market;
    productCategory = selectedProduct.category;
    productDiscountCode = selectedProduct.discountCode;
    productBrandLogo = selectedProduct.brandLogo;
    productImage = selectedProduct.productImage;
    productUrl = selectedProduct.productUrl;
    isBookmarked.value = selectedProduct.isBookmarked;
  }
}
