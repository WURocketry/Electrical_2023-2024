#include <Arduino.h>
#include <simulation.h>

// OpenRocket simulation data table
double simData[733][3] = {{30.0,0.0,0.0},{30.01, 0.003, 68.886}, {30.02, 0.02, 191.528}, {30.03, 0.057, 
215.108}, {30.04, 0.115, 212.879}, {30.05, 0.194, 203.82}, {30.06, 
0.293, 199.061}, {30.07, 0.412, 195.011}, {30.08, 0.55, 
190.952}, {30.09, 0.707, 188.077}, {30.1, 0.883, 186.95}, {30.11, 
1.077, 185.833}, {30.12, 1.29, 184.712}, {30.13, 1.521, 
183.588}, {30.14, 1.771, 182.459}, {30.15, 2.039, 181.327}, {30.16, 
2.325, 180.413}, {30.17, 2.629, 179.826}, {30.18, 2.951, 
179.24}, {30.19, 3.29, 178.65}, {30.2, 3.648, 178.058}, {30.21, 
4.023, 177.677}, {30.225, 4.618, 177.623}, {30.247, 5.585, 
177.536}, {30.281, 7.203, 177.388}, {30.331, 9.976, 
177.119}, {30.381, 13.19, 176.648}, {30.431, 16.845, 
176.019}, {30.481, 20.938, 175.012}, {30.531, 25.467, 
173.916}, {30.581, 30.429, 172.756}, {30.631, 35.821, 
171.451}, {30.681, 41.639, 169.783}, {30.731, 47.88, 
168.01}, {30.781, 54.539, 166.167}, {30.831, 61.61, 
164.197}, {30.881, 69.09, 161.98}, {30.931, 76.972, 
159.662}, {30.981, 85.251, 157.271}, {31.031, 93.92, 
154.662}, {31.081, 102.972, 151.504}, {31.131, 112.4, 
148.214}, {31.181, 122.195, 144.848}, {31.231, 132.349, 
141.386}, {31.281, 142.853, 137.817}, {31.331, 153.699, 
134.622}, {31.381, 164.88, 132.646}, {31.431, 176.384, 
125.114}, {31.481, 188.152, 84.612}, {31.531, 200.073, 
37.964}, {31.581, 212.06, 14.042}, {31.631, 
224.059, -4.89}, {31.681, 236.02, -24.364}, {31.688, 
237.668, -33.291}, {31.698, 240.138, -34.265}, {31.714, 
243.835, -34.115}, {31.737, 249.364, -33.894}, {31.772, 
257.625, -33.569}, {31.822, 269.359, -33.114}, {31.872, 
281.011, -32.673}, {31.922, 292.581, -32.243}, {31.972, 
304.071, -31.825}, {32.022, 315.481, -31.418}, {32.072, 
326.812, -31.022}, {32.122, 338.066, -30.636}, {32.172, 
349.243, -30.26}, {32.222, 360.344, -29.894}, {32.272, 
371.371, -29.538}, {32.322, 382.324, -29.193}, {32.372, 
393.204, -28.857}, {32.422, 404.012, -28.528}, {32.472, 
414.749, -28.208}, {32.522, 425.415, -27.894}, {32.572, 
436.011, -27.589}, {32.622, 446.538, -27.29}, {32.672, 
456.997, -26.998}, {32.722, 467.389, -26.712}, {32.772, 
477.714, -26.433}, {32.822, 487.972, -26.16}, {32.872, 
498.166, -25.893}, {32.922, 508.294, -25.634}, {32.972, 
518.359, -25.382}, {33.022, 528.36, -25.135}, {33.072, 
538.298, -24.893}, {33.122, 548.174, -24.656}, {33.172, 
557.988, -24.424}, {33.222, 567.741, -24.196}, {33.272, 
577.434, -23.973}, {33.322, 587.067, -23.754}, {33.372, 
596.64, -23.54}, {33.422, 606.155, -23.33}, {33.472, 
615.611, -23.124}, {33.522, 625.01, -22.922}, {33.572, 
634.351, -22.724}, {33.622, 643.635, -22.53}, {33.672, 
652.863, -22.341}, {33.722, 662.035, -22.156}, {33.772, 
671.152, -21.973}, {33.822, 680.214, -21.795}, {33.872, 
689.221, -21.619}, {33.922, 698.175, -21.446}, {33.972, 
707.074, -21.277}, {34.022, 715.921, -21.11}, {34.072, 
724.715, -20.947}, {34.122, 733.456, -20.786}, {34.172, 
742.145, -20.628}, {34.222, 750.783, -20.473}, {34.272, 
759.37, -20.32}, {34.322, 767.906, -20.17}, {34.372, 
776.391, -20.022}, {34.422, 784.826, -19.878}, {34.472, 
793.212, -19.736}, {34.522, 801.548, -19.597}, {34.572, 
809.836, -19.46}, {34.622, 818.074, -19.326}, {34.672, 
826.265, -19.193}, {34.722, 834.407, -19.063}, {34.772, 
842.502, -18.934}, {34.822, 850.549, -18.808}, {34.872, 
858.549, -18.684}, {34.922, 866.503, -18.561}, {34.972, 
874.41, -18.441}, {35.022, 882.271, -18.322}, {35.072, 
890.087, -18.205}, {35.122, 897.857, -18.09}, {35.172, 
905.581, -17.977}, {35.222, 913.261, -17.865}, {35.272, 
920.896, -17.756}, {35.322, 928.486, -17.647}, {35.372, 
936.033, -17.542}, {35.422, 943.535, -17.437}, {35.472, 
950.994, -17.334}, {35.522, 958.41, -17.233}, {35.572, 
965.783, -17.133}, {35.622, 973.113, -17.035}, {35.672, 
980.4, -16.938}, {35.722, 987.645, -16.842}, {35.772, 
994.847, -16.748}, {35.822, 1002.01, -16.655}, {35.872, 
1009.13, -16.563}, {35.922, 1016.21, -16.473}, {35.972, 
1023.24, -16.385}, {36.022, 1030.24, -16.297}, {36.072, 
1037.19, -16.211}, {36.122, 1044.11, -16.125}, {36.172, 
1050.98, -16.041}, {36.222, 1057.82, -15.958}, {36.272, 
1064.61, -15.876}, {36.322, 1071.36, -15.796}, {36.372, 
1078.08, -15.716}, {36.422, 1084.75, -15.638}, {36.472, 
1091.39, -15.561}, {36.522, 1097.99, -15.485}, {36.572, 
1104.55, -15.41}, {36.622, 1111.07, -15.336}, {36.672, 
1117.55, -15.263}, {36.722, 1123.99, -15.191}, {36.772, 
1130.4, -15.12}, {36.822, 1136.77, -15.049}, {36.872, 
1143.1, -14.98}, {36.922, 1149.39, -14.911}, {36.972, 
1155.65, -14.844}, {37.022, 1161.87, -14.777}, {37.072, 
1168.05, -14.711}, {37.122, 1174.19, -14.646}, {37.172, 
1180.3, -14.581}, {37.222, 1186.37, -14.518}, {37.272, 
1192.41, -14.455}, {37.322, 1198.41, -14.393}, {37.372, 
1204.37, -14.332}, {37.422, 1210.3, -14.272}, {37.472, 
1216.19, -14.212}, {37.522, 1222.05, -14.153}, {37.572, 
1227.87, -14.095}, {37.622, 1233.65, -14.038}, {37.672, 
1239.4, -13.982}, {37.722, 1245.12, -13.926}, {37.772, 
1250.8, -13.871}, {37.822, 1256.45, -13.816}, {37.872, 
1262.06, -13.762}, {37.922, 1267.64, -13.709}, {37.972, 
1273.18, -13.656}, {38.022, 1278.69, -13.604}, {38.072, 
1284.16, -13.553}, {38.122, 1289.6, -13.502}, {38.172, 
1295.01, -13.452}, {38.222, 1300.39, -13.403}, {38.272, 
1305.73, -13.354}, {38.322, 1311.03, -13.305}, {38.372, 
1316.31, -13.258}, {38.422, 1321.55, -13.21}, {38.472, 
1326.75, -13.164}, {38.522, 1331.93, -13.117}, {38.572, 
1337.07, -13.072}, {38.622, 1342.18, -13.027}, {38.672, 
1347.25, -12.982}, {38.722, 1352.3, -12.938}, {38.772, 
1357.31, -12.895}, {38.822, 1362.29, -12.852}, {38.872, 
1367.24, -12.809}, {38.922, 1372.15, -12.767}, {38.972, 
1377.03, -12.726}, {39.022, 1381.89, -12.685}, {39.072, 
1386.71, -12.645}, {39.122, 1391.49, -12.605}, {39.172, 
1396.25, -12.565}, {39.222, 1400.98, -12.526}, {39.272, 
1405.67, -12.487}, {39.322, 1410.33, -12.449}, {39.372, 
1414.96, -12.411}, {39.422, 1419.56, -12.374}, {39.472, 
1424.13, -12.337}, {39.522, 1428.67, -12.3}, {39.572, 
1433.18, -12.264}, {39.622, 1437.66, -12.228}, {39.672, 
1442.1, -12.193}, {39.722, 1446.52, -12.158}, {39.772, 
1450.91, -12.124}, {39.822, 1455.26, -12.089}, {39.872, 
1459.59, -12.056}, {39.922, 1463.88, -12.022}, {39.972, 
1468.15, -11.989}, {40.022, 1472.38, -11.957}, {40.072, 
1476.59, -11.924}, {40.122, 1480.76, -11.893}, {40.172, 
1484.91, -11.861}, {40.222, 1489.02, -11.83}, {40.272, 
1493.11, -11.799}, {40.322, 1497.17, -11.769}, {40.372, 
1501.2, -11.739}, {40.422, 1505.19, -11.709}, {40.472, 
1509.16, -11.68}, {40.522, 1513.1, -11.651}, {40.572, 
1517.01, -11.622}, {40.622, 1520.9, -11.593}, {40.672, 
1524.75, -11.565}, {40.722, 1528.57, -11.538}, {40.772, 
1532.37, -11.51}, {40.822, 1536.13, -11.483}, {40.872, 
1539.87, -11.456}, {40.922, 1543.58, -11.43}, {40.972, 
1547.26, -11.403}, {41.022, 1550.91, -11.377}, {41.072, 
1554.53, -11.352}, {41.122, 1558.13, -11.326}, {41.172, 
1561.69, -11.301}, {41.222, 1565.23, -11.277}, {41.272, 
1568.74, -11.252}, {41.322, 1572.22, -11.228}, {41.372, 
1575.68, -11.204}, {41.422, 1579.1, -11.18}, {41.472, 
1582.5, -11.157}, {41.522, 1585.87, -11.134}, {41.572, 
1589.21, -11.111}, {41.622, 1592.53, -11.088}, {41.672, 
1595.82, -11.066}, {41.722, 1599.07, -11.044}, {41.772, 
1602.31, -11.022}, {41.822, 1605.51, -11}, {41.872, 
1608.69, -10.979}, {41.922, 1611.83, -10.958}, {41.972, 
1614.96, -10.937}, {42.022, 1618.05, -10.917}, {42.072, 
1621.12, -10.896}, {42.122, 1624.16, -10.876}, {42.172, 
1627.17, -10.856}, {42.222, 1630.15, -10.837}, {42.272, 
1633.11, -10.817}, {42.322, 1636.04, -10.798}, {42.372, 
1638.95, -10.779}, {42.422, 1641.82, -10.76}, {42.472, 
1644.68, -10.742}, {42.522, 1647.5, -10.724}, {42.572, 
1650.3, -10.706}, {42.622, 1653.07, -10.688}, {42.672, 
1655.81, -10.67}, {42.722, 1658.52, -10.653}, {42.772, 
1661.21, -10.636}, {42.822, 1663.88, -10.619}, {42.872, 
1666.51, -10.602}, {42.922, 1669.12, -10.585}, {42.972, 
1671.71, -10.569}, {43.022, 1674.27, -10.553}, {43.072, 
1676.8, -10.537}, {43.122, 1679.3, -10.521}, {43.172, 
1681.78, -10.506}, {43.222, 1684.23, -10.49}, {43.272, 
1686.66, -10.475}, {43.322, 1689.06, -10.46}, {43.372, 
1691.43, -10.446}, {43.422, 1693.78, -10.431}, {43.472, 
1696.1, -10.417}, {43.522, 1698.39, -10.403}, {43.572, 
1700.66, -10.389}, {43.622, 1702.91, -10.375}, {43.672, 
1705.12, -10.361}, {43.722, 1707.32, -10.348}, {43.772, 
1709.48, -10.335}, {43.822, 1711.62, -10.322}, {43.872, 
1713.73, -10.309}, {43.922, 1715.82, -10.296}, {43.972, 
1717.88, -10.284}, {44.022, 1719.92, -10.271}, {44.072, 
1721.93, -10.259}, {44.122, 1723.92, -10.247}, {44.172, 
1725.88, -10.235}, {44.222, 1727.81, -10.224}, {44.272, 
1729.72, -10.212}, {44.322, 1731.6, -10.201}, {44.372, 
1733.46, -10.19}, {44.422, 1735.29, -10.179}, {44.472, 
1737.1, -10.168}, {44.522, 1738.88, -10.158}, {44.572, 
1740.64, -10.147}, {44.622, 1742.37, -10.137}, {44.672, 
1744.07, -10.127}, {44.722, 1745.75, -10.117}, {44.772, 
1747.41, -10.107}, {44.822, 1749.04, -10.098}, {44.872, 
1750.64, -10.089}, {44.922, 1752.22, -10.079}, {44.972, 
1753.77, -10.07}, {45.022, 1755.3, -10.061}, {45.072, 
1756.8, -10.052}, {45.122, 1758.28, -10.044}, {45.172, 
1759.73, -10.035}, {45.222, 1761.16, -10.027}, {45.272, 
1762.57, -10.019}, {45.322, 1763.94, -10.011}, {45.372, 
1765.3, -10.003}, {45.422, 1766.62, -9.995}, {45.472, 
1767.93, -9.988}, {45.522, 1769.2, -9.981}, {45.572, 
1770.46, -9.973}, {45.622, 1771.68, -9.966}, {45.672, 
1772.89, -9.959}, {45.688, 1773.26, -9.957}, {45.712, 
1773.82, -9.954}, {45.747, 1774.64, -9.949}, {45.797, 
1775.79, -9.943}, {45.847, 1776.9, -9.936}, {45.897, 
1777.99, -9.93}, {45.947, 1779.06, -9.924}, {45.997, 
1780.1, -9.918}, {46.047, 1781.12, -9.912}, {46.097, 
1782.11, -9.907}, {46.147, 1783.08, -9.901}, {46.197, 
1784.02, -9.896}, {46.247, 1784.94, -9.89}, {46.297, 
1785.83, -9.885}, {46.347, 1786.7, -9.88}, {46.397, 
1787.54, -9.876}, {46.447, 1788.36, -9.871}, {46.497, 
1789.15, -9.866}, {46.547, 1789.92, -9.862}, {46.597, 
1790.67, -9.858}, {46.647, 1791.39, -9.854}, {46.697, 
1792.08, -9.85}, {46.747, 1792.75, -9.846}, {46.797, 
1793.4, -9.843}, {46.847, 1794.02, -9.84}, {46.897, 
1794.62, -9.836}, {46.947, 1795.19, -9.833}, {46.997, 
1795.74, -9.83}, {47.047, 1796.26, -9.828}, {47.097, 
1796.76, -9.825}, {47.147, 1797.24, -9.822}, {47.197, 
1797.69, -9.82}, {47.247, 1798.11, -9.817}, {47.297, 
1798.51, -9.815}, {47.347, 1798.89, -9.813}, {47.397, 
1799.24, -9.811}, {47.447, 1799.57, -9.809}, {47.497, 
1799.87, -9.807}, {47.547, 1800.15, -9.806}, {47.597, 
1800.4, -9.804}, {47.647, 1800.63, -9.803}, {47.697, 
1800.83, -9.802}, {47.747, 1801.01, -9.8}, {47.797, 
1801.17, -9.799}, {47.847, 1801.3, -9.799}, {47.897, 
1801.4, -9.798}, {47.947, 1801.49, -9.797}, {47.997, 
1801.54, -9.797}, {48.047, 1801.58, -9.797}, {48.097, 
1801.59, -9.796}, {48.147, 1801.57, -9.796}, {48.152, 
1801.57, -9.793}, {48.652, 1800.03, -9.793}, {49.152, 
1796.09, -9.514}, {49.652, 1789.85, -8.815}, {50.14, 
1781.76, -7.791}, {50.555, 1773.52, -6.614}, {50.963, 
1764.41, -5.596}, {51.389, 1753.97, -4.64}, {51.857, 
1741.63, -3.729}, {52.357, 1727.66, -2.861}, {52.857, 
1713.07, -2.103}, {53.357, 1698.03, -1.516}, {53.857, 
1682.66, -1.075}, {54.357, 1667.06, -0.751}, {54.857, 
1651.31, -0.516}, {55.357, 1635.44, -0.348}, {55.857, 
1619.51, -0.229}, {56.357, 1603.53, -0.145}, {56.857, 
1587.52, -0.086}, {57.357, 1571.49, -0.045}, {57.857, 
1555.46, -0.016}, {58.357, 1539.42, 0.004}, {58.857, 1523.39, 
0.018}, {59.357, 1507.36, 0.028}, {59.857, 1491.34, 0.034}, {60.357,
1475.33, 0.039}, {60.857, 1459.33, 0.043}, {61.357, 1443.34, 
0.046}, {61.857, 1427.36, 0.048}, {62.357, 1411.4, 0.049}, {62.857, 
1395.44, 0.05}, {63.357, 1379.5, 0.05}, {63.857, 1363.58, 
0.05}, {64.357, 1347.66, 0.051}, {64.857, 1331.76, 0.051}, {65.357, 
1315.87, 0.051}, {65.857, 1299.99, 0.05}, {66.357, 1284.13, 
0.05}, {66.857, 1268.28, 0.05}, {67.357, 1252.44, 0.05}, {67.857, 
1236.61, 0.05}, {68.357, 1220.8, 0.05}, {68.857, 1204.99, 
0.049}, {69.357, 1189.2, 0.049}, {69.857, 1173.43, 0.049}, {70.357, 
1157.66, 0.049}, {70.857, 1141.91, 0.049}, {71.357, 1126.17, 
0.049}, {71.857, 1110.44, 0.048}, {72.357, 1094.72, 0.048}, {72.857,
1079.02, 0.048}, {73.357, 1063.33, 0.048}, {73.857, 1047.64, 
0.048}, {74.357, 1031.98, 0.047}, {74.857, 1016.32, 0.047}, {75.357,
1000.67, 0.047}, {75.857, 985.04, 0.047}, {76.357, 969.418, 
0.048}, {76.857, 953.809, 0.048}, {77.357, 938.211, 0.048}, {77.857,
922.626, 0.048}, {78.357, 907.052, 0.048}, {78.857, 891.491, 
0.048}, {79.357, 875.942, 0.048}, {79.857, 860.405, 0.048}, {80.357,
844.88, 0.048}, {80.857, 829.367, 0.048}, {81.357, 813.866, 
0.048}, {81.857, 798.377, 0.048}, {82.357, 782.9, 0.047}, {82.857, 
767.435, 0.047}, {83.357, 751.981, 0.047}, {83.857, 736.539, 
0.047}, {84.357, 721.109, 0.047}, {84.857, 705.691, 0.047}, {85.357,
690.284, 0.046}, {85.857, 674.889, 0.046}, {86.357, 659.505, 
0.046}, {86.857, 644.133, 0.046}, {87.357, 628.772, 0.046}, {87.857,
613.422, 0.046}, {88.357, 598.084, 0.045}, {88.857, 582.758, 
0.045}, {89.357, 567.442, 0.045}, {89.857, 552.138, 0.045}, {90.357,
536.845, 0.045}, {90.857, 521.563, 0.045}, {91.357, 506.293, 
0.044}, {91.857, 491.033, 0.044}, {92.357, 475.784, 0.045}, {92.857,
460.547, 0.045}, {93.357, 445.321, 0.045}, {93.857, 430.107, 
0.046}, {94.357, 414.903, 0.046}, {94.857, 399.712, 0.046}, {95.357,
384.531, 0.046}, {95.857, 369.362, 0.045}, {96.357, 354.204, 
0.045}, {96.857, 339.058, 0.045}, {97.357, 323.923, 0.045}, {97.857,
308.799, 0.045}, {98.357, 293.687, 0.045}, {98.857, 278.585, 
0.045}, {99.357, 263.495, 0.044}, {99.857, 248.416, 
0.044}, {100.357, 233.347, 0.044}, {100.857, 218.29, 
0.044}, {101.357, 203.244, 0.044}, {101.857, 188.209, 
0.044}, {102.357, 173.184, 0.043}, {102.857, 158.171, 
0.043}, {102.858, 158.128, 349.372}, {102.859, 158.099, 
337.506}, {102.86, 158.07, 329.609}, {102.861, 158.041, 
321.986}, {102.862, 158.013, 314.622}, {102.863, 157.985, 
307.506}, {102.864, 157.957, 300.627}, {102.865, 157.929, 
293.975}, {102.866, 157.902, 287.54}, {102.867, 157.875, 
281.313}, {102.868, 157.849, 275.284}, {102.869, 157.822, 
269.446}, {102.87, 157.796, 263.789}, {102.871, 157.771, 
258.308}, {102.872, 157.745, 252.994}, {102.873, 157.72, 
247.841}, {102.874, 157.695, 242.843}, {102.875, 157.67, 
237.992}, {102.876, 157.645, 233.285}, {102.877, 157.621, 
228.714}, {102.878, 157.597, 224.275}, {102.879, 157.573, 
219.962}, {102.88, 157.549, 215.772}, {102.881, 157.526, 
211.698}, {102.882, 157.503, 207.738}, {102.883, 157.479, 
203.886}, {102.884, 157.457, 200.14}, {102.885, 157.434, 
196.494}, {102.886, 157.412, 192.946}, {102.887, 157.389, 
189.492}, {102.888, 157.367, 186.128}, {102.889, 157.345, 
182.852}, {102.89, 157.324, 179.661}, {102.891, 157.302, 
176.552}, {102.892, 157.281, 173.521}, {102.893, 157.26, 
170.566}, {102.894, 157.238, 167.685}, {102.895, 157.218, 
164.876}, {102.896, 157.197, 162.135}, {102.897, 157.176, 
159.461}, {102.898, 157.156, 156.852}, {102.899, 157.136, 
154.305}, {102.9, 157.116, 151.818}, {102.901, 157.096, 
149.391}, {102.902, 157.076, 147.019}, {102.903, 157.057, 
144.703}, {102.904, 157.037, 142.441}, {102.905, 157.018, 
140.229}, {102.906, 156.999, 138.068}, {102.907, 156.979, 
135.956}, {102.908, 156.961, 133.891}, {102.909, 156.942, 
131.871}, {102.91, 156.923, 129.896}, {102.911, 156.905, 
127.965}, {102.912, 156.886, 126.075}, {102.913, 156.868, 
124.225}, {102.914, 156.85, 122.415}, {102.915, 156.832, 
120.644}, {102.916, 156.814, 118.91}, {102.917, 156.796, 
117.212}, {102.918, 156.778, 115.55}, {102.919, 156.761, 
113.921}, {102.92, 156.743, 112.327}, {102.921, 156.726, 
110.764}, {102.922, 156.709, 109.233}, {102.923, 156.692, 
107.733}, {102.924, 156.675, 106.263}, {102.925, 156.658, 
104.822}, {102.926, 156.641, 103.409}, {102.927, 156.624, 
102.024}, {102.928, 156.608, 100.666}, {102.929, 156.591, 
99.334}, {102.93, 156.575, 98.028}, {102.931, 156.559, 
96.746}, {102.932, 156.542, 95.489}, {102.933, 156.526, 
94.255}, {102.934, 156.51, 93.045}, {102.935, 156.494, 
91.857}, {102.936, 156.478, 90.691}, {102.937, 156.463, 
89.546}, {102.938, 156.447, 88.422}, {102.939, 156.431, 
87.319}, {102.94, 156.416, 86.235}, {102.941, 156.401, 
85.171}, {102.942, 156.385, 84.126}, {102.943, 156.37, 
83.099}, {102.944, 156.355, 82.091}, {102.945, 156.34, 
81.1}, {102.946, 156.324, 80.117}, {102.948, 156.309, 
79.135}, {102.949, 156.293, 78.152}, {102.95, 156.277, 
77.17}, {102.951, 156.261, 76.188}, {102.952, 156.245, 
75.207}, {102.953, 156.228, 74.225}, {102.954, 156.211, 
73.244}, {102.955, 156.194, 72.263}, {102.957, 156.177, 
71.282}, {102.958, 156.159, 70.302}, {102.959, 156.142, 
69.322}, {102.96, 156.124, 68.342}, {102.962, 156.105, 
67.362}, {102.963, 156.087, 66.382}, {102.964, 156.068, 
65.403}, {102.966, 156.049, 64.424}, {102.967, 156.03, 
63.446}, {102.969, 156.01, 62.468}, {102.97, 155.99, 
61.49}, {102.972, 155.97, 60.512}, {102.973, 155.949, 
59.535}, {102.975, 155.928, 58.558}, {102.977, 155.907, 
57.581}, {102.978, 155.886, 56.605}, {102.98, 155.864, 
55.629}, {102.982, 155.841, 54.654}, {102.984, 155.818, 
53.679}, {102.985, 155.795, 52.704}, {102.987, 155.772, 
51.73}, {102.989, 155.748, 50.756}, {102.991, 155.723, 
49.783}, {102.993, 155.698, 48.81}, {102.996, 155.673, 
47.838}, {102.998, 155.647, 46.866}, {103, 155.62, 
45.894}, {103.002, 155.593, 44.924}, {103.005, 155.565, 
43.953}, {103.007, 155.537, 42.984}, {103.01, 155.508, 
42.015}, {103.012, 155.479, 41.046}, {103.015, 155.448, 
40.079}, {103.018, 155.417, 39.112}, {103.021, 155.386, 
38.145}, {103.024, 155.353, 37.18}, {103.027, 155.32, 
36.215}, {103.03, 155.285, 35.251}, {103.033, 155.25, 
34.288}, {103.037, 155.214, 33.326}, {103.041, 155.177, 
32.365}, {103.044, 155.139, 31.405}, {103.048, 155.099, 
30.446}, {103.052, 155.058, 29.488}, {103.057, 155.016, 
28.531}, {103.061, 154.973, 27.575}, {103.066, 154.928, 
26.621}, {103.071, 154.882, 25.668}, {103.076, 154.834, 
24.717}, {103.082, 154.783, 23.767}, {103.088, 154.731, 
22.819}, {103.094, 154.677, 21.873}, {103.1, 154.621, 
20.928}, {103.107, 154.562, 19.986}, {103.114, 154.5, 
19.046}, {103.122, 154.435, 18.109}, {103.13, 154.367, 
17.174}, {103.139, 154.296, 16.242}, {103.149, 154.22, 
15.313}, {103.159, 154.14, 14.387}, {103.171, 154.054, 
13.465}, {103.183, 153.963, 12.548}, {103.197, 153.865, 
11.635}, {103.211, 153.76, 10.727}, {103.228, 153.645, 
9.825}, {103.246, 153.521, 8.93}, {103.267, 153.384, 
8.042}, {103.291, 153.232, 7.164}, {103.318, 153.061, 
6.296}, {103.35, 152.868, 5.44}, {103.387, 152.644, 4.6}, {103.433, 
152.379, 3.778}, {103.491, 152.057, 2.981}, {103.567, 151.649, 
2.216}, {103.671, 151.1, 1.495}, {103.831, 150.284, 
0.841}, {104.124, 148.824, 0.294}, {104.624, 
146.346, -0.047}, {105.124, 143.868, 0.049}, {105.624, 
141.39, -0.045}, {106.124, 138.913, 0.047}, {106.624, 
136.436, -0.043}, {107.124, 133.959, 0.045}, {107.624, 
131.483, -0.041}, {108.124, 129.007, 0.043}, {108.624, 
126.531, -0.04}, {109.124, 124.055, 0.041}, {109.624, 
121.58, -0.038}, {110.124, 119.105, 0.04}, {110.624, 
116.63, -0.036}, {111.124, 114.156, 0.038}, {111.624, 
111.682, -0.035}, {112.124, 109.208, 0.037}, {112.624, 
106.735, -0.034}, {113.124, 104.261, 0.035}, {113.624, 
101.788, -0.032}, {114.124, 99.316, 0.034}, {114.624, 
96.843, -0.031}, {115.124, 94.371, 0.033}, {115.624, 
91.9, -0.03}, {116.124, 89.428, 0.032}, {116.624, 
86.957, -0.029}, {117.124, 84.486, 0.031}, {117.624, 
82.015, -0.028}, {118.124, 79.545, 0.03}, {118.624, 
77.075, -0.027}, {119.124, 74.605, 0.029}, {119.624, 
72.136, -0.026}, {120.124, 69.666, 0.028}, {120.624, 
67.197, -0.025}, {121.124, 64.729, 0.027}, {121.624, 
62.26, -0.025}, {122.124, 59.792, 0.027}, {122.624, 
57.325, -0.024}, {123.124, 54.857, 0.026}, {123.624, 
52.39, -0.023}, {124.124, 49.923, 0.025}, {124.624, 
47.456, -0.023}, {125.124, 44.99, 0.025}, {125.624, 
42.524, -0.022}, {126.124, 40.058, 0.024}, {126.624, 
37.593, -0.021}, {127.124, 35.127, 0.023}, {127.624, 
32.662, -0.021}, {128.124, 30.198, 0.023}, {128.624, 
27.733, -0.02}, {129.124, 25.269, 0.022}, {129.624, 
22.805, -0.02}, {130.124, 20.342, 0.022}, {130.624, 
17.879, -0.02}, {131.124, 15.416, 0.022}, {131.624, 
12.953, -0.019}, {132.124, 10.491, 0.021}, {132.624, 
8.029, -0.019}, {133.124, 5.567, 0.021}, {133.624, 
3.105, -0.018}, {134.124, 0.644, 0.02}, {134.255, 0, -0.018}};

// Binary search for row before or on time
int SearchDataByTime(double target) {
    if (target < 0) {
        Serial.println("(SearchDataByTime) Error: Cannot have negative target time");
        return -1;
    }
    
    int tCol = 0;    // time column
    int simDataRows = sizeof(simData)/sizeof(simData[0]);
    
    int lIdx = 0;
    int rIdx = simDataRows - 1;
    int mIdx = (rIdx - lIdx) / 2;
    
    while (lIdx <= rIdx) {
        if (simData[mIdx][tCol] < target) {
            // right subarr
            lIdx = mIdx + 1;
        }
        else if (simData[mIdx][tCol] > target) {
            // left subarr
            rIdx = mIdx - 1;
        }
        else {
            break;
        }
        
        // Update middle index
        mIdx = lIdx + (rIdx - lIdx) / 2;
    }
    
    // if not exact index was found, get index previous before closest (without exceed min bound)
    if (lIdx > rIdx && mIdx != 0) {
        --mIdx;
    }
    
    return mIdx;
}

//return array will have the position in the zeroth location, acceleration in the second
void getSimulatedData(double time, float* returnArray) {
    
    if ((time>134.255)||(time<30)) {
        returnArray[0] = 0.0;
        returnArray[1] = 0.0;
    }
    else {
        //get the first row where the time is less than the requested time
        int i = SearchDataByTime(time);

        // TODO: Fault handler - SearchDataByTime exception handling        
        if (i < 0) {
            returnArray[0] = 0.0;
            returnArray[1] = 0.0;
        }
        else {
            double fractionToNext = (time-simData[i][0])/(simData[i+1][0]-simData[i][0]);
            
            //interpolated position
            returnArray[0] = simData[i][1]+fractionToNext*(simData[i+1][1]-simData[i][1]);
            //interpolated acceleration
            returnArray[1] = simData[i][2]+fractionToNext*(simData[i+1][2]-simData[i][2]);
        }
    }
}