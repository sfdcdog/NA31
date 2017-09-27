/*

The following code is not owned by me. Source URL: http://jessealtman.com/2014/03/dependency-injection-in-apex/
This is a concept introduced by Jesse Altman. I'm using this concept to introduce a higher level of abstraction
and to make the underlying concpet more advanced.

*/
public class DI_PaypalPaymentService implements DI_PaymentInterface{
   public String processPayment(){
        // 1. Connect to payment processor
        // 2. ???
        // 3. Profit!
        return 'Paypal successfully processed your payment!';
    }
}