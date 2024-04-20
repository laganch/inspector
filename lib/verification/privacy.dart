import 'package:airs_inspector/myApp.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Privacy extends StatefulWidget {
  const Privacy({super.key});

  @override
  State<StatefulWidget> createState() => _Privacy();
}

class _Privacy extends State<Privacy> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Anambra Inspector"),
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return const MainApp();
                },
              ),
            );
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      backgroundColor: Theme.of(context).colorScheme.primaryContainer,
      body: SizedBox(
        child: ListView(
          children: [
            SizedBox(
              child: Container(
                decoration: BoxDecoration(),
                margin: const EdgeInsets.all(15),
                child: Column(
                  children: [
                  Text(
                    "Privacy Policy Document",
                    style: GoogleFonts.acme(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                        textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const SizedBox(
                    height: 23,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: 'For the purposes of this Privacy Policy\n'),
                        TextSpan(
                            text: '      Account ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'means a unique account created for You to access our Service or parts of our Service.',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Application ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'refers to Anambra Inspector Mobile App, the software program developed by Oasis Management Company for our client Anambra State Government through Anambra State Internal Revenue Service.',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Company ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              '(Referred to as either “The Company”, “We”, “Us”, or “Our” in this Agreement) refers to Oasis Management Company, 12 Parakou Street, Aminu Kano Crescent, Wuse 2, FCT Abuja.',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Country ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: 'refers to: Nigeria.',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Personal Data ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'is any information that relates to an identified or identifiable individual.',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Device ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'means any device that can access the Service such as computer, digital tablet, a cellphone',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Client ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'refers to any Organization, Government, Ministries, Departments, Agency that we provide software application service on their behalf. \nUsage Data refers to data collected automatically, either generated by the use of the Service or from the Service infrastructure itself (for example, the duration of a page visit).',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      You ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text:
                              'mean the individual accessing or using the Service, or the company, or other legal entity on behalf of which such individual is accessing or using the Service, as applicable.',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: '      Services ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                          text: 'refers to the Application',
                        ),
                        TextSpan(text: ''),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                            text: 'Scope and Consent \n',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        TextSpan(
                            text:
                                ' By accepting and using our website, mobile app and all other related applications and its features, functions, contents developed by Us for our clients, you agree to this Privacy Policy and the terms thereof.'),
                      ],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      text: '',
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Please read the terms of our service and this privacy policy before you continue to use our Services.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Usage Data is collected automatically when using the Service. ',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Usage Data may include information such as Your Device’s Internet Protocol address (e.g., IP Address), browser type, browser version, the pages of our Services that You visit, the time and date of Your visit, the time spent on those pages, unique device identifiers and other diagnostic data.\nWhen You access the Service by or through a mobile device, We may collect certain information automatically, including, but not limited to, the type of mobile device You use, Your mobile device unique ID, the IP address of Your mobile deice, Your mobile operating system, the type of mobile Internet browser You use, unique device identifiers and other diagnostic data.\nWe may also collect information that Your browser sends whenever You visit our Service or when You access the Service by or through a mobile device.\nWe also collect other Personal Information or Personal Data. They include ASIN, T/U Codes, Full Names, etc, as may be required to consume the service we provide.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Information Collected while Using the Application.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'When using Anambra Inspector App, in order to provide certain services to you, such as requesting to sign-out our account (T/U code) when you are sick, when you take your vehicle for maintenance, etc. and will not be able to work, in other not incur the daily vehicle operational fee, we may collect with Your prior permission: \n\n1. Information regarding your location \n2. Pictures and other information from your Device’s camera and photo library\n\nWe use this information to provide different services on the application and to submit same to our clients – Anambra State Internal Revenue Service (AIRS). The information may be uploaded to the Company’s servers and/or a Server located in the location of our client - AIRS or it may be simply stored on Your device. You can enable or disable access to this information at any time, through Your Device settings.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Retention of Your Personal Data.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'The Company will retain Your Personal Data only for as long as is necessary for the purposes set out in this Privacy Policy. We will retain and use Your Personal Data to the extent necessary to comply with our legal obligations (for example, if we are required to retain your data to comply with applicable laws), resolve disputes, and enforce our legal agreements and policies. \n\nThe Company will also retain Usage Data for internal analysis purposes. Usage Data is generally retained for a shorter period of time, except when this data is used to strengthen the security or to improve the functionality of Our Service, or We are legally obligated to retain this data for longer time periods.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Transfer of Your Personal Data.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Your information, including the collected Personal Data, is processed and stored in our computers in FCT Abuja, and in our hosting environment both in Nigeria and abroad. It means that this information may be transferred to our client’s locations and maintained on our computers located outside of Your state, province, country or other governmental jurisdiction where the data protection laws may differ than those from Your jurisdiction. \n\nYour consent to this Privacy Policy followed by Your submission of such information represents Your agreement to that transfer and use of your Personal Information. \n\nThe Company will take all steps reasonably necessary to ensure that Your data is treated securely and in accordance with this Privacy Policy and no transfer of Your Personal Data will take place to an organization or country unless there are adequate controls in place including the security of Your data and other personal information. Some of the security measures taken to protect your information include: firewalls, data encryption, VPN controls, physical access controls in our data centers in Abuja and in our client’s server locations.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Delete Your Personal Data.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'You have the right to delete or request that We assist in deleting the Personal Data that We have collected about You.\n\n  Our Service may give You the ability to delete certain information about You from within the Service. You may update, amend, or delete Your information at any time by signing in to Your Account, if you have one, and visiting the account settings section that allows you to manage Your personal information. You may also contact Us to request access to, correct, or delete any personal information that You have provided to Us.  \n\nPlease note, however, that We may need to retain certain information when we have a legal obligation or lawful basis to do so.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Customer data protection.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'Taxpayers and our application user’s data protection rights and are entitled to the following: \n\nThe right to access – Taxpayers have the right to request copies of their personal data. Oasis Management Company or Our client (Government Agency) may charge a fee to release and offer this service if it will require a substantial amount of resources to accomplish. \n\nThe right to modification – Taxpayers and Customers have the right to request that Oasis Management Company or our client (Government Agency) correct or modify (with approval from the relevant office) any information they believe and have proven has been captured inaccurately. Taxpayers also have the right to request to update certain information they believe may have changed or is incomplete. \n\nThe right to object to processing  – Users and Taxpayers have the right to object to Our Company’s processing of your personal data, under certain conditions. However, if such information are compulsory requirements from our Client (Government Agencies), Oasis will abide by the requirements of the Law/Act establishing such Government Agency. In this case, the taxpayer, user, or customer may approach our Client for such objection.  \n\nThe right to data portability – Customers have the right to request that Oasis Management Company transfer the data that we have collected to another organization, or directly to them, under certain conditions. However, such conditions must adhere to established Law/Acts. In instances where we do not have a permission to transfer or from our Client, We will not adhere to such request. Customer requests based on any of the rights above shall be handled between 3 to 5 working weeks.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'How to contact us.',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  RichText(
                    text: const TextSpan(
                      children: <TextSpan>[
                        TextSpan(
                          text:
                              'If you have any questions, concerns, or requests regarding this Privacy Policy or your personal information, please contact us at: \n\nOasis Management Company \n12 Parakou Street, Aminu Kano Crescent, Wuse 2 FCT Abuja \ninfo@oasismgt.net',
                        ),
                      ],
                      style: TextStyle(color: Colors.black, fontSize: 12,),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                ]),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

mixin also {
}
