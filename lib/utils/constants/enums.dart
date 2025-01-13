/* --
      LIST OF Enums
      They cannot be created inside a class.
-- */

/// Switch of Custom Brand-Text-Size Widget
enum TextSizes { small, medium, large }

enum ImageType { network, memory, asset, file, svg }

enum DeliveryStatus {
  pending,
  processing,
  shipped,
  delivered,
  cancelled,
}

enum VerificationStatus { all, pending, approved, rejected }

enum PaymentStatus {
  all,
  pending,
  paid,
  failed,
}

enum MediaCategory { folders, banners, brands, categories, users, products }

enum SortProduct {
  all,
  latest,
  date,
  lowtohigh,
  hightolow,
}

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
