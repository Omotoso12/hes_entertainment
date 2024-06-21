import 'package:flutter/material.dart';

class TermsCondition extends StatelessWidget {
  const TermsCondition({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: DefaultTextStyle(
            textAlign: TextAlign.justify,
            style: TextStyle(
              fontFamily: 'Poppins',
            ),
            child: Center(
              child: SizedBox(
                width: 310,
                child: Column(
                  children: [
                    Center(
                      child: Text(
                        'HES Entertainment',
                        style: TextStyle(fontSize: 24),
                      ),
                    ),
                    Center(
                      child: Text(
                        'Terms and Conditions',
                      ),
                    ),
                    Text('T&C', style: TextStyle(fontSize: 24)),
                    Text(
                        'This agreement (the "Agreement") governs the use of our ticket website "HES2.5 ENTERTAINMENT" and the services provided by us (the "Services") to purchase events (the "Events").'),
                    Text('Acceptance of Terms',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'By using the Website and the Services, you agree to be bound by these Terms and Conditions. If you do not agree to these Terms and Conditions, please do not use the Website or the Services.'),
                    Text('Changes to the Terms',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'We reserve the right to modify or update these Terms and Conditions at any time without notice. It is your responsibility to review these Terms and Conditions periodically to ensure that you are aware of any changes.'),
                    Text('Fees and Charges',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'We charge a service fee for each ticket purchased through the Website. This fee is non-refundable and will be clearly displayed on the Website before you make a purchase. In addition to the service fee, some Events may charge additional fees. These fees are charged by the Event organizer and are not refundable.'),
                    Text('Ticket Purchases',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'When you purchase a ticket through the Website you can see your history on your profile and download your QR code Tickets are non-refundable and non-exchangeable, except as provided in our refund policy.'),
                    Text('Cancellation and Refund Policy',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'If an Event is canceled or postponed, we will provide a refund of the ticket price, less the service fee, if applicable. Refunds will be processed within 5-14 business days after we receive notice of the cancellation or postponement of the Event.'),
                    Text('Liability',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'We are not responsible for any damages or losses resulting from the use of the Website or the Services, including but not limited to any errors or omissions in any materials or information provided on the Website. In no event shall we be liable for any special, indirect, consequential, or punitive damages, even if we have been advised of the possibility of such damages.'),
                    Text('Governing Law',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'These Terms and Conditions shall be governed by and construed in accordance with the laws of the Nigeria without giving effect to any conflicts of law principles.'),
                    Text('Entire Agreement',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'These Terms and Conditions constitute the entire agreement between you and us with respect to the use of the Website and the Services, and supersede all prior agreements, whether written or oral.'),
                    Text(' Contact Us',
                        style: TextStyle(fontWeight: FontWeight.bold)),
                    Text(
                        'If you have any questions or concerns about these Terms and Conditions, please contact our customer service'),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
