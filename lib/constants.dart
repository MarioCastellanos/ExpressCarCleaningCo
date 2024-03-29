import 'package:flutter/material.dart';

const Color ECCCBlue = Color(0xFF3A87E9);
const Color ECCCDarkBlue = Color(0xFF275B97);
const Color LightGrey = Color(0xFFBFCBD2);
const Color ECCCBlueAccent = Colors.lightBlueAccent;

const Color Diamond = Color(0xFFB9F2FF);
const Color Sapphire = Color(0xFF0f52ba);
const Color Ruby = Color(0xFFE0115F);
const Color Emerald = Color(0xFF046307);

const TextStyle kOutLineButtonTextStyle = TextStyle(
  color: ECCCBlueAccent,
  fontSize: 15,
);

TextStyle kInkWellTextStyle = TextStyle(
  decoration: TextDecoration.underline,
  color: ECCCBlue,
  fontSize: 16,
);

TextStyle kResetPasswordTextStyle = TextStyle(
  height: 1,
  fontWeight: FontWeight.w400,
  fontFamily: 'Vollkorn',
  color: ECCCBlueAccent,
  backgroundColor: Colors.white,
  letterSpacing: 1.0,
  fontSize: 36,
);

const TextStyle kDiamondTextStyle = TextStyle(
  height: 1,
  fontWeight: FontWeight.w700,
  fontFamily: 'Vollkorn',
  fontStyle: FontStyle.italic,
  color: Diamond,
  letterSpacing: 1.0,
  fontSize: 30,
);

const TextStyle kSapphireTextStyle = TextStyle(
  height: 1,
  fontWeight: FontWeight.w700,
  fontFamily: 'Vollkorn',
  fontStyle: FontStyle.italic,
  color: Sapphire,
  letterSpacing: 1.0,
  fontSize: 30,
);

const TextStyle kRubyTextStyle = TextStyle(
  height: 1,
  fontWeight: FontWeight.w700,
  fontFamily: 'Vollkorn',
  fontStyle: FontStyle.italic,
  color: Ruby,
  letterSpacing: 1.0,
  fontSize: 30,
);

const TextStyle kEmeraldTextStyle = TextStyle(
  height: 1,
  fontWeight: FontWeight.w700,
  fontFamily: 'Vollkorn',
  fontStyle: FontStyle.italic,
  color: Emerald,
  letterSpacing: 1.0,
  fontSize: 30,
);

SizedBox kSpacerBox = SizedBox(
  height: 10,
);

IconData kSetVisibility(bool isObscured) {
  return isObscured ? Icons.visibility_off : Icons.visibility;
}

TextStyle kPackageDetailsTS = TextStyle(
  fontSize: 20,
  fontFamily: 'Vollkorn',
);

Text kDiamondPackageDetails = Text(
  '• Hand Wax \n'
  '• Detailed Exterior Wash\n'
  '• Tires & Rims hand wash\n'
  '• Interior Super Clean \n'
  '• All carpet shampoo \n'
  '• Full seats deep cleaning \n'
  '• Trunk deep cleaning',
  style: kPackageDetailsTS,
  textAlign: TextAlign.center,
);

Text kSapphirePackageDetails = Text(
  '• Hand Wax \n'
  '• Detailed Exterior Wash \n'
  '• Tires & Rims Hand Wash \n'
  '• Interior Super Clean \n'
  '• All Carpet Shampoo \n'
  '• Full Seats Deep Cleaning \n'
  '• Trunk Deep Cleaning',
  style: kPackageDetailsTS,
  textAlign: TextAlign.center,
);

Text kRubyPackageDetails = Text(
  '• Exterior Wash\n'
  '• Tires & Rims hand wash\n'
  '• Interior Light Clean \n'
  '• All carpet shampoo \n'
  '• Car Seats light cleaning \n'
  '• Car Seats Vacuum ',
  style: kPackageDetailsTS,
  textAlign: TextAlign.center,
);

Text kEmeraldPackageDetails = Text(
  '• Exterior Wash\n'
  '• Tires & Rims\n'
  '• Carpet Light Cleaning\n'
  '• Seats Light Cleaning\n'
  '• Interior Light Cleaning',
  style: kPackageDetailsTS,
  textAlign: TextAlign.center,
);

List<String> kInteriorOptionsList = ['Leather', 'Alcantara', 'Wood', 'Cloth'];

List<String> carMakeList = [
  'Acura',
  'Alfa Romeo',
  'Am General',
  'Aston Martin',
  'Audi',
  'Avanti Motors',
  'Bentley',
  'BMW',
  'Bugatti',
  'Buick',
  'Cadillac',
  'Chevrolet',
  'Chrysler',
  'Daewoo',
  'Daihatsu',
  'Dodge',
  'Eagle',
  'Ferrari',
  'FIAT',
  'Fisker',
  'Ford',
  'Genesis',
  'Geo',
  'GMC',
  'Honda',
  'Hummer',
  'Hyundai',
  'Infiniti',
  'International',
  'Isuzu',
  'Jaguar',
  'Jeep',
  'Karma',
  'Kia',
  'Koenigsegg',
  'Lamborghini',
  'Land Rover',
  'Lexus',
  'Lincon',
  'Lotus',
  'Maserati',
  'Maybach',
  'Mazda',
  'McLaren',
  'Mercedez-Benz',
  'Mercury',
  'MINI',
  'Mitsubishi',
  'Morgan',
  'Nissan',
  'Oldsmobile',
  'Pagani',
  'Panoz',
  'Peugeot',
  'Plymouth',
  'Polestar',
  'Pontiac',
  'Porsche',
  'Qvale',
  'RAM',
  'Rolls-Royce',
  'Saab',
  'Saleen',
  'Saturn',
  'Scion',
  'Smart',
  'Spyker',
  'Sterling',
  'Subaru',
  'Suzuki',
  'Tesla',
  'Toyota',
  'Volkswagen',
  'Volvo',
  'Yugo',
];

Map<String, List<String>> carMakesModelsMap = {
  'Acura': [
    'CL',
    'ILX',
    'ILX Hybrid',
    'Integra',
    'Legend',
    'MDX',
    'MDX Sport Hybrid',
    'NSX',
    'RDX',
    'RL',
    'RLX',
    'RLX Sport Hybrid',
    'RSX',
    'SLX',
    'TL',
    'TLX',
    'TSX',
    'Vigor',
    'ZDX',
  ],
  'Alfa Romeo': [
    '164',
    '4C',
    '4C Spider',
    '8c Competizione',
    '8c Spider',
    'Giulia',
    'Spider',
    'Stelvio',
  ],
  'Am General': ['Hummer'],
  'Aston Martin': [
    'DB AR1 Zagato',
    'DB11',
    'DB7',
    'DB9',
    'DBS',
    'DBX',
    'Rapide',
    'Rapide S',
    'V12 Vanquish',
    'V12 Vantage',
    'V12 Vantage S',
    'V8 Vantage',
    'V8 Vantage S',
    'Vanquish',
    'Vantage',
    'Vantage GT',
    'Virage',
  ],
  'Audi': [
    '100',
    '200',
    '80',
    '90',
    'A3',
    'A3 e-tron',
    'A4',
    'A4 allroad',
    'A5',
    'A6',
    'A6 allroad',
    'A7',
    'A8',
    'A8 e',
    'allroad',
    'Cabriolet',
    'e-tron',
    'Q3',
    'Q5',
    'Q5 e',
    'Q5 Hybrid',
    'Q7',
    'Q8',
    'R8',
    'RS 3',
    'RS 4',
    'RS 5',
    'RS 6',
    'RS 6 Avant',
    'RS 7',
    'RS Q8',
    'S3',
    'S4',
    'S5',
    'S6',
    'S7',
    'S8',
    'SQ5',
    'SQ7',
    'SQ8',
    'TT',
    'TT RS',
    'TTS',
  ],
  'Avanti Motors': ['Avanti'],
  'Bentley': [
    'Arnage',
    'Azure',
    'Bentayga',
    'Bentayga Hybrid',
    'Brooklands',
    'Continental',
    'Continental',
    'Continental Flying Spur',
    'Mulsanne',
    'R-Type',
    'Turbo R',
    'Turbo RL',
    'Turbo RT',
    'Turbo S',
  ],
  'BMW': [
    '128',
    '135',
    '228',
    '230',
    '228 Gran Coupe',
    '318',
    '320',
    '323',
    '325',
    '328',
    '328 Gran Turismo',
    '328d',
    '330',
    '330 Gran Turismo',
    '330 e',
    '335',
    '335 Gran Turismo',
    '340',
    '340 Gran Turismo',
    'Active Hybrid 3',
    '428',
    '428 Gran Coupe',
    '430',
    '430 Gran Coupe',
    '435',
    '435 Gran Coupe',
    '440',
    '440 Gran Coupe',
    '525',
    '528',
    '530',
    '530e',
    '535',
    '535 Gran Coupe',
    '535d',
    '540',
    '540d',
    '545',
    '550',
    '550 Gran Tourismo',
    'ActiveHybrid 5',
    '640',
    '640 Gran Turismo',
    '640 Gran Coupe',
    '645',
    '650',
    '650 Gran Coupe',
    '735',
    '740',
    '740e',
    '745',
    '750',
    '760',
    'ActiveHybrid 7',
    'ActiveHybrid 740',
    'ActiveHybrid 750',
    '745e',
    '840',
    '840 Gran Coupe',
    '850',
    'M2',
    'M235',
    'M235 Gran Coupe',
    'M240',
    'M3',
    'M340',
    'M4',
    'M5',
    'M550',
    'M6',
    'M6 Gran Coupe',
    'M760',
    'M8',
    'M8 Gran Coupe',
    'M850',
    'M850 Gran Coupe',
    'Alpina B6 Gran Coupe',
    'Alpina B7',
    'Alpina XB7',
    'i3',
    'i8',
    'Z4 M',
    'X1',
    'X2',
    'X3',
    'X3 M',
    'X3 PHEV',
    'X4',
    'X4 M',
    'X5',
    'X5 M',
    'X5 edrive',
    'X6',
    'X6 M',
    'X7',
    'Z3',
    'Z4',
    'Z8',
  ],
  'Bugatti': ['Chiron', 'Veyron', 'Veyron 16.4'],
  'Buick': [
    'Cascada',
    'Century',
    'Enclave',
    'Encore',
    'Encore GX',
    'Envision',
    'LaCrosse',
    '',
    'LeSabre',
    'Lucerne',
    'Park Avenue',
    'Rainier',
    'Reatta',
    'Regal',
    'Regal Sportback',
    'Regal TourX',
    'Rendezvous',
    'Riviera',
    'Roadmaster',
    'Skylark',
    'Terraza',
    'Verano',
  ],
  'Cadillac': [
    'Allante',
    'ATS',
    'ATS-V',
    'Brougham',
    'Catera',
    'CT4',
    'CT4-V',
    'CT5',
    'CT5-V',
    'CT6',
    'CT6-V',
    'CT6 PLUG-IN',
    'CT6-V',
    'CTS',
    'CTS-V',
    'DeVille',
    'DTS',
    'Eldorado',
    'ELR',
    'Escalade',
    'Escalade ESV',
    'Escalade Hybrid',
    'Fleetwood',
    'Seville',
    'Sixty Special',
    'SRX',
    'STS',
    'XLR',
    'XT4',
    'XT5',
    'XT6',
    'XTS',
  ],
  'Chevrolet': [
    'Astro',
    'Avalanche',
    'Aveo',
    'Barreta',
    'Blazer',
    'Bolt Ev',
    'Camaro',
    'Caprice',
    'Caprice Classic',
    'Captiva Sport',
    'Cavalier',
    'City Express',
    'Classic',
    'Cobalt',
    'Colorado',
    'Corsica',
    'Corvette',
    'Cruze',
    'Cruze Limited',
    'Equinox',
    'Express 1500',
    'Express 2500',
    'Express 3500',
    'Van G20',
    'HHR',
    'Impala',
    'Impala Limited',
    'Lumina',
    'Lumina APV',
    'Malibu',
    'Malibu Classic',
    'Malibu Limited',
    'Malibu Maxx',
    'Malibu Hybrid',
    'Metro',
    'Monte Carlo',
    'PickUp',
    'Prism',
    'S10',
    'S10 Blazer',
    'Silverado 1500',
    'Silverado 1500 Hybrid',
    'Silverado 1500 LD',
    'Silverado 2500',
    'Silverado 3500',
    'Sonic',
    'Spark',
    'Spark EV',
    'SportVan',
    'SS',
    'SSR',
    'Suburban',
    'Tahoe',
    'Tahoe Hybrid',
    'Tracker',
    'TrailBlazer',
    'TrailBlazer EXT',
    'Traverse',
    'Trax',
    'Uplander',
    'Venture',
    'Volt',
  ],
  'Chrysler': [
    '200',
    '300',
    '300 C',
    '300 M',
    'Aspen',
    'Aspen Hybrid',
    'Cirrus',
    'Concorde',
    'Crossfire',
    'Grand Voyager',
    ' Imperial',
    'LeBaron',
    'LHS',
    'New Yorker',
    'Pacifica',
    'Pacifica Hybrid',
    'Prowler',
    'PT Cruiser',
    'Sebring',
    'TC by Masserati',
    'Town & Country',
    'Voyager',
  ],
  'Daewoo': [
    'Lanos',
    'Leganza',
    'Nubira',
  ],
  'Daihatsu': [
    'Charade',
    'Rocky',
  ],
  'Dodge': [
    'Avenger',
    'Caliber',
    'Caravan',
    'Challenger',
    'Charger',
    'Colt',
    'D150',
    'D250',
    'D350',
    'Dakota',
    'Dart',
    'Daytona',
    'Durango',
    'Durango Hybrid',
    'Dynasty',
    'Grand Caravan',
    'Intrepid',
    'Journey',
    'Magnum',
    'Monaco',
    'Neon',
    'Nitro',
    'Pickup',
    'Ram 50',
    'Ram 1500',
    'Ram 2500',
    'Ram 3500',
    'Ram Van',
    'Ram Wagon',
    'RamCharger',
    'Shadow',
    'Spirit',
    'Sprinter',
    'SRT Viper',
    'Stealth',
    'Stratus',
    'Van',
    'Viper',
    'W150',
    'W250',
    'W350',
  ],
  'Eagle': ['Premier', 'Summit', 'Talon', 'Vision'],
  'Ferrari': [
    '348',
    '360 Modena',
    '360 Spider',
    '456 GT',
    '456 M',
    '458 Italia',
    '458 Speciale',
    '458 Spider',
    '488 Pista',
    '488 GTB',
    '488 Spider',
    '488 Pista Spider',
    '512 M',
    '512 TR',
    '550 Barchetta',
    '550 Maranello',
    '575 M',
    '599 GTB Fiorano',
    '599 GTO',
    '612 Scaglietti',
    '812 Superfast',
    'California',
    'Challange Stradale',
    'Enzo',
    'F12 Berlineta',
    'F12 TDF',
    'F355',
    'F40',
    'F430',
    'F58',
    'F8 Spider',
    'F8 Tributo',
    'FF',
    'GTC4Lusso',
    'GTC4LussoT',
    'LaFerrari',
    'LaFerrari Aperta',
    'Mondial',
    'MondialT',
    'Portofino',
    'SF90 Stradale',
    'Superamerica',
    'Testarossa',
  ],
  'FIAT': [
    '124 Spider',
    '500',
    '500 C',
    '500 e',
    '500 X',
    '500 L',
  ],
  'Fisker': ['Karma'],
  'Ford': [
    'Aerostar',
    'Aspire',
    'Bronco',
    'Bronco Sport',
    'C-Max Energi',
    'C-Max Hybrid',
    'Club Wagon',
    'Contour',
    'Crow Victoria',
    'E150',
    'E250',
    'E350',
    'E350 Super Duty',
    'EcoSport',
    'Edge',
    'Escape',
    'Escape PHEV',
    'Escape Hybrid',
    'Escort',
    'Excursion',
    'Expedition',
    'Expedition EL',
    'Expedition Max',
    'Explorer',
    'Explorer Sport',
    'Explorer Sport Trac',
    'F-150',
    'F-250',
    'F-350',
    'F-450',
    'Festiva',
    'Fiesta',
    'Five Hundred',
    'Flex',
    'Focus',
    'Focus Electric',
    'Focus RS',
    'Focus ST',
    'Freestar',
    'Freestyle',
    'Fusion',
    'Fusion Energi',
    'Fusion Hybrid',
    'GT',
    'LTD',
    'Mustang',
    'Mustang Mach-e',
    'Probe',
    'Ranger',
    'Sedan Police Intercepter',
    'Shellby GT350',
    'Shellby GT500',
    'Taurus',
    'Taurus X',
    'Tempo',
    'ThunderBird',
    'Transit Connect',
    'Transit 150',
    'Transit 250',
    'Transit 350',
    'Utility Police Interceptor',
    'Windstar',
    'ZX2',
  ],
  'Genesis': ['G70', 'G80', 'GV80', 'G90'],
  'Geo': [
    'Metro',
    'Prism',
    'Storm',
    'Tracker',
  ],
  'GMC': [
    'Acadia',
    'Acadia Limited',
    'Canyon',
    'Envoy',
    'Envoy XL',
    'Envoy XUV',
    'Jimmy',
    'Pick-Up',
    'Rally',
    'S15-Jimmy',
    'Safari',
    'Savanna 1500',
    'Savanna 2500',
    'Savanna 3500',
    'Van',
    'Vandura',
    'Sierra 1500',
    'Sierra 1500 Hybrid',
    'Sierra 1500 Limited',
    'Sierra 2500',
    'Sierra 3500',
    'Sonnoma',
    'Suburban',
    'Terrain',
    'Yukon',
    'Yukon Hybrid',
    'Yukon XL',
  ],
  'Honda': [
    'Accord',
    'Accord Hybrid',
    'Accord Crosstour',
    'Accord Plug-in Hybrid',
    'Civic',
    'Civic Hybrid',
    'Civic Si',
    'Civic Type R',
    'Clarity Electric',
    'Clarity Fuel Cell',
    'Clarity Plug-in Hybrid',
    'CR-V',
    'CR-V Hybrid',
    'CR-Z',
    'Crosstour',
    'CRX',
    'del Sol',
    'Element',
    'Fit',
    'Fit EV',
    'HR-V',
    'Insight',
    'Odyseey',
    'Passaport',
    'Pilot',
    'Prelude',
    'RidgeLine',
    'S2000',
  ],
  'Hummer': [
    'H1',
    'H1 Alpha',
    'H2',
    'H3',
    'H3 T',
  ],
  'Hyundai': [
    'Accent',
    'Azera',
    'Elantra',
    'Elantra GT',
    'Elantra Touring',
    'Entourage',
    'Equs',
    'Excel',
    'Genesis',
    'Genesis Coupe',
    'Ioniq EV',
    'Ioniq Hybrid',
    'Ionic Plug-in Hybrid',
    'Kona',
    'Kona EV',
    'NEXO',
    'Palissade',
    'Santa Fe',
    'Santa Fe Sport',
    'Santa Fe XL',
    'Scoupe',
    'Sonata',
    'Sonata Hybrid',
    'Sonata Plug-in Hybrid',
    'Tiburon',
    'Tuscon',
    'Veloster',
    'Veloster N',
    'Venue',
    'Veracruz',
    'XG300',
    'XG350',
  ],
  'Infiniti': [
    'EX 35',
    'EX 37',
    'FX 35',
    'FX 37',
    'FX 45',
    'FX 50',
    'G20',
    'G25',
    'G25 X',
    'G 35',
    'G 35X',
    'G 37',
    'G 37 X',
    'I 30',
    'I 35',
    'IPL G',
    'J 30',
    'JX 35',
    'M 30',
    'M 35',
    'M 35X',
    'M 35H',
    'M 37',
    'M 37X',
    'M 45',
    'M 45X',
    'M 56',
    'M 56X',
    'Q 40',
    'Q 45',
    'Q 50',
    'Q 50 Hybrid',
    'Q 60',
    'Q 60IPL',
    'Q 70',
    'Q 70H',
    'Q 70L',
    'QX 30',
    'QX 4',
    'QX 50 QX 56',
    'QX 60',
    'QX 60 Hybrid',
    'QX 70',
    'QX 80',
    '',
    '',
    '',
    '',
    '',
  ],
  'International': [
    'CXT',
    'MXT',
    'RXT',
  ],
  'Isuzu': [
    'Amigo',
    'Ascender',
    'Axiom',
    'Impulse',
    'Hombre',
    'i-280',
    'i-290',
    'i-350',
    'i-370',
    'Oasis',
    'Rodeo',
    'Rodeo Sport',
    'Stylus',
    'Trooper',
    'VehiCross',
  ],
  'Jaguar': [
    'E-Pace',
    'F-Pace',
    'F-Type',
    'I-Pace',
    'S-Type',
    'Super V8',
    'Super V8 Portfolio',
    'Vanden Place',
    'X-Type',
    'XE',
    'XE SUV',
    'XF',
    'XJ',
    'XJ12',
    'XJ6',
    'XJ8',
    'XJR',
    'XJR-S',
    'XJS',
    'XK',
    'XK8',
    'XKR',
  ],
  'Jeep': [
    'Cherokee',
    'Comanche',
    'Commander',
    'Compass',
    'Gladiator',
    'Grand Cherokee',
    'Grand Wagoneer',
    'Liberty',
    'New Compass',
    'Patriot',
    'Renegade',
    'Wrangler',
    'Wrangle JK',
    'Wrangler JK Unlimited',
    'Wrangler Unlimited',
  ],
  'Karma': [
    'Revero',
  ],
  'Kia': [
    'Amanti',
    'Borrego',
    'Cadenza',
    'Forte',
    'Forte Koup',
    'K5',
    'K900',
    'Niro',
    'Niro EV',
    'Niro Plug-in Hybrid',
    'Optima',
    'Optima EV',
    'Optima Plug-in Hybrid',
    'Rio',
    'Rio 5',
    'Rondo',
    'Sedona',
    'Seltos',
    'Sephia',
    'Sorento',
    'Soul',
    'Soul EV',
    'Spectra',
    'Spectra 5',
    'Sportage',
    'Stinger',
    'Telluride',
  ],
  'Koenigsegg': [
    'CCX',
    'One-1',
    'Agera',
    'Agera RS',
  ],
  'Lamborghini': [
    'Aventador',
    'Aventador SV',
    'Aventador SVJ',
    'Countach',
    'Diablo',
    'Gallardo',
    'Huracan',
    'Huracan EVO',
    'Murcielago',
    'Murcielago SV',
    'Urus',
  ],
  'Land Rover': [
    'Defender',
    'Discovery',
    'Discovery Sport',
    'Freelander',
    'LR2',
    'LR3',
    'LR4',
    'Range Rover',
    'Range Rover Evoque',
    'Range Rover Sport',
    'Range Rover Velar',
  ],
  'Lexus': [
    'CT 200 H',
    'ES 250',
    'ES 300',
    'ES 300 H',
    'ES 330',
    'ES 350',
    'GS 200t',
    'GS 300',
    'GS 350',
    'GS 400',
    'GS 430',
    'GS 450 H',
    'GS 460',
    'GS F',
    'GX 460',
    'GX 470',
    'HS 250 H',
    'IS 200t',
    'IS 250',
    'IS 250 C',
    'IS 300',
    'IS 350',
    'IS 350C',
    'IS F',
    'LC 500',
    'LC 500 H',
    'LFA',
    'LS 400',
    'LS 430',
    'LS 460',
    'LS 500',
    'LS 500 H',
    'LS 600 H L',
    'LX 450',
    'LX 470',
    'LX 570',
    'NX 200',
    'NX 300',
    'NX 300H',
    'RC 200T',
    'RC 300',
    'RC 350',
    'RC F',
    'RX 300',
    'RX 330',
    'RX 350',
    'RX 350L',
    'RX 400H',
    '450 H',
    '450 HL',
    'SC 300',
    'SC 400',
    'SC 430',
    'UX 200',
    'UX 250',
  ],
  'Lincon': [
    'Aviator',
    'Blackwood',
    'Continental',
    'Corsair',
    'LS',
    'Mark LT',
    'Mark VII',
    'Mark VIII',
    'MKC',
    'MKS',
    'MKT',
    'MKX',
    'MKZ',
    'MKZ Hybrid',
    'Nautilus',
    'Navigator',
    'Navigator L',
    'Town Car',
    'Zephyr',
  ],
  'Lotus': [
    'Elan',
    'Elise',
    'Espirit',
    'Espirit V8',
    'Evora',
    'Evora 400',
    'Evora GT',
    'Exige',
    'Exige S',
  ],
  'Maserati': [
    'Coupe',
    'Ghibli',
    'GranSport',
    'GranSport Spyder',
    'GranTurismo',
    'Levante',
    'Quattroporte',
    'Spyder',
  ],
  'Maybach': [
    'Landaulet',
    'Type 57',
    'Type 62',
  ],
  'Mazda': [
    '323',
    '626',
    '929',
    'B2200',
    'B2300',
    'B2500',
    'B2600',
    'B3000',
    'B4000',
    'CX-3',
    'CX-30',
    'CX-5',
    'CX-7',
    'CX-9',
    'Mazda 2',
    'Mazda 3',
    'Mazda 5',
    'Mazda 6',
    'Mazda Speed Miata MX-5',
    'Mazda Speed Protege',
    'Mazda Speed 3',
    'Mazda Speed 6',
    'Millenia',
    'MPV',
    'MX-3',
    'MX-5 Miata',
    'MX-5 Miata RF',
    'MX-6',
    'Navajo',
    'Protege',
    'Protege 5',
    'RX-7',
    'RX-8',
    'Tribute',
    'Tribute Hybrid',
  ],
  'McLaren': [
    '570 GT',
    '570 S',
    '600 LT',
    '650 S',
    '675 LT',
    '720 S',
    '765 LT',
    'GT',
    'MP4-12C',
  ],
  'Mercedez-Benz': [
    '190',
    '200',
    'AMG A35',
    'AMG E63',
    'AMG GT',
    'AMG GT53',
    'AMG GT63',
    'B-Class',
    'B-Class Electric Drive',
    'AMG C43',
    'AMG C63',
    'AMG CLA 35',
    'AMG CLA45',
    'CLA-250',
    'CLK-Class',
    'AMG CLS',
    'AMG CLS53',
    'AMG CLS63',
    'CLS 450',
    'CLS 550',
    'AMG E43',
    'AMG E53',
    'AMG E63',
    'AMG G63',
    'AMG G65',
    'G550 4x4 Squared',
    'AMG GL',
    'AMG GLA45',
    'GLA 250',
    'GLB 250',
    'AMG GLC43',
    'AMG GLC63',
    'GLC 300',
    'GLC 300E',
    'AMG GLE 43',
    'AMG GLE53',
    'AMG GLE63',
    'GLE 300D',
    'GLE 350',
    'GLE 400',
    'GLE 450E',
    'GLE 550E Plug-in Hybrid',
    'GLE 580',
    'GLK',
    'AMG GLS63',
    'GLS 350D',
    'GLS 450',
    'GLS 550',
    'GLS 580',
    'Maybach S550',
    'Maybach S560',
    'Maybach S600',
    'Maybach S650',
    'Metris',
    'R-Class',
    'AMG S63',
    'AMG S65',
    'AMG SL 63',
    'AMG SL 65',
    'SL 450',
    'SL 550',
    'AMG SLC 43',
    'SLC 300',
    'AMG SLK',
    'SLK',
    'SLR McLaren',
    'SLS AMG ',
    'Sprinter 1500',
    'Sprinter 2500',
    'Sprinter 3500',
    'Sprinter 3500XD',
    'Sprinter 4500',
  ],
  'Mercury': [
    'Capri',
    'Colony Park',
    'Cougar',
    'Grand Marquis',
    'Marauder',
    'Mariner',
    'Mariner Hybrid',
    'Milan',
    'Milan Hybrid',
    'Montego',
    'Monterey',
    'Mountaineer',
    'Mystique',
    'Sable',
    'Topaz',
    'Tracer',
    'Villager',
  ],
  'MINI': [
    'Clubman',
    'Convertible',
    'Cooper',
    'Cooper Clubman',
    'Cooper Countryman',
    'Cooper S',
    'Cooper S Clubman',
    'Cooper S Countryman',
    'Countryman',
    'Coupe',
    'E Countryman',
    'Hardtop',
    'John Cooper Works GP',
    'Paceman',
    'Roadster',
    'SE Countryman',
    'SE Hardtop',
  ],
  'Mitsubishi': [
    '3000 GT',
    'Diamante',
    'Eclipse',
    'Eclipse Cross',
    'Endevor',
    'Expo',
    'Galant',
    'i-MiEV',
    'Lancer',
    'Lancer Evolution',
    'Lancer Sportback',
    'Mirage',
    'Mirage G4',
    'Montero',
    'Montero Sport',
    'Outlander',
    'Outlander PHEV',
    'Outlander Sport',
    'Pickup',
    'Precis',
    'Raider',
  ],
  'Morgan': ['Aero 8', 'Plus 8', 'Roadster'],
  'Nissan': [
    '200SX',
    '240SX',
    '300ZX',
    '350Z',
    '370Z',
    'Altima',
    'Altima Hybrid',
    'Armada',
    'Cube',
    'Frontier',
    'GT-R',
    'Juke',
    'Kicks',
    'Leaf',
    'Maxima',
    'Murano',
    'Murano CrossCabriolet',
    'Muran Hybrid',
    'NV Cargo NV1500',
    'NV Cargo NV 2500 HD',
    'NV Cargo NV3500 HD',
    'NV Passenger',
    'NV Passenger 3500 HD',
    'NV 200',
    'NX',
    'Pathfinder',
    'Pathfinder Hybrid',
    'Pickup',
    'Quest',
    'Rogue',
    'Rogue Hybrid',
    'Rogue Select',
    'Rouge Sport',
    'Sentra',
    'Stanza',
    'Titan',
    'Titan XD',
    'Versa',
    'Versa Note',
    'Xterra',
  ],
  'Oldsmobile': [
    'Achieva',
    'Alero',
    'Aurora',
    'Bravada',
    'Custom Cruiser',
    'Cutlass',
    'Cutlass Calais',
    'Cutlass Ciera',
    'Cutlass Supreme',
    'Cutlass Cruiser',
    'Eighty-Eight',
    'Intrigue',
    'LSS',
    'Ninety-Eight',
    'Regency',
    'Silhouette',
    'Toronado',
  ],
  'Pagani': [
    'Huayra',
    'Huayra BC',
    'Huayra Roadster',
    'Zonda',
  ],
  'Panoz': [
    'AIV Roadster',
    'Esperante',
    'Roadster',
  ],
  'Peugeot': [
    '505',
  ],
  'Plymouth': [
    'Acclaim',
    'Breeze',
    'Colt',
    'Grand Voyager',
    'Laser',
    'Neon',
    'Prowler',
    'Sundance',
    'Voyager',
  ],
  'Polestar': [
    'Polestar 1',
    'Polestar 2',
  ],
  'Pontiac': [
    '6000',
    'Aztec',
    'Bonneville',
    'Firebird',
    'G3',
    'G5',
    'G6',
    'G8',
    'Grand Am',
    'Grand Prix',
    'GTO',
    'LeMans',
    'Montana',
    'Montana SV6',
    'Solstice',
    'Sunbird',
    'Sunfire',
    'T1000',
    'Torrent',
    'Trans Sport',
    'Vibe',
  ],
  'Porsche': [
    '718 Boxster',
    '718 Cayman',
    '718 Spyder',
    '911',
    '918 Spyder',
    '928',
    '944',
    '968',
    'Boxster',
    'Carrera GT',
    'Cayenne',
    'Cayenne E-Hybrid',
    'Cayenne E-Hybrid Coupe',
    'Cayenne Hybrid',
    'Macan',
    'Panamera',
    'Panamera E-Hybrid',
    'Panamera E-Hybrid Sport Turismo',
    'Panamera Hybrid',
    'Panamera Sport Turismo',
    'Taycan',
  ],
  'Qvale': [
    'Mangusta',
  ],
  'RAM': [
    '1500',
    '1500 Classic',
    '2500',
    '3500',
    'Cargo',
    'ProMaster 1500',
    'ProMaster 2500',
    'ProMaster 2500 Window Van',
    'ProMaster 3500',
    'ProMaster 3500 Window Van',
    'ProMaster City',
  ],
  'Rolls-Royce': [
    'Silver Ghost',
    'Corniche',
    'Cullinan',
    'Dawn',
    'Ghost',
    'Park Ward',
    'Phantom',
    'Phantom Coupe',
    'Phantom DropHead Coupe',
    'Phantom VI',
    'Silver Dawn',
    'Silver Seraph',
    'Silver Spur',
    'Silver Spurt II',
    'Wraith',
  ],
  'Saab': [
    '9-2X',
    '9-3',
    '9-4X',
    '9-5',
    '9-7X',
    '900',
    '9000',
  ],
  'Saleen': [
    'S7',
  ],
  'Saturn': [
    'Astra',
    'Aura',
    'Aura Hybrid',
    'Ion',
    'L',
    'LS',
    'LW',
    'Outlook',
    'Relay',
    'SC',
    'Sky',
    'SL',
    'SW',
    'Vue',
    'Vue Hybrid',
  ],
  'Scion': [
    'FR-S',
    'iA',
    'iM',
    'iQ',
    'tC',
    'xA',
    'xB',
    'xD',
    '',
    '',
    '',
    '',
    '',
    '',
    '',
  ],
  'Smart': [
    'EQ for Two',
    'For Two',
    'For Two Electric Drive',
  ],
  'Spyker': [
    'C8 Aileron',
    'C8',
    'C8 Laviolette',
  ],
  'Sterling': [
    '827',
  ],
  'Subaru': [
    'Ascent',
    'B9 Tribeca',
    'Baja',
    'BRZ',
    'Crosstrek',
    'Crosstrek Hybrid',
    'Forester',
    'Impreza',
    'Impreza Outback',
    'Impreza WRX',
    'Impreza WRX STI',
    'Justy',
    'Legacy',
    'Loyale',
    'Outback',
    'STI S209',
    'SVX',
    'Tribeca',
    'WRX',
    'WRX STI',
    'XT',
    'XV Crosstrek',
    'XV Crosstrek Hybrid',
  ],
  'Suzuki': [
    'Aerio',
    'Equator',
    'Esteem',
    'Forenza',
    'Grand Vitara',
    'Kizasi',
    'Reno',
    'Samurai',
    'Sidekick',
    'Swift',
    'SX4',
    'Verona',
    'Vitara',
    'X-90',
    'XL7',
  ],
  'Tesla': [
    'Model 3',
    'Model S',
    'Model X',
    'Model Y',
    'Roadster',
  ],
  'Toyota': [
    '4Runner',
    '86',
    'Avalon',
    'Avalon Hybrid',
    'C-HR',
    'Camry',
    'Camry Hybrid',
    'Camry Solara',
    'Celica',
    'Corolla',
    'Corolla Hatchback',
    'Corolla Hybrid',
    'Corolla iM',
    'Cressida',
    'ECHO',
    'FJ Cruiser',
    'Highlander',
    'Highlander Hybrid',
    'Land Cruiser',
    'Matrix',
    'Mirai',
    'MR2',
    'Paseo',
    'Pick Up',
    'Previa',
    'Prius',
    'Prius C',
    'Prius Plug-in Hybrid',
    'Prius Prime',
    'Prius V',
    'RAV4',
    'RAV4 EV',
    'RAV4 Hybrid',
    'RAV4 Prime',
    'Sequoia',
    'Sienna',
    'Supra',
    'T100',
    'Tacoma',
    'Tercel',
    'Tundra',
    'Venza',
    'Yaris',
    'Yaris iA',
    'Yaris Sedan',
  ],
  'Volkswagen': [
    'Arteon',
    'Atlas',
    'Atlas Cross Sport',
    'Beetle',
    'Cabrio',
    'Cabriolet',
    'CC',
    'Corado',
    'e-Golf',
    'Eos',
    'Eurovan',
    'Fox',
    'GLI',
    'GOLF',
    'GOLF Alltrack',
    'GOLF GTI',
    'Golf R',
    'Golf SportWagen',
    'Passat',
    'Phaeton',
    'R32',
    'Rabbit',
    'Routan',
    'Tiguan',
    'Tiguan Limited',
    'Touareg',
    'Touareg Hybrid',
    'Touareg 2',
    'Van'
  ],
  'Volvo': [
    '240',
    '740',
    '850',
    '940',
    '960',
    'C30',
    'C70',
    'Coupe',
    'S40',
    'S60',
    'S60 Cross Country',
    'S60 Hybrid',
    'S60 Inscription',
    'S60 Recharge Plug-in Hybrid',
    'S70',
    'S80',
    'S90',
    'S90 Hybrid',
    'S90 Recharge Plug-in Hybrid',
    'V40',
    'V50',
    'V60',
    'V60 Hybrid',
    'V60 Cross Country',
    'V60 Recharge Plug-in Hybrid',
    'V70',
    'V90',
    'V90 Cross Country',
    'XC 40',
    'XC60',
    'XC 60 Hybrid',
    'XC 60 Recharge Plug-in Hybrid',
    'X 70',
    'X 90',
    'X 90 Hybrid',
    'X90 Plug-in Hybrid',
  ],
  'Yugo': ['Cabrio'],
};
