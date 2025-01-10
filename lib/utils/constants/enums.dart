/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

/// Switch of Custom Brand-Text-Size Widget
enum TextSizes { small, medium, large }

enum ImageType { network, memory, asset, file, svg }

enum DefaultStatus {
  processing,
  cancelled,
  pending,
  shipped,
  delivered,
  approved,
  rejected
}

enum MediaCategory { folders, banners, brands, categories, users, products }

enum PaymentMethods {
  paypal,
  googlePay,
  applePay,
  visa,
  masterCard,
  creditCard,
  paystack,
  razorPay,
  paytm
}
