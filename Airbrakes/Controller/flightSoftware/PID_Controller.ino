#include <Servo.h>

const int servoPin = 8;
Servo airbrakeServo;

int altitudeThresholds[] = {1, 2, 3};  // Altitude thresholds (in descending order).
float decayRates[] = {1, 2, 3};  // Corresponding error decay rates.

const double Kp = 0.1; // Proportional gain
const double Ki = 0.01; // Integral gain
const double Kd = 0.001; // Derivative gain

// Variables for PID control
double setpoint = 0; // Desired velocity
double input = 0; // Current velocity
double output = 0; // Control signal

double integral = 0;
double prevInput = 0;

// Velocity lookup table (altitude, velocity)
double velocityTable[793][2] {{0, 263.321}, {2, 262.995}, {4, 262.669}, {6, 262.343}, {8, 
  262.017}, {10, 261.692}, {12, 261.367}, {14, 261.042}, {16, 
  260.717}, {18, 260.393}, {20, 260.069}, {22, 259.746}, {24, 
  259.422}, {26, 259.099}, {28, 258.776}, {30, 258.453}, {32, 
  258.131}, {34, 257.809}, {36, 257.487}, {38, 257.165}, {40, 
  256.844}, {42, 256.523}, {44, 256.202}, {46, 255.881}, {48, 
  255.561}, {50, 255.241}, {52, 254.921}, {54, 254.601}, {56, 
  254.282}, {58, 253.963}, {60, 253.644}, {62, 253.325}, {64, 
  253.007}, {66, 252.689}, {68, 252.371}, {70, 252.054}, {72, 
  251.736}, {74, 251.419}, {76, 251.102}, {78, 250.786}, {80, 
  250.47}, {82, 250.154}, {84, 249.838}, {86, 249.522}, {88, 
  249.207}, {90, 248.892}, {92, 248.577}, {94, 248.262}, {96, 
  247.948}, {98, 247.634}, {100, 247.32}, {102, 247.006}, {104, 
  246.693}, {106, 246.38}, {108, 246.067}, {110, 245.754}, {112, 
  245.442}, {114, 245.129}, {116, 244.817}, {118, 244.506}, {120, 
  244.194}, {122, 243.883}, {124, 243.572}, {126, 243.261}, {128, 
  242.951}, {130, 242.64}, {132, 242.33}, {134, 242.02}, {136, 
  241.711}, {138, 241.402}, {140, 241.092}, {142, 240.783}, {144, 
  240.475}, {146, 240.166}, {148, 239.858}, {150, 239.55}, {152, 
  239.242}, {154, 238.935}, {156, 238.628}, {158, 238.32}, {160, 
  238.014}, {162, 237.707}, {164, 237.401}, {166, 237.094}, {168, 
  236.788}, {170, 236.483}, {172, 236.177}, {174, 235.872}, {176, 
  235.567}, {178, 235.262}, {180, 234.957}, {182, 234.653}, {184, 
  234.349}, {186, 234.045}, {188, 233.741}, {190, 233.438}, {192, 
  233.134}, {194, 232.831}, {196, 232.528}, {198, 232.226}, {200, 
  231.923}, {202, 231.621}, {204, 231.319}, {206, 231.017}, {208, 
  230.716}, {210, 230.414}, {212, 230.113}, {214, 229.812}, {216, 
  229.512}, {218, 229.211}, {220, 228.911}, {222, 228.611}, {224, 
  228.311}, {226, 228.011}, {228, 227.712}, {230, 227.412}, {232, 
  227.113}, {234, 226.814}, {236, 226.516}, {238, 226.217}, {240, 
  225.919}, {242, 225.621}, {244, 225.323}, {246, 225.026}, {248, 
  224.728}, {250, 224.431}, {252, 224.134}, {254, 223.837}, {256, 
  223.541}, {258, 223.244}, {260, 222.948}, {262, 222.652}, {264, 
  222.356}, {266, 222.061}, {268, 221.765}, {270, 221.47}, {272, 
  221.175}, {274, 220.88}, {276, 220.586}, {278, 220.291}, {280, 
  219.997}, {282, 219.703}, {284, 219.409}, {286, 219.115}, {288, 
  218.822}, {290, 218.529}, {292, 218.236}, {294, 217.943}, {296, 
  217.65}, {298, 217.358}, {300, 217.065}, {302, 216.773}, {304, 
  216.481}, {306, 216.189}, {308, 215.898}, {310, 215.607}, {312, 
  215.315}, {314, 215.024}, {316, 214.734}, {318, 214.443}, {320, 
  214.152}, {322, 213.862}, {324, 213.572}, {326, 213.282}, {328, 
  212.992}, {330, 212.703}, {332, 212.414}, {334, 212.124}, {336, 
  211.835}, {338, 211.547}, {340, 211.258}, {342, 210.97}, {344, 
  210.681}, {346, 210.393}, {348, 210.105}, {350, 209.817}, {352, 
  209.53}, {354, 209.242}, {356, 208.955}, {358, 208.668}, {360, 
  208.381}, {362, 208.095}, {364, 207.808}, {366, 207.522}, {368, 
  207.235}, {370, 206.949}, {372, 206.664}, {374, 206.378}, {376, 
  206.092}, {378, 205.807}, {380, 205.522}, {382, 205.237}, {384, 
  204.952}, {386, 204.667}, {388, 204.383}, {390, 204.098}, {392, 
  203.814}, {394, 203.53}, {396, 203.246}, {398, 202.963}, {400, 
  202.679}, {402, 202.396}, {404, 202.113}, {406, 201.83}, {408, 
  201.547}, {410, 201.264}, {412, 200.981}, {414, 200.699}, {416, 
  200.417}, {418, 200.135}, {420, 199.853}, {422, 199.571}, {424, 
  199.289}, {426, 199.008}, {428, 198.726}, {430, 198.445}, {432, 
  198.164}, {434, 197.883}, {436, 197.603}, {438, 197.322}, {440, 
  197.042}, {442, 196.761}, {444, 196.481}, {446, 196.201}, {448, 
  195.922}, {450, 195.642}, {452, 195.362}, {454, 195.083}, {456, 
  194.804}, {458, 194.525}, {460, 194.246}, {462, 193.967}, {464, 
  193.688}, {466, 193.41}, {468, 193.131}, {470, 192.853}, {472, 
  192.575}, {474, 192.297}, {476, 192.019}, {478, 191.742}, {480, 
  191.464}, {482, 191.187}, {484, 190.91}, {486, 190.633}, {488, 
  190.356}, {490, 190.079}, {492, 189.802}, {494, 189.526}, {496, 
  189.249}, {498, 188.973}, {500, 188.697}, {502, 188.421}, {504, 
  188.145}, {506, 187.869}, {508, 187.593}, {510, 187.318}, {512, 
  187.043}, {514, 186.767}, {516, 186.492}, {518, 186.217}, {520, 
  185.942}, {522, 185.668}, {524, 185.393}, {526, 185.119}, {528, 
  184.844}, {530, 184.57}, {532, 184.296}, {534, 184.022}, {536, 
  183.748}, {538, 183.474}, {540, 183.201}, {542, 182.927}, {544, 
  182.654}, {546, 182.381}, {548, 182.107}, {550, 181.834}, {552, 
  181.562}, {554, 181.289}, {556, 181.016}, {558, 180.744}, {560, 
  180.471}, {562, 180.199}, {564, 179.927}, {566, 179.654}, {568, 
  179.383}, {570, 179.111}, {572, 178.839}, {574, 178.567}, {576, 
  178.296}, {578, 178.024}, {580, 177.753}, {582, 177.482}, {584, 
  177.211}, {586, 176.94}, {588, 176.669}, {590, 176.398}, {592, 
  176.127}, {594, 175.857}, {596, 175.586}, {598, 175.316}, {600, 
  175.046}, {602, 174.775}, {604, 174.505}, {606, 174.235}, {608, 
  173.966}, {610, 173.696}, {612, 173.426}, {614, 173.157}, {616, 
  172.887}, {618, 172.618}, {620, 172.348}, {622, 172.079}, {624, 
  171.81}, {626, 171.541}, {628, 171.272}, {630, 171.003}, {632, 
  170.735}, {634, 170.466}, {636, 170.198}, {638, 169.929}, {640, 
  169.661}, {642, 169.392}, {644, 169.124}, {646, 168.856}, {648, 
  168.588}, {650, 168.32}, {652, 168.052}, {654, 167.785}, {656, 
  167.517}, {658, 167.249}, {660, 166.982}, {662, 166.714}, {664, 
  166.447}, {666, 166.18}, {668, 165.912}, {670, 165.645}, {672, 
  165.378}, {674, 165.111}, {676, 164.844}, {678, 164.578}, {680, 
  164.311}, {682, 164.044}, {684, 163.778}, {686, 163.511}, {688, 
  163.245}, {690, 162.978}, {692, 162.712}, {694, 162.446}, {696, 
  162.18}, {698, 161.913}, {700, 161.647}, {702, 161.381}, {704, 
  161.116}, {706, 160.85}, {708, 160.584}, {710, 160.318}, {712, 
  160.053}, {714, 159.787}, {716, 159.521}, {718, 159.256}, {720, 
  158.991}, {722, 158.725}, {724, 158.46}, {726, 158.195}, {728, 
  157.929}, {730, 157.664}, {732, 157.399}, {734, 157.134}, {736, 
  156.869}, {738, 156.604}, {740, 156.339}, {742, 156.075}, {744, 
  155.81}, {746, 155.545}, {748, 155.281}, {750, 155.016}, {752, 
  154.751}, {754, 154.487}, {756, 154.222}, {758, 153.958}, {760, 
  153.693}, {762, 153.429}, {764, 153.165}, {766, 152.901}, {768, 
  152.636}, {770, 152.372}, {772, 152.108}, {774, 151.844}, {776, 
  151.58}, {778, 151.316}, {780, 151.052}, {782, 150.788}, {784, 
  150.524}, {786, 150.26}, {788, 149.996}, {790, 149.732}, {792, 
  149.468}, {794, 149.204}, {796, 148.941}, {798, 148.677}, {800, 
  148.413}, {802, 148.149}, {804, 147.886}, {806, 147.622}, {808, 
  147.358}, {810, 147.095}, {812, 146.831}, {814, 146.568}, {816, 
  146.304}, {818, 146.04}, {820, 145.777}, {822, 145.513}, {824, 
  145.25}, {826, 144.986}, {828, 144.723}, {830, 144.459}, {832, 
  144.196}, {834, 143.933}, {836, 143.669}, {838, 143.406}, {840, 
  143.142}, {842, 142.879}, {844, 142.615}, {846, 142.352}, {848, 
  142.089}, {850, 141.825}, {852, 141.562}, {854, 141.298}, {856, 
  141.035}, {858, 140.771}, {860, 140.508}, {862, 140.245}, {864, 
  139.981}, {866, 139.718}, {868, 139.454}, {870, 139.191}, {872, 
  138.927}, {874, 138.664}, {876, 138.4}, {878, 138.137}, {880, 
  137.873}, {882, 137.61}, {884, 137.346}, {886, 137.083}, {888, 
  136.819}, {890, 136.555}, {892, 136.292}, {894, 136.028}, {896, 
  135.764}, {898, 135.501}, {900, 135.237}, {902, 134.973}, {904, 
  134.709}, {906, 134.445}, {908, 134.181}, {910, 133.917}, {912, 
  133.654}, {914, 133.39}, {916, 133.126}, {918, 132.861}, {920, 
  132.597}, {922, 132.333}, {924, 132.069}, {926, 131.805}, {928, 
  131.541}, {930, 131.276}, {932, 131.012}, {934, 130.747}, {936, 
  130.483}, {938, 130.218}, {940, 129.954}, {942, 129.689}, {944, 
  129.425}, {946, 129.16}, {948, 128.895}, {950, 128.63}, {952, 
  128.365}, {954, 128.1}, {956, 127.835}, {958, 127.57}, {960, 
  127.305}, {962, 127.04}, {964, 126.774}, {966, 126.509}, {968, 
  126.244}, {970, 125.978}, {972, 125.712}, {974, 125.447}, {976, 
  125.181}, {978, 124.915}, {980, 124.649}, {982, 124.383}, {984, 
  124.117}, {986, 123.851}, {988, 123.585}, {990, 123.318}, {992, 
  123.052}, {994, 122.785}, {996, 122.519}, {998, 122.252}, {1000, 
  121.985}, {1002, 121.718}, {1004, 121.451}, {1006, 121.184}, {1008, 
  120.917}, {1010, 120.649}, {1012, 120.382}, {1014, 120.114}, {1016, 
  119.847}, {1018, 119.579}, {1020, 119.311}, {1022, 119.043}, {1024, 
  118.775}, {1026, 118.507}, {1028, 118.238}, {1030, 117.97}, {1032, 
  117.701}, {1034, 117.432}, {1036, 117.163}, {1038, 116.894}, {1040, 
  116.625}, {1042, 116.356}, {1044, 116.087}, {1046, 115.817}, {1048, 
  115.547}, {1050, 115.277}, {1052, 115.007}, {1054, 114.737}, {1056, 
  114.467}, {1058, 114.197}, {1060, 113.926}, {1062, 113.655}, {1064, 
  113.384}, {1066, 113.113}, {1068, 112.842}, {1070, 112.571}, {1072, 
  112.299}, {1074, 112.027}, {1076, 111.755}, {1078, 111.483}, {1080, 
  111.211}, {1082, 110.939}, {1084, 110.666}, {1086, 110.393}, {1088, 
  110.12}, {1090, 109.847}, {1092, 109.574}, {1094, 109.3}, {1096, 
  109.026}, {1098, 108.752}, {1100, 108.478}, {1102, 108.204}, {1104, 
  107.929}, {1106, 107.654}, {1108, 107.379}, {1110, 107.104}, {1112, 
  106.829}, {1114, 106.553}, {1116, 106.277}, {1118, 106.001}, {1120, 
  105.725}, {1122, 105.448}, {1124, 105.172}, {1126, 104.895}, {1128, 
  104.617}, {1130, 104.34}, {1132, 104.062}, {1134, 103.784}, {1136, 
  103.506}, {1138, 103.227}, {1140, 102.949}, {1142, 102.67}, {1144, 
  102.39}, {1146, 102.111}, {1148, 101.831}, {1150, 101.551}, {1152, 
  101.271}, {1154, 100.99}, {1156, 100.709}, {1158, 100.428}, {1160, 
  100.146}, {1162, 99.8645}, {1164, 99.5824}, {1166, 99.3}, {1168, 
  99.0173}, {1170, 98.7343}, {1172, 98.451}, {1174, 98.1674}, {1176, 
  97.8835}, {1178, 97.5992}, {1180, 97.3146}, {1182, 97.0297}, {1184, 
  96.7444}, {1186, 96.4588}, {1188, 96.1729}, {1190, 95.8866}, {1192, 
  95.6}, {1194, 95.313}, {1196, 95.0256}, {1198, 94.7379}, {1200, 
  94.4498}, {1202, 94.1614}, {1204, 93.8725}, {1206, 93.5833}, {1208, 
  93.2937}, {1210, 93.0037}, {1212, 92.7133}, {1214, 92.4225}, {1216, 
  92.1314}, {1218, 91.8397}, {1220, 91.5477}, {1222, 91.2553}, {1224, 
  90.9624}, {1226, 90.6691}, {1228, 90.3754}, {1230, 90.0812}, {1232, 
  89.7866}, {1234, 89.4915}, {1236, 89.196}, {1238, 88.9}, {1240, 
  88.6035}, {1242, 88.3066}, {1244, 88.0092}, {1246, 87.7113}, {1248, 
  87.4129}, {1250, 87.114}, {1252, 86.8146}, {1254, 86.5146}, {1256, 
  86.2142}, {1258, 85.9133}, {1260, 85.6118}, {1262, 85.3097}, {1264, 
  85.0072}, {1266, 84.704}, {1268, 84.4004}, {1270, 84.0961}, {1272, 
  83.7913}, {1274, 83.4859}, {1276, 83.1799}, {1278, 82.8733}, {1280, 
  82.5661}, {1282, 82.2583}, {1284, 81.9499}, {1286, 81.6408}, {1288, 
  81.3312}, {1290, 81.0208}, {1292, 80.7098}, {1294, 80.3982}, {1296, 
  80.0859}, {1298, 79.7729}, {1300, 79.4592}, {1302, 79.1448}, {1304, 
  78.8297}, {1306, 78.5139}, {1308, 78.1974}, {1310, 77.8802}, {1312, 
  77.5621}, {1314, 77.2434}, {1316, 76.9238}, {1318, 76.6035}, {1320, 
  76.2824}, {1322, 75.9605}, {1324, 75.6378}, {1326, 75.3142}, {1328, 
  74.9899}, {1330, 74.6646}, {1332, 74.3386}, {1334, 74.0116}, {1336, 
  73.6838}, {1338, 73.355}, {1340, 73.0254}, {1342, 72.6948}, {1344, 
  72.3633}, {1346, 72.0308}, {1348, 71.6974}, {1350, 71.3629}, {1352, 
  71.0275}, {1354, 70.6911}, {1356, 70.3536}, {1358, 70.0151}, {1360, 
  69.6756}, {1362, 69.3349}, {1364, 68.9932}, {1366, 68.6504}, {1368, 
  68.3064}, {1370, 67.9613}, {1372, 67.615}, {1374, 67.2675}, {1376, 
  66.9188}, {1378, 66.5689}, {1380, 66.2177}, {1382, 65.8653}, {1384, 
  65.5116}, {1386, 65.1565}, {1388, 64.8002}, {1390, 64.4424}, {1392, 
  64.0833}, {1394, 63.7228}, {1396, 63.3609}, {1398, 62.9975}, {1400, 
  62.6326}, {1402, 62.2661}, {1404, 61.8982}, {1406, 61.5287}, {1408, 
  61.1576}, {1410, 60.7848}, {1412, 60.4104}, {1414, 60.0343}, {1416, 
  59.6565}, {1418, 59.2769}, {1420, 58.8955}, {1422, 58.5122}, {1424, 
  58.1272}, {1426, 57.7401}, {1428, 57.3512}, {1430, 56.9602}, {1432, 
  56.5672}, {1434, 56.1722}, {1436, 55.775}, {1438, 55.3756}, {1440, 
  54.9741}, {1442, 54.5702}, {1444, 54.164}, {1446, 53.7555}, {1448, 
  53.3445}, {1450, 52.9311}, {1452, 52.515}, {1454, 52.0964}, {1456, 
  51.6751}, {1458, 51.251}, {1460, 50.8242}, {1462, 50.3944}, {1464, 
  49.9617}, {1466, 49.5259}, {1468, 49.087}, {1470, 48.6449}, {1472, 
  48.1995}, {1474, 47.7506}, {1476, 47.2983}, {1478, 46.8424}, {1480, 
  46.3828}, {1482, 45.9194}, {1484, 45.452}, {1486, 44.9806}, {1488, 
  44.505}, {1490, 44.025}, {1492, 43.5406}, {1494, 43.0515}, {1496, 
  42.5577}, {1498, 42.0589}, {1500, 41.5549}, {1502, 41.0457}, {1504, 
  40.5309}, {1506, 40.0103}, {1508, 39.4838}, {1510, 38.951}, {1512, 
  38.4118}, {1514, 37.8658}, {1516, 37.3127}, {1518, 36.7523}, {1520, 
  36.1841}, {1522, 35.6079}, {1524, 35.0231}, {1526, 34.4294}, {1528, 
  33.8263}, {1530, 33.2133}, {1532, 32.5898}, {1534, 31.9552}, {1536, 
  31.3088}, {1538, 30.6499}, {1540, 29.9777}, {1542, 29.2911}, {1544, 
  28.5893}, {1546, 27.871}, {1548, 27.135}, {1550, 26.3796}, {1552, 
  25.6033}, {1554, 24.8041}, {1556, 23.9796}, {1558, 23.1272}, {1560, 
  22.2437}, {1562, 21.3251}, {1564, 20.3667}, {1566, 19.3626}, {1568, 
  18.3054}, {1570, 17.1851}, {1572, 15.9886}, {1574, 14.6972}, {1576, 
  13.2832}, {1578, 11.7024}, {1580, 9.87491}, {1582, 7.62535}, {1584, 
  4.34081}};

double getAltitude() {

    return 0.0;
}

// Function to get velocity data
double getVelocity() {

    return 0.0;
}

// Function to get the desired velocity from the lookup table
double getDesiredVelocity(double altitude) {
  int altIndex = int(altitude/2);
  if(altIndex % 2 != 0 ){ //ensure that the altitude index is even so we can index into VLT
    altIndex -= 1; //round to next lowest even (current assumption is that rounding up/down doesn't really matter due to scale) 
  }

  //return the desired velocity table at current altitude
  return velocityTable[altIndex][1];
}

// PID control function
void control() {
    // Read altitude, IMU, and velocity data
    double altitude = getAltitude();
    double velocity = getVelocity();
    
    // Calculate the current velocity (you may need to calibrate this)
    input = velocity;

    // Calculate the desired velocity from the lookup table
    setpoint = getDesiredVelocity(altitude);

    // Calculate the error
    double error = setpoint - input;

    // Calculate the PID terms
    integral += error;
    double derivative = error - prevInput;
    
    double errorDecay = errorDecayFunc(altitude, altitudeThresholds, decayRates);

    double integral_error = (error - errorDecay) + (error - errorDecay) ;

    // Calculate the control signal
    output = Kp * error + Ki * integral + Kd * derivative;
    
    
    airbrakeServo.write(output * 120);// curently I just write the output directly to the servo but is there a better way to do thus
    prevInput = input;
}

float errorDecayFunc(int altitude, int thresholds[], float decayRates[]) {
  if (altitude >= thresholds[0]) {
    return decayRates[0];
  } else if (altitude >= thresholds[1]) {
    return decayRates[1];
  } else if (altitude >= thresholds[2]) {
    return decayRates[2];
  } else {
    return 1.0;  // Full error impact below the lowest threshold.
  }
}


void setup() {
    airbrakeServo.attach(servoPin);
}

void loop() {
    control();
    
    // Add a delay to control the update rate
    delay(100);
}