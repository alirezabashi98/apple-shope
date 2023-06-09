import 'package:flutter_apple_shop/bloc/basket/basket_event.dart';
import 'package:flutter_apple_shop/bloc/basket/basket_state.dart';
import 'package:flutter_apple_shop/data/repository/basket_repository.dart';
import 'package:flutter_apple_shop/di/di.dart';
import 'package:flutter_apple_shop/util/extenstion/extract_value_from_query.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uni_links/uni_links.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:zarinpal/zarinpal.dart';

class BasketBloc extends Bloc<BasketEvent, BasketState> {
  final IBasketRepository _basketRepository = locator.get();
  final PaymentRequest _paymentRequest = PaymentRequest();

  BasketBloc() : super(BasketInitState()) {
    on<BasketFetchFromHiveEvent>((event, emit) async {
      final basketItemList = await _basketRepository.getAllBasketItems();
      final finalPrice = await _basketRepository.getBasketFinalPrice();
      emit(BasketDataFetchedState(basketItemList, finalPrice));
    });
    on<BasketPaymentInitEvent>((event, emit) async {
      _paymentRequest.setIsSandBox(true);
      _paymentRequest.setAmount(1000);
      _paymentRequest.setDescription('this is for test');
      // todo
      _paymentRequest.setMerchantID('merchantID');
      _paymentRequest.setCallbackURL('alirezabashi98://shop');

      linkStream.listen(
        (deepLink) {
          if (deepLink!.toLowerCase().contains('authority')) {
            String? authority = deepLink.extractValueFromQuery('Authority');
            String? status = deepLink.extractValueFromQuery('Status');
            ZarinPal().verificationPayment(
              status!,
              authority!,
              _paymentRequest,
              (isPaymentSuccess, refID, paymentRequest) {
                if (isPaymentSuccess) {
                  print(refID);
                } else {
                  print('error');
                }
              },
            );
          }
        },
      );
    });
    on<BasketPaymentRequestEvent>((event, emit) async {
      ZarinPal().startPayment(
        _paymentRequest,
        (status, paymentGatewayUri) {
          if (state == 100) {
            launchUrl(
              Uri.parse(paymentGatewayUri!),
              mode: LaunchMode.externalApplication,
            );
          }
        },
      );
    });
  }
}
