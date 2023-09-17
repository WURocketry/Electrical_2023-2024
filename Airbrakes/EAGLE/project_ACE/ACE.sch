<?xml version="1.0" encoding="utf-8"?>
<!DOCTYPE eagle SYSTEM "eagle.dtd">
<eagle version="9.6.2">
<drawing>
<settings>
<setting alwaysvectorfont="no"/>
<setting verticaltext="up"/>
</settings>
<grid distance="0.1" unitdist="inch" unit="inch" style="lines" multiple="1" display="no" altdistance="0.01" altunitdist="inch" altunit="inch"/>
<layers>
<layer number="1" name="Top" color="4" fill="1" visible="no" active="no"/>
<layer number="16" name="Bottom" color="1" fill="1" visible="no" active="no"/>
<layer number="17" name="Pads" color="2" fill="1" visible="no" active="no"/>
<layer number="18" name="Vias" color="2" fill="1" visible="no" active="no"/>
<layer number="19" name="Unrouted" color="6" fill="1" visible="no" active="no"/>
<layer number="20" name="Dimension" color="15" fill="1" visible="no" active="no"/>
<layer number="21" name="tPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="22" name="bPlace" color="7" fill="1" visible="no" active="no"/>
<layer number="23" name="tOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="24" name="bOrigins" color="15" fill="1" visible="no" active="no"/>
<layer number="25" name="tNames" color="7" fill="1" visible="no" active="no"/>
<layer number="26" name="bNames" color="7" fill="1" visible="no" active="no"/>
<layer number="27" name="tValues" color="7" fill="1" visible="no" active="no"/>
<layer number="28" name="bValues" color="7" fill="1" visible="no" active="no"/>
<layer number="29" name="tStop" color="7" fill="3" visible="no" active="no"/>
<layer number="30" name="bStop" color="7" fill="6" visible="no" active="no"/>
<layer number="31" name="tCream" color="7" fill="4" visible="no" active="no"/>
<layer number="32" name="bCream" color="7" fill="5" visible="no" active="no"/>
<layer number="33" name="tFinish" color="6" fill="3" visible="no" active="no"/>
<layer number="34" name="bFinish" color="6" fill="6" visible="no" active="no"/>
<layer number="35" name="tGlue" color="7" fill="4" visible="no" active="no"/>
<layer number="36" name="bGlue" color="7" fill="5" visible="no" active="no"/>
<layer number="37" name="tTest" color="7" fill="1" visible="no" active="no"/>
<layer number="38" name="bTest" color="7" fill="1" visible="no" active="no"/>
<layer number="39" name="tKeepout" color="4" fill="11" visible="no" active="no"/>
<layer number="40" name="bKeepout" color="1" fill="11" visible="no" active="no"/>
<layer number="41" name="tRestrict" color="4" fill="10" visible="no" active="no"/>
<layer number="42" name="bRestrict" color="1" fill="10" visible="no" active="no"/>
<layer number="43" name="vRestrict" color="2" fill="10" visible="no" active="no"/>
<layer number="44" name="Drills" color="7" fill="1" visible="no" active="no"/>
<layer number="45" name="Holes" color="7" fill="1" visible="no" active="no"/>
<layer number="46" name="Milling" color="3" fill="1" visible="no" active="no"/>
<layer number="47" name="Measures" color="7" fill="1" visible="no" active="no"/>
<layer number="48" name="Document" color="7" fill="1" visible="no" active="no"/>
<layer number="49" name="Reference" color="7" fill="1" visible="no" active="no"/>
<layer number="50" name="dxf" color="7" fill="1" visible="no" active="no"/>
<layer number="51" name="tDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="52" name="bDocu" color="7" fill="1" visible="no" active="no"/>
<layer number="53" name="tGND_GNDA" color="7" fill="9" visible="no" active="no"/>
<layer number="54" name="bGND_GNDA" color="1" fill="9" visible="no" active="no"/>
<layer number="56" name="wert" color="7" fill="1" visible="no" active="no"/>
<layer number="57" name="tCAD" color="7" fill="1" visible="no" active="no"/>
<layer number="59" name="tCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="60" name="bCarbon" color="7" fill="1" visible="no" active="no"/>
<layer number="88" name="SimResults" color="9" fill="1" visible="yes" active="yes"/>
<layer number="89" name="SimProbes" color="9" fill="1" visible="yes" active="yes"/>
<layer number="90" name="Modules" color="5" fill="1" visible="yes" active="yes"/>
<layer number="91" name="Nets" color="2" fill="1" visible="yes" active="yes"/>
<layer number="92" name="Busses" color="1" fill="1" visible="yes" active="yes"/>
<layer number="93" name="Pins" color="2" fill="1" visible="no" active="yes"/>
<layer number="94" name="Symbols" color="4" fill="1" visible="yes" active="yes"/>
<layer number="95" name="Names" color="7" fill="1" visible="yes" active="yes"/>
<layer number="96" name="Values" color="7" fill="1" visible="yes" active="yes"/>
<layer number="97" name="Info" color="7" fill="1" visible="yes" active="yes"/>
<layer number="98" name="Guide" color="6" fill="1" visible="yes" active="yes"/>
<layer number="99" name="SpiceOrder" color="7" fill="1" visible="no" active="no"/>
<layer number="100" name="Muster" color="7" fill="1" visible="no" active="yes"/>
<layer number="101" name="Patch_Top" color="12" fill="4" visible="no" active="yes"/>
<layer number="102" name="Mittellin" color="7" fill="1" visible="no" active="yes"/>
<layer number="103" name="Stiffner" color="7" fill="1" visible="no" active="yes"/>
<layer number="104" name="Name" color="7" fill="1" visible="no" active="yes"/>
<layer number="105" name="Beschreib" color="7" fill="1" visible="no" active="yes"/>
<layer number="106" name="BGA-Top" color="7" fill="1" visible="no" active="yes"/>
<layer number="107" name="BD-Top" color="7" fill="1" visible="no" active="yes"/>
<layer number="108" name="tBridges" color="7" fill="1" visible="no" active="yes"/>
<layer number="109" name="tBPL" color="7" fill="1" visible="no" active="yes"/>
<layer number="110" name="bBPL" color="7" fill="1" visible="no" active="yes"/>
<layer number="111" name="MPL" color="7" fill="1" visible="no" active="yes"/>
<layer number="112" name="tSilk" color="7" fill="1" visible="no" active="yes"/>
<layer number="113" name="ReferenceLS" color="7" fill="1" visible="no" active="no"/>
<layer number="114" name="tPlaceRed" color="7" fill="1" visible="no" active="yes"/>
<layer number="115" name="FRNTMAAT2" color="7" fill="1" visible="yes" active="yes"/>
<layer number="116" name="Patch_BOT" color="9" fill="4" visible="no" active="yes"/>
<layer number="117" name="BACKMAAT1" color="7" fill="1" visible="yes" active="yes"/>
<layer number="118" name="Rect_Pads" color="7" fill="1" visible="no" active="no"/>
<layer number="119" name="KAP_TEKEN" color="7" fill="1" visible="yes" active="yes"/>
<layer number="120" name="KAP_MAAT1" color="7" fill="1" visible="yes" active="yes"/>
<layer number="121" name="sName" color="7" fill="1" visible="no" active="yes"/>
<layer number="122" name="_bPlace" color="7" fill="1" visible="no" active="yes"/>
<layer number="123" name="tTestmark" color="7" fill="1" visible="no" active="yes"/>
<layer number="124" name="bTestmark" color="7" fill="1" visible="no" active="yes"/>
<layer number="125" name="_tNames" color="7" fill="1" visible="no" active="yes"/>
<layer number="126" name="_bNames" color="7" fill="1" visible="no" active="yes"/>
<layer number="127" name="_tValues" color="7" fill="1" visible="no" active="yes"/>
<layer number="128" name="_bValues" color="7" fill="1" visible="no" active="yes"/>
<layer number="129" name="Mask" color="7" fill="1" visible="no" active="yes"/>
<layer number="130" name="SMDSTROOK" color="7" fill="1" visible="yes" active="yes"/>
<layer number="131" name="tAdjust" color="7" fill="1" visible="no" active="yes"/>
<layer number="132" name="bAdjust" color="7" fill="1" visible="no" active="yes"/>
<layer number="133" name="bottom_silk" color="7" fill="1" visible="yes" active="yes"/>
<layer number="134" name="silk_top" color="7" fill="1" visible="yes" active="yes"/>
<layer number="135" name="silk_bottom" color="7" fill="1" visible="yes" active="yes"/>
<layer number="136" name="silktop" color="7" fill="1" visible="yes" active="yes"/>
<layer number="137" name="silkbottom" color="7" fill="1" visible="yes" active="yes"/>
<layer number="138" name="EEE" color="7" fill="1" visible="yes" active="yes"/>
<layer number="139" name="_tKeepout" color="7" fill="1" visible="yes" active="yes"/>
<layer number="140" name="mbKeepout" color="7" fill="1" visible="yes" active="yes"/>
<layer number="141" name="ASSEMBLY_TOP" color="7" fill="1" visible="yes" active="yes"/>
<layer number="142" name="mbRestrict" color="7" fill="1" visible="yes" active="yes"/>
<layer number="143" name="PLACE_BOUND_TOP" color="7" fill="1" visible="yes" active="yes"/>
<layer number="144" name="Drill_legend" color="7" fill="1" visible="no" active="yes"/>
<layer number="145" name="DrillLegend_01-16" color="7" fill="1" visible="yes" active="yes"/>
<layer number="146" name="DrillLegend_01-20" color="7" fill="1" visible="yes" active="yes"/>
<layer number="147" name="PIN_NUMBER" color="7" fill="1" visible="yes" active="yes"/>
<layer number="148" name="mDocument" color="7" fill="1" visible="yes" active="yes"/>
<layer number="149" name="DrillLegend_02-15" color="7" fill="1" visible="yes" active="yes"/>
<layer number="150" name="Notes" color="7" fill="1" visible="no" active="yes"/>
<layer number="151" name="HeatSink" color="7" fill="1" visible="no" active="yes"/>
<layer number="152" name="_bDocu" color="7" fill="1" visible="no" active="yes"/>
<layer number="153" name="FabDoc1" color="6" fill="1" visible="no" active="no"/>
<layer number="154" name="FabDoc2" color="2" fill="1" visible="no" active="no"/>
<layer number="155" name="FabDoc3" color="7" fill="15" visible="no" active="no"/>
<layer number="166" name="AntennaArea" color="7" fill="1" visible="yes" active="yes"/>
<layer number="168" name="4mmHeightArea" color="7" fill="1" visible="yes" active="yes"/>
<layer number="191" name="mNets" color="7" fill="1" visible="yes" active="yes"/>
<layer number="192" name="mBusses" color="7" fill="1" visible="yes" active="yes"/>
<layer number="193" name="mPins" color="7" fill="1" visible="yes" active="yes"/>
<layer number="194" name="mSymbols" color="7" fill="1" visible="yes" active="yes"/>
<layer number="195" name="mNames" color="7" fill="1" visible="yes" active="yes"/>
<layer number="196" name="mValues" color="7" fill="1" visible="yes" active="yes"/>
<layer number="199" name="Contour" color="7" fill="1" visible="no" active="yes"/>
<layer number="200" name="200bmp" color="1" fill="10" visible="yes" active="yes"/>
<layer number="201" name="201bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="202" name="202bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="203" name="203bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="204" name="204bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="205" name="205bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="206" name="206bmp" color="7" fill="10" visible="no" active="yes"/>
<layer number="207" name="207bmp" color="8" fill="10" visible="no" active="yes"/>
<layer number="208" name="208bmp" color="9" fill="10" visible="no" active="yes"/>
<layer number="209" name="209bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="210" name="210bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="211" name="211bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="212" name="212bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="213" name="213bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="214" name="214bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="215" name="215bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="216" name="216bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="217" name="217bmp" color="18" fill="1" visible="no" active="no"/>
<layer number="218" name="218bmp" color="19" fill="1" visible="no" active="no"/>
<layer number="219" name="219bmp" color="20" fill="1" visible="no" active="no"/>
<layer number="220" name="220bmp" color="21" fill="1" visible="no" active="no"/>
<layer number="221" name="221bmp" color="22" fill="1" visible="no" active="no"/>
<layer number="222" name="222bmp" color="23" fill="1" visible="no" active="no"/>
<layer number="223" name="223bmp" color="24" fill="1" visible="no" active="no"/>
<layer number="224" name="224bmp" color="25" fill="1" visible="no" active="no"/>
<layer number="225" name="225bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="226" name="226bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="227" name="227bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="228" name="228bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="229" name="229bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="230" name="230bmp" color="7" fill="1" visible="no" active="yes"/>
<layer number="231" name="Eagle3D_PG1" color="7" fill="1" visible="no" active="no"/>
<layer number="232" name="Eagle3D_PG2" color="7" fill="1" visible="no" active="no"/>
<layer number="233" name="Eagle3D_PG3" color="7" fill="1" visible="no" active="no"/>
<layer number="248" name="Housing" color="7" fill="1" visible="no" active="yes"/>
<layer number="249" name="Edge" color="7" fill="1" visible="no" active="yes"/>
<layer number="250" name="Descript" color="7" fill="1" visible="no" active="yes"/>
<layer number="251" name="SMDround" color="7" fill="1" visible="no" active="yes"/>
<layer number="254" name="cooling" color="7" fill="1" visible="no" active="yes"/>
<layer number="255" name="routoute" color="7" fill="1" visible="yes" active="yes"/>
</layers>
<schematic xreflabel="%F%N/%S.%C%R" xrefpart="/%S.%C%R">
<libraries>
<library name="ABX00042">
<packages>
<package name="MODULE_ABX00042">
<rectangle x1="-0.3" y1="16.63" x2="-0.1" y2="17.07" layer="41"/>
<rectangle x1="-0.7" y1="16.63" x2="-0.5" y2="17.07" layer="41"/>
<rectangle x1="-1.1" y1="16.63" x2="-0.9" y2="17.07" layer="41"/>
<rectangle x1="-1.5" y1="16.63" x2="-1.3" y2="17.07" layer="41"/>
<rectangle x1="-1.9" y1="16.63" x2="-1.7" y2="17.07" layer="41"/>
<rectangle x1="-2.3" y1="16.63" x2="-2.1" y2="17.07" layer="41"/>
<rectangle x1="-2.7" y1="16.63" x2="-2.5" y2="17.07" layer="41"/>
<rectangle x1="-3.1" y1="16.63" x2="-2.9" y2="17.07" layer="41"/>
<rectangle x1="-3.5" y1="16.63" x2="-3.3" y2="17.07" layer="41"/>
<rectangle x1="-3.9" y1="16.63" x2="-3.7" y2="17.07" layer="41"/>
<rectangle x1="-4.3" y1="16.63" x2="-4.1" y2="17.07" layer="41"/>
<rectangle x1="-4.7" y1="16.63" x2="-4.5" y2="17.07" layer="41"/>
<rectangle x1="-5.1" y1="16.63" x2="-4.9" y2="17.07" layer="41"/>
<rectangle x1="-5.5" y1="16.63" x2="-5.3" y2="17.07" layer="41"/>
<rectangle x1="-5.9" y1="16.63" x2="-5.7" y2="17.07" layer="41"/>
<rectangle x1="-6.3" y1="16.63" x2="-6.1" y2="17.07" layer="41"/>
<rectangle x1="-6.7" y1="16.63" x2="-6.5" y2="17.07" layer="41"/>
<rectangle x1="-7.1" y1="16.63" x2="-6.9" y2="17.07" layer="41"/>
<rectangle x1="-7.5" y1="16.63" x2="-7.3" y2="17.07" layer="41"/>
<rectangle x1="-7.9" y1="16.63" x2="-7.7" y2="17.07" layer="41"/>
<rectangle x1="0.1" y1="16.63" x2="0.3" y2="17.07" layer="41"/>
<rectangle x1="0.5" y1="16.63" x2="0.7" y2="17.07" layer="41"/>
<rectangle x1="0.9" y1="16.63" x2="1.1" y2="17.07" layer="41"/>
<rectangle x1="1.3" y1="16.63" x2="1.5" y2="17.07" layer="41"/>
<rectangle x1="1.7" y1="16.63" x2="1.9" y2="17.07" layer="41"/>
<rectangle x1="2.1" y1="16.63" x2="2.3" y2="17.07" layer="41"/>
<rectangle x1="2.5" y1="16.63" x2="2.7" y2="17.07" layer="41"/>
<rectangle x1="2.9" y1="16.63" x2="3.1" y2="17.07" layer="41"/>
<rectangle x1="3.3" y1="16.63" x2="3.5" y2="17.07" layer="41"/>
<rectangle x1="3.7" y1="16.63" x2="3.9" y2="17.07" layer="41"/>
<rectangle x1="4.1" y1="16.63" x2="4.3" y2="17.07" layer="41"/>
<rectangle x1="4.5" y1="16.63" x2="4.7" y2="17.07" layer="41"/>
<rectangle x1="4.9" y1="16.63" x2="5.1" y2="17.07" layer="41"/>
<rectangle x1="5.3" y1="16.63" x2="5.5" y2="17.07" layer="41"/>
<rectangle x1="5.7" y1="16.63" x2="5.9" y2="17.07" layer="41"/>
<rectangle x1="6.1" y1="16.63" x2="6.3" y2="17.07" layer="41"/>
<rectangle x1="6.5" y1="16.63" x2="6.7" y2="17.07" layer="41"/>
<rectangle x1="6.9" y1="16.63" x2="7.1" y2="17.07" layer="41"/>
<rectangle x1="7.3" y1="16.63" x2="7.5" y2="17.07" layer="41"/>
<rectangle x1="7.7" y1="16.63" x2="7.9" y2="17.07" layer="41"/>
<rectangle x1="-7.9" y1="14.69" x2="-7.7" y2="15.13" layer="41"/>
<rectangle x1="-7.5" y1="14.69" x2="-7.3" y2="15.13" layer="41"/>
<rectangle x1="-7.1" y1="14.69" x2="-6.9" y2="15.13" layer="41"/>
<rectangle x1="-6.7" y1="14.69" x2="-6.5" y2="15.13" layer="41"/>
<rectangle x1="-6.3" y1="14.69" x2="-6.1" y2="15.13" layer="41"/>
<rectangle x1="-5.9" y1="14.69" x2="-5.7" y2="15.13" layer="41"/>
<rectangle x1="-5.5" y1="14.69" x2="-5.3" y2="15.13" layer="41"/>
<rectangle x1="-5.1" y1="14.69" x2="-4.9" y2="15.13" layer="41"/>
<rectangle x1="-4.7" y1="14.69" x2="-4.5" y2="15.13" layer="41"/>
<rectangle x1="-4.3" y1="14.69" x2="-4.1" y2="15.13" layer="41"/>
<rectangle x1="-3.9" y1="14.69" x2="-3.7" y2="15.13" layer="41"/>
<rectangle x1="-3.5" y1="14.69" x2="-3.3" y2="15.13" layer="41"/>
<rectangle x1="-3.1" y1="14.69" x2="-2.9" y2="15.13" layer="41"/>
<rectangle x1="-2.7" y1="14.69" x2="-2.5" y2="15.13" layer="41"/>
<rectangle x1="-2.3" y1="14.69" x2="-2.1" y2="15.13" layer="41"/>
<rectangle x1="-1.9" y1="14.69" x2="-1.7" y2="15.13" layer="41"/>
<rectangle x1="-1.5" y1="14.69" x2="-1.3" y2="15.13" layer="41"/>
<rectangle x1="-1.1" y1="14.69" x2="-0.9" y2="15.13" layer="41"/>
<rectangle x1="-0.7" y1="14.69" x2="-0.5" y2="15.13" layer="41"/>
<rectangle x1="-0.3" y1="14.69" x2="-0.1" y2="15.13" layer="41"/>
<rectangle x1="0.1" y1="14.69" x2="0.3" y2="15.13" layer="41"/>
<rectangle x1="0.5" y1="14.69" x2="0.7" y2="15.13" layer="41"/>
<rectangle x1="0.9" y1="14.69" x2="1.1" y2="15.13" layer="41"/>
<rectangle x1="1.3" y1="14.69" x2="1.5" y2="15.13" layer="41"/>
<rectangle x1="1.7" y1="14.69" x2="1.9" y2="15.13" layer="41"/>
<rectangle x1="2.1" y1="14.69" x2="2.3" y2="15.13" layer="41"/>
<rectangle x1="2.5" y1="14.69" x2="2.7" y2="15.13" layer="41"/>
<rectangle x1="2.9" y1="14.69" x2="3.1" y2="15.13" layer="41"/>
<rectangle x1="3.3" y1="14.69" x2="3.5" y2="15.13" layer="41"/>
<rectangle x1="3.7" y1="14.69" x2="3.9" y2="15.13" layer="41"/>
<rectangle x1="4.1" y1="14.69" x2="4.3" y2="15.13" layer="41"/>
<rectangle x1="4.5" y1="14.69" x2="4.7" y2="15.13" layer="41"/>
<rectangle x1="4.9" y1="14.69" x2="5.1" y2="15.13" layer="41"/>
<rectangle x1="5.3" y1="14.69" x2="5.5" y2="15.13" layer="41"/>
<rectangle x1="5.7" y1="14.69" x2="5.9" y2="15.13" layer="41"/>
<rectangle x1="6.1" y1="14.69" x2="6.3" y2="15.13" layer="41"/>
<rectangle x1="6.5" y1="14.69" x2="6.7" y2="15.13" layer="41"/>
<rectangle x1="6.9" y1="14.69" x2="7.1" y2="15.13" layer="41"/>
<rectangle x1="7.3" y1="14.69" x2="7.5" y2="15.13" layer="41"/>
<rectangle x1="7.7" y1="14.69" x2="7.9" y2="15.13" layer="41"/>
<wire x1="-9.3" y1="17.32" x2="-9.3" y2="14.44" width="0.127" layer="51"/>
<wire x1="-9.3" y1="14.44" x2="9.3" y2="14.44" width="0.127" layer="51"/>
<wire x1="9.3" y1="14.44" x2="9.3" y2="17.32" width="0.127" layer="51"/>
<wire x1="9.3" y1="17.32" x2="-9.3" y2="17.32" width="0.127" layer="51"/>
<wire x1="-12.7" y1="-33.02" x2="12.7" y2="-33.02" width="0.127" layer="51"/>
<wire x1="12.7" y1="-33.02" x2="12.7" y2="33.02" width="0.127" layer="51"/>
<wire x1="12.7" y1="33.02" x2="-12.7" y2="33.02" width="0.127" layer="51"/>
<wire x1="-12.7" y1="33.02" x2="-12.7" y2="-33.02" width="0.127" layer="51"/>
<wire x1="-12.7" y1="-33.02" x2="12.7" y2="-33.02" width="0.127" layer="21"/>
<wire x1="12.7" y1="-33.02" x2="12.7" y2="33.02" width="0.127" layer="21"/>
<wire x1="12.7" y1="33.02" x2="-12.7" y2="33.02" width="0.127" layer="21"/>
<wire x1="-12.7" y1="33.02" x2="-12.7" y2="-33.02" width="0.127" layer="21"/>
<wire x1="-12.95" y1="-33.27" x2="12.95" y2="-33.27" width="0.05" layer="39"/>
<wire x1="12.95" y1="-33.27" x2="12.95" y2="33.27" width="0.05" layer="39"/>
<wire x1="12.95" y1="33.27" x2="-12.95" y2="33.27" width="0.05" layer="39"/>
<wire x1="-12.95" y1="33.27" x2="-12.95" y2="-33.27" width="0.05" layer="39"/>
<text x="-12.7" y="34.29" size="1.27" layer="25">&gt;NAME</text>
<text x="-12.7" y="-35.56" size="1.27" layer="27">&gt;VALUE</text>
<rectangle x1="-0.3" y1="-26.55" x2="-0.1" y2="-26.11" layer="41"/>
<rectangle x1="-0.7" y1="-26.55" x2="-0.5" y2="-26.11" layer="41"/>
<rectangle x1="-1.1" y1="-26.55" x2="-0.9" y2="-26.11" layer="41"/>
<rectangle x1="-1.5" y1="-26.55" x2="-1.3" y2="-26.11" layer="41"/>
<rectangle x1="-1.9" y1="-26.55" x2="-1.7" y2="-26.11" layer="41"/>
<rectangle x1="-2.3" y1="-26.55" x2="-2.1" y2="-26.11" layer="41"/>
<rectangle x1="-2.7" y1="-26.55" x2="-2.5" y2="-26.11" layer="41"/>
<rectangle x1="-3.1" y1="-26.55" x2="-2.9" y2="-26.11" layer="41"/>
<rectangle x1="-3.5" y1="-26.55" x2="-3.3" y2="-26.11" layer="41"/>
<rectangle x1="-3.9" y1="-26.55" x2="-3.7" y2="-26.11" layer="41"/>
<rectangle x1="-4.3" y1="-26.55" x2="-4.1" y2="-26.11" layer="41"/>
<rectangle x1="-4.7" y1="-26.55" x2="-4.5" y2="-26.11" layer="41"/>
<rectangle x1="-5.1" y1="-26.55" x2="-4.9" y2="-26.11" layer="41"/>
<rectangle x1="-5.5" y1="-26.55" x2="-5.3" y2="-26.11" layer="41"/>
<rectangle x1="-5.9" y1="-26.55" x2="-5.7" y2="-26.11" layer="41"/>
<rectangle x1="-6.3" y1="-26.55" x2="-6.1" y2="-26.11" layer="41"/>
<rectangle x1="-6.7" y1="-26.55" x2="-6.5" y2="-26.11" layer="41"/>
<rectangle x1="-7.1" y1="-26.55" x2="-6.9" y2="-26.11" layer="41"/>
<rectangle x1="-7.5" y1="-26.55" x2="-7.3" y2="-26.11" layer="41"/>
<rectangle x1="-7.9" y1="-26.55" x2="-7.7" y2="-26.11" layer="41"/>
<rectangle x1="0.1" y1="-26.55" x2="0.3" y2="-26.11" layer="41"/>
<rectangle x1="0.5" y1="-26.55" x2="0.7" y2="-26.11" layer="41"/>
<rectangle x1="0.9" y1="-26.55" x2="1.1" y2="-26.11" layer="41"/>
<rectangle x1="1.3" y1="-26.55" x2="1.5" y2="-26.11" layer="41"/>
<rectangle x1="1.7" y1="-26.55" x2="1.9" y2="-26.11" layer="41"/>
<rectangle x1="2.1" y1="-26.55" x2="2.3" y2="-26.11" layer="41"/>
<rectangle x1="2.5" y1="-26.55" x2="2.7" y2="-26.11" layer="41"/>
<rectangle x1="2.9" y1="-26.55" x2="3.1" y2="-26.11" layer="41"/>
<rectangle x1="3.3" y1="-26.55" x2="3.5" y2="-26.11" layer="41"/>
<rectangle x1="3.7" y1="-26.55" x2="3.9" y2="-26.11" layer="41"/>
<rectangle x1="4.1" y1="-26.55" x2="4.3" y2="-26.11" layer="41"/>
<rectangle x1="4.5" y1="-26.55" x2="4.7" y2="-26.11" layer="41"/>
<rectangle x1="4.9" y1="-26.55" x2="5.1" y2="-26.11" layer="41"/>
<rectangle x1="5.3" y1="-26.55" x2="5.5" y2="-26.11" layer="41"/>
<rectangle x1="5.7" y1="-26.55" x2="5.9" y2="-26.11" layer="41"/>
<rectangle x1="6.1" y1="-26.55" x2="6.3" y2="-26.11" layer="41"/>
<rectangle x1="6.5" y1="-26.55" x2="6.7" y2="-26.11" layer="41"/>
<rectangle x1="6.9" y1="-26.55" x2="7.1" y2="-26.11" layer="41"/>
<rectangle x1="7.3" y1="-26.55" x2="7.5" y2="-26.11" layer="41"/>
<rectangle x1="7.7" y1="-26.55" x2="7.9" y2="-26.11" layer="41"/>
<rectangle x1="-7.9" y1="-28.49" x2="-7.7" y2="-28.05" layer="41"/>
<rectangle x1="-7.5" y1="-28.49" x2="-7.3" y2="-28.05" layer="41"/>
<rectangle x1="-7.1" y1="-28.49" x2="-6.9" y2="-28.05" layer="41"/>
<rectangle x1="-6.7" y1="-28.49" x2="-6.5" y2="-28.05" layer="41"/>
<rectangle x1="-6.3" y1="-28.49" x2="-6.1" y2="-28.05" layer="41"/>
<rectangle x1="-5.9" y1="-28.49" x2="-5.7" y2="-28.05" layer="41"/>
<rectangle x1="-5.5" y1="-28.49" x2="-5.3" y2="-28.05" layer="41"/>
<rectangle x1="-5.1" y1="-28.49" x2="-4.9" y2="-28.05" layer="41"/>
<rectangle x1="-4.7" y1="-28.49" x2="-4.5" y2="-28.05" layer="41"/>
<rectangle x1="-4.3" y1="-28.49" x2="-4.1" y2="-28.05" layer="41"/>
<rectangle x1="-3.9" y1="-28.49" x2="-3.7" y2="-28.05" layer="41"/>
<rectangle x1="-3.5" y1="-28.49" x2="-3.3" y2="-28.05" layer="41"/>
<rectangle x1="-3.1" y1="-28.49" x2="-2.9" y2="-28.05" layer="41"/>
<rectangle x1="-2.7" y1="-28.49" x2="-2.5" y2="-28.05" layer="41"/>
<rectangle x1="-2.3" y1="-28.49" x2="-2.1" y2="-28.05" layer="41"/>
<rectangle x1="-1.9" y1="-28.49" x2="-1.7" y2="-28.05" layer="41"/>
<rectangle x1="-1.5" y1="-28.49" x2="-1.3" y2="-28.05" layer="41"/>
<rectangle x1="-1.1" y1="-28.49" x2="-0.9" y2="-28.05" layer="41"/>
<rectangle x1="-0.7" y1="-28.49" x2="-0.5" y2="-28.05" layer="41"/>
<rectangle x1="-0.3" y1="-28.49" x2="-0.1" y2="-28.05" layer="41"/>
<rectangle x1="0.1" y1="-28.49" x2="0.3" y2="-28.05" layer="41"/>
<rectangle x1="0.5" y1="-28.49" x2="0.7" y2="-28.05" layer="41"/>
<rectangle x1="0.9" y1="-28.49" x2="1.1" y2="-28.05" layer="41"/>
<rectangle x1="1.3" y1="-28.49" x2="1.5" y2="-28.05" layer="41"/>
<rectangle x1="1.7" y1="-28.49" x2="1.9" y2="-28.05" layer="41"/>
<rectangle x1="2.1" y1="-28.49" x2="2.3" y2="-28.05" layer="41"/>
<rectangle x1="2.5" y1="-28.49" x2="2.7" y2="-28.05" layer="41"/>
<rectangle x1="2.9" y1="-28.49" x2="3.1" y2="-28.05" layer="41"/>
<rectangle x1="3.3" y1="-28.49" x2="3.5" y2="-28.05" layer="41"/>
<rectangle x1="3.7" y1="-28.49" x2="3.9" y2="-28.05" layer="41"/>
<rectangle x1="4.1" y1="-28.49" x2="4.3" y2="-28.05" layer="41"/>
<rectangle x1="4.5" y1="-28.49" x2="4.7" y2="-28.05" layer="41"/>
<rectangle x1="4.9" y1="-28.49" x2="5.1" y2="-28.05" layer="41"/>
<rectangle x1="5.3" y1="-28.49" x2="5.5" y2="-28.05" layer="41"/>
<rectangle x1="5.7" y1="-28.49" x2="5.9" y2="-28.05" layer="41"/>
<rectangle x1="6.1" y1="-28.49" x2="6.3" y2="-28.05" layer="41"/>
<rectangle x1="6.5" y1="-28.49" x2="6.7" y2="-28.05" layer="41"/>
<rectangle x1="6.9" y1="-28.49" x2="7.1" y2="-28.05" layer="41"/>
<rectangle x1="7.3" y1="-28.49" x2="7.5" y2="-28.05" layer="41"/>
<rectangle x1="7.7" y1="-28.49" x2="7.9" y2="-28.05" layer="41"/>
<wire x1="-9.3" y1="-25.86" x2="-9.3" y2="-28.74" width="0.127" layer="51"/>
<wire x1="-9.3" y1="-28.74" x2="9.3" y2="-28.74" width="0.127" layer="51"/>
<wire x1="9.3" y1="-28.74" x2="9.3" y2="-25.86" width="0.127" layer="51"/>
<wire x1="9.3" y1="-25.86" x2="-9.3" y2="-25.86" width="0.127" layer="51"/>
<text x="-8.41" y="18" size="0.5" layer="51">1</text>
<text x="8.39" y="-29.6" size="0.5" layer="51">1</text>
<text x="8.39" y="13.6" size="0.5" layer="51">80</text>
<text x="-9.21" y="-25.6" size="0.5" layer="51">80</text>
<rectangle x1="-0.3" y1="16.63" x2="-0.1" y2="17.07" layer="43"/>
<rectangle x1="-0.7" y1="16.63" x2="-0.5" y2="17.07" layer="43"/>
<rectangle x1="-1.1" y1="16.63" x2="-0.9" y2="17.07" layer="43"/>
<rectangle x1="-1.5" y1="16.63" x2="-1.3" y2="17.07" layer="43"/>
<rectangle x1="-1.9" y1="16.63" x2="-1.7" y2="17.07" layer="43"/>
<rectangle x1="-2.3" y1="16.63" x2="-2.1" y2="17.07" layer="43"/>
<rectangle x1="-2.7" y1="16.63" x2="-2.5" y2="17.07" layer="43"/>
<rectangle x1="-3.1" y1="16.63" x2="-2.9" y2="17.07" layer="43"/>
<rectangle x1="-3.5" y1="16.63" x2="-3.3" y2="17.07" layer="43"/>
<rectangle x1="-3.9" y1="16.63" x2="-3.7" y2="17.07" layer="43"/>
<rectangle x1="-4.3" y1="16.63" x2="-4.1" y2="17.07" layer="43"/>
<rectangle x1="-4.7" y1="16.63" x2="-4.5" y2="17.07" layer="43"/>
<rectangle x1="-5.1" y1="16.63" x2="-4.9" y2="17.07" layer="43"/>
<rectangle x1="-5.5" y1="16.63" x2="-5.3" y2="17.07" layer="43"/>
<rectangle x1="-5.9" y1="16.63" x2="-5.7" y2="17.07" layer="43"/>
<rectangle x1="-6.3" y1="16.63" x2="-6.1" y2="17.07" layer="43"/>
<rectangle x1="-6.7" y1="16.63" x2="-6.5" y2="17.07" layer="43"/>
<rectangle x1="-7.1" y1="16.63" x2="-6.9" y2="17.07" layer="43"/>
<rectangle x1="-7.5" y1="16.63" x2="-7.3" y2="17.07" layer="43"/>
<rectangle x1="-7.9" y1="16.63" x2="-7.7" y2="17.07" layer="43"/>
<rectangle x1="0.1" y1="16.63" x2="0.3" y2="17.07" layer="43"/>
<rectangle x1="0.5" y1="16.63" x2="0.7" y2="17.07" layer="43"/>
<rectangle x1="0.9" y1="16.63" x2="1.1" y2="17.07" layer="43"/>
<rectangle x1="1.3" y1="16.63" x2="1.5" y2="17.07" layer="43"/>
<rectangle x1="1.7" y1="16.63" x2="1.9" y2="17.07" layer="43"/>
<rectangle x1="2.1" y1="16.63" x2="2.3" y2="17.07" layer="43"/>
<rectangle x1="2.5" y1="16.63" x2="2.7" y2="17.07" layer="43"/>
<rectangle x1="2.9" y1="16.63" x2="3.1" y2="17.07" layer="43"/>
<rectangle x1="3.3" y1="16.63" x2="3.5" y2="17.07" layer="43"/>
<rectangle x1="3.7" y1="16.63" x2="3.9" y2="17.07" layer="43"/>
<rectangle x1="4.1" y1="16.63" x2="4.3" y2="17.07" layer="43"/>
<rectangle x1="4.5" y1="16.63" x2="4.7" y2="17.07" layer="43"/>
<rectangle x1="4.9" y1="16.63" x2="5.1" y2="17.07" layer="43"/>
<rectangle x1="5.3" y1="16.63" x2="5.5" y2="17.07" layer="43"/>
<rectangle x1="5.7" y1="16.63" x2="5.9" y2="17.07" layer="43"/>
<rectangle x1="6.1" y1="16.63" x2="6.3" y2="17.07" layer="43"/>
<rectangle x1="6.5" y1="16.63" x2="6.7" y2="17.07" layer="43"/>
<rectangle x1="6.9" y1="16.63" x2="7.1" y2="17.07" layer="43"/>
<rectangle x1="7.3" y1="16.63" x2="7.5" y2="17.07" layer="43"/>
<rectangle x1="7.7" y1="16.63" x2="7.9" y2="17.07" layer="43"/>
<rectangle x1="-7.9" y1="14.69" x2="-7.7" y2="15.13" layer="43"/>
<rectangle x1="-7.5" y1="14.69" x2="-7.3" y2="15.13" layer="43"/>
<rectangle x1="-7.1" y1="14.69" x2="-6.9" y2="15.13" layer="43"/>
<rectangle x1="-6.7" y1="14.69" x2="-6.5" y2="15.13" layer="43"/>
<rectangle x1="-6.3" y1="14.69" x2="-6.1" y2="15.13" layer="43"/>
<rectangle x1="-5.9" y1="14.69" x2="-5.7" y2="15.13" layer="43"/>
<rectangle x1="-5.5" y1="14.69" x2="-5.3" y2="15.13" layer="43"/>
<rectangle x1="-5.1" y1="14.69" x2="-4.9" y2="15.13" layer="43"/>
<rectangle x1="-4.7" y1="14.69" x2="-4.5" y2="15.13" layer="43"/>
<rectangle x1="-4.3" y1="14.69" x2="-4.1" y2="15.13" layer="43"/>
<rectangle x1="-3.9" y1="14.69" x2="-3.7" y2="15.13" layer="43"/>
<rectangle x1="-3.5" y1="14.69" x2="-3.3" y2="15.13" layer="43"/>
<rectangle x1="-3.1" y1="14.69" x2="-2.9" y2="15.13" layer="43"/>
<rectangle x1="-2.7" y1="14.69" x2="-2.5" y2="15.13" layer="43"/>
<rectangle x1="-2.3" y1="14.69" x2="-2.1" y2="15.13" layer="43"/>
<rectangle x1="-1.9" y1="14.69" x2="-1.7" y2="15.13" layer="43"/>
<rectangle x1="-1.5" y1="14.69" x2="-1.3" y2="15.13" layer="43"/>
<rectangle x1="-1.1" y1="14.69" x2="-0.9" y2="15.13" layer="43"/>
<rectangle x1="-0.7" y1="14.69" x2="-0.5" y2="15.13" layer="43"/>
<rectangle x1="-0.3" y1="14.69" x2="-0.1" y2="15.13" layer="43"/>
<rectangle x1="0.1" y1="14.69" x2="0.3" y2="15.13" layer="43"/>
<rectangle x1="0.5" y1="14.69" x2="0.7" y2="15.13" layer="43"/>
<rectangle x1="0.9" y1="14.69" x2="1.1" y2="15.13" layer="43"/>
<rectangle x1="1.3" y1="14.69" x2="1.5" y2="15.13" layer="43"/>
<rectangle x1="1.7" y1="14.69" x2="1.9" y2="15.13" layer="43"/>
<rectangle x1="2.1" y1="14.69" x2="2.3" y2="15.13" layer="43"/>
<rectangle x1="2.5" y1="14.69" x2="2.7" y2="15.13" layer="43"/>
<rectangle x1="2.9" y1="14.69" x2="3.1" y2="15.13" layer="43"/>
<rectangle x1="3.3" y1="14.69" x2="3.5" y2="15.13" layer="43"/>
<rectangle x1="3.7" y1="14.69" x2="3.9" y2="15.13" layer="43"/>
<rectangle x1="4.1" y1="14.69" x2="4.3" y2="15.13" layer="43"/>
<rectangle x1="4.5" y1="14.69" x2="4.7" y2="15.13" layer="43"/>
<rectangle x1="4.9" y1="14.69" x2="5.1" y2="15.13" layer="43"/>
<rectangle x1="5.3" y1="14.69" x2="5.5" y2="15.13" layer="43"/>
<rectangle x1="5.7" y1="14.69" x2="5.9" y2="15.13" layer="43"/>
<rectangle x1="6.1" y1="14.69" x2="6.3" y2="15.13" layer="43"/>
<rectangle x1="6.5" y1="14.69" x2="6.7" y2="15.13" layer="43"/>
<rectangle x1="6.9" y1="14.69" x2="7.1" y2="15.13" layer="43"/>
<rectangle x1="7.3" y1="14.69" x2="7.5" y2="15.13" layer="43"/>
<rectangle x1="7.7" y1="14.69" x2="7.9" y2="15.13" layer="43"/>
<rectangle x1="-0.3" y1="-26.55" x2="-0.1" y2="-26.11" layer="43"/>
<rectangle x1="-0.7" y1="-26.55" x2="-0.5" y2="-26.11" layer="43"/>
<rectangle x1="-1.1" y1="-26.55" x2="-0.9" y2="-26.11" layer="43"/>
<rectangle x1="-1.5" y1="-26.55" x2="-1.3" y2="-26.11" layer="43"/>
<rectangle x1="-1.9" y1="-26.55" x2="-1.7" y2="-26.11" layer="43"/>
<rectangle x1="-2.3" y1="-26.55" x2="-2.1" y2="-26.11" layer="43"/>
<rectangle x1="-2.7" y1="-26.55" x2="-2.5" y2="-26.11" layer="43"/>
<rectangle x1="-3.1" y1="-26.55" x2="-2.9" y2="-26.11" layer="43"/>
<rectangle x1="-3.5" y1="-26.55" x2="-3.3" y2="-26.11" layer="43"/>
<rectangle x1="-3.9" y1="-26.55" x2="-3.7" y2="-26.11" layer="43"/>
<rectangle x1="-4.3" y1="-26.55" x2="-4.1" y2="-26.11" layer="43"/>
<rectangle x1="-4.7" y1="-26.55" x2="-4.5" y2="-26.11" layer="43"/>
<rectangle x1="-5.1" y1="-26.55" x2="-4.9" y2="-26.11" layer="43"/>
<rectangle x1="-5.5" y1="-26.55" x2="-5.3" y2="-26.11" layer="43"/>
<rectangle x1="-5.9" y1="-26.55" x2="-5.7" y2="-26.11" layer="43"/>
<rectangle x1="-6.3" y1="-26.55" x2="-6.1" y2="-26.11" layer="43"/>
<rectangle x1="-6.7" y1="-26.55" x2="-6.5" y2="-26.11" layer="43"/>
<rectangle x1="-7.1" y1="-26.55" x2="-6.9" y2="-26.11" layer="43"/>
<rectangle x1="-7.5" y1="-26.55" x2="-7.3" y2="-26.11" layer="43"/>
<rectangle x1="-7.9" y1="-26.55" x2="-7.7" y2="-26.11" layer="43"/>
<rectangle x1="0.1" y1="-26.55" x2="0.3" y2="-26.11" layer="43"/>
<rectangle x1="0.5" y1="-26.55" x2="0.7" y2="-26.11" layer="43"/>
<rectangle x1="0.9" y1="-26.55" x2="1.1" y2="-26.11" layer="43"/>
<rectangle x1="1.3" y1="-26.55" x2="1.5" y2="-26.11" layer="43"/>
<rectangle x1="1.7" y1="-26.55" x2="1.9" y2="-26.11" layer="43"/>
<rectangle x1="2.1" y1="-26.55" x2="2.3" y2="-26.11" layer="43"/>
<rectangle x1="2.5" y1="-26.55" x2="2.7" y2="-26.11" layer="43"/>
<rectangle x1="2.9" y1="-26.55" x2="3.1" y2="-26.11" layer="43"/>
<rectangle x1="3.3" y1="-26.55" x2="3.5" y2="-26.11" layer="43"/>
<rectangle x1="3.7" y1="-26.55" x2="3.9" y2="-26.11" layer="43"/>
<rectangle x1="4.1" y1="-26.55" x2="4.3" y2="-26.11" layer="43"/>
<rectangle x1="4.5" y1="-26.55" x2="4.7" y2="-26.11" layer="43"/>
<rectangle x1="4.9" y1="-26.55" x2="5.1" y2="-26.11" layer="43"/>
<rectangle x1="5.3" y1="-26.55" x2="5.5" y2="-26.11" layer="43"/>
<rectangle x1="5.7" y1="-26.55" x2="5.9" y2="-26.11" layer="43"/>
<rectangle x1="6.1" y1="-26.55" x2="6.3" y2="-26.11" layer="43"/>
<rectangle x1="6.5" y1="-26.55" x2="6.7" y2="-26.11" layer="43"/>
<rectangle x1="6.9" y1="-26.55" x2="7.1" y2="-26.11" layer="43"/>
<rectangle x1="7.3" y1="-26.55" x2="7.5" y2="-26.11" layer="43"/>
<rectangle x1="7.7" y1="-26.55" x2="7.9" y2="-26.11" layer="43"/>
<rectangle x1="-7.9" y1="-28.49" x2="-7.7" y2="-28.05" layer="43"/>
<rectangle x1="-7.5" y1="-28.49" x2="-7.3" y2="-28.05" layer="43"/>
<rectangle x1="-7.1" y1="-28.49" x2="-6.9" y2="-28.05" layer="43"/>
<rectangle x1="-6.7" y1="-28.49" x2="-6.5" y2="-28.05" layer="43"/>
<rectangle x1="-6.3" y1="-28.49" x2="-6.1" y2="-28.05" layer="43"/>
<rectangle x1="-5.9" y1="-28.49" x2="-5.7" y2="-28.05" layer="43"/>
<rectangle x1="-5.5" y1="-28.49" x2="-5.3" y2="-28.05" layer="43"/>
<rectangle x1="-5.1" y1="-28.49" x2="-4.9" y2="-28.05" layer="43"/>
<rectangle x1="-4.7" y1="-28.49" x2="-4.5" y2="-28.05" layer="43"/>
<rectangle x1="-4.3" y1="-28.49" x2="-4.1" y2="-28.05" layer="43"/>
<rectangle x1="-3.9" y1="-28.49" x2="-3.7" y2="-28.05" layer="43"/>
<rectangle x1="-3.5" y1="-28.49" x2="-3.3" y2="-28.05" layer="43"/>
<rectangle x1="-3.1" y1="-28.49" x2="-2.9" y2="-28.05" layer="43"/>
<rectangle x1="-2.7" y1="-28.49" x2="-2.5" y2="-28.05" layer="43"/>
<rectangle x1="-2.3" y1="-28.49" x2="-2.1" y2="-28.05" layer="43"/>
<rectangle x1="-1.9" y1="-28.49" x2="-1.7" y2="-28.05" layer="43"/>
<rectangle x1="-1.5" y1="-28.49" x2="-1.3" y2="-28.05" layer="43"/>
<rectangle x1="-1.1" y1="-28.49" x2="-0.9" y2="-28.05" layer="43"/>
<rectangle x1="-0.7" y1="-28.49" x2="-0.5" y2="-28.05" layer="43"/>
<rectangle x1="-0.3" y1="-28.49" x2="-0.1" y2="-28.05" layer="43"/>
<rectangle x1="0.1" y1="-28.49" x2="0.3" y2="-28.05" layer="43"/>
<rectangle x1="0.5" y1="-28.49" x2="0.7" y2="-28.05" layer="43"/>
<rectangle x1="0.9" y1="-28.49" x2="1.1" y2="-28.05" layer="43"/>
<rectangle x1="1.3" y1="-28.49" x2="1.5" y2="-28.05" layer="43"/>
<rectangle x1="1.7" y1="-28.49" x2="1.9" y2="-28.05" layer="43"/>
<rectangle x1="2.1" y1="-28.49" x2="2.3" y2="-28.05" layer="43"/>
<rectangle x1="2.5" y1="-28.49" x2="2.7" y2="-28.05" layer="43"/>
<rectangle x1="2.9" y1="-28.49" x2="3.1" y2="-28.05" layer="43"/>
<rectangle x1="3.3" y1="-28.49" x2="3.5" y2="-28.05" layer="43"/>
<rectangle x1="3.7" y1="-28.49" x2="3.9" y2="-28.05" layer="43"/>
<rectangle x1="4.1" y1="-28.49" x2="4.3" y2="-28.05" layer="43"/>
<rectangle x1="4.5" y1="-28.49" x2="4.7" y2="-28.05" layer="43"/>
<rectangle x1="4.9" y1="-28.49" x2="5.1" y2="-28.05" layer="43"/>
<rectangle x1="5.3" y1="-28.49" x2="5.5" y2="-28.05" layer="43"/>
<rectangle x1="5.7" y1="-28.49" x2="5.9" y2="-28.05" layer="43"/>
<rectangle x1="6.1" y1="-28.49" x2="6.3" y2="-28.05" layer="43"/>
<rectangle x1="6.5" y1="-28.49" x2="6.7" y2="-28.05" layer="43"/>
<rectangle x1="6.9" y1="-28.49" x2="7.1" y2="-28.05" layer="43"/>
<rectangle x1="7.3" y1="-28.49" x2="7.5" y2="-28.05" layer="43"/>
<rectangle x1="7.7" y1="-28.49" x2="7.9" y2="-28.05" layer="43"/>
<smd name="J1_39" x="-0.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_37" x="-0.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_35" x="-1" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_33" x="-1.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_31" x="-1.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_29" x="-2.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_27" x="-2.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_25" x="-3" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_23" x="-3.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_21" x="-3.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_19" x="-4.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_17" x="-4.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_15" x="-5" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_13" x="-5.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_11" x="-5.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_9" x="-6.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_7" x="-6.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_5" x="-7" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_3" x="-7.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_1" x="-7.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_41" x="0.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_43" x="0.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_45" x="1" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_47" x="1.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_49" x="1.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_51" x="2.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_53" x="2.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_55" x="3" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_57" x="3.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_59" x="3.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_61" x="4.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_63" x="4.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_65" x="5" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_67" x="5.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_69" x="5.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_71" x="6.2" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_73" x="6.6" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_75" x="7" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_77" x="7.4" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_79" x="7.8" y="17.42" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_2" x="-7.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_4" x="-7.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_6" x="-7" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_8" x="-6.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_10" x="-6.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_12" x="-5.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_14" x="-5.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_16" x="-5" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_18" x="-4.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_20" x="-4.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_22" x="-3.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_24" x="-3.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_26" x="-3" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_28" x="-2.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_30" x="-2.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_32" x="-1.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_34" x="-1.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_36" x="-1" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_38" x="-0.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_40" x="-0.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_42" x="0.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_44" x="0.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_46" x="1" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_48" x="1.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_50" x="1.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_52" x="2.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_54" x="2.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_56" x="3" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_58" x="3.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_60" x="3.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_62" x="4.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_64" x="4.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_66" x="5" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_68" x="5.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_70" x="5.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_72" x="6.2" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_74" x="6.6" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_76" x="7" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_78" x="7.4" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<smd name="J1_80" x="7.8" y="14.34" dx="0.2" dy="0.7" layer="1"/>
<hole x="-10.67" y="30.99" drill="2.25"/>
<hole x="10.67" y="30.99" drill="2.25"/>
<hole x="10.67" y="-30.99" drill="2.25"/>
<hole x="-10.67" y="-30.99" drill="2.25"/>
<smd name="J2_42" x="-0.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_44" x="-0.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_46" x="-1" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_48" x="-1.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_50" x="-1.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_52" x="-2.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_54" x="-2.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_56" x="-3" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_58" x="-3.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_60" x="-3.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_62" x="-4.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_64" x="-4.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_66" x="-5" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_68" x="-5.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_70" x="-5.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_72" x="-6.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_74" x="-6.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_76" x="-7" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_78" x="-7.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_80" x="-7.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_40" x="0.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_38" x="0.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_36" x="1" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_34" x="1.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_32" x="1.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_30" x="2.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_28" x="2.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_26" x="3" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_24" x="3.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_22" x="3.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_20" x="4.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_18" x="4.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_16" x="5" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_14" x="5.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_12" x="5.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_10" x="6.2" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_8" x="6.6" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_6" x="7" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_4" x="7.4" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_2" x="7.8" y="-25.76" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_79" x="-7.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_77" x="-7.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_75" x="-7" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_73" x="-6.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_71" x="-6.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_69" x="-5.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_67" x="-5.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_65" x="-5" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_63" x="-4.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_61" x="-4.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_59" x="-3.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_57" x="-3.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_55" x="-3" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_53" x="-2.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_51" x="-2.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_49" x="-1.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_47" x="-1.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_45" x="-1" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_43" x="-0.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_41" x="-0.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_39" x="0.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_37" x="0.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_35" x="1" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_33" x="1.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_31" x="1.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_29" x="2.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_27" x="2.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_25" x="3" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_23" x="3.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_21" x="3.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_19" x="4.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_17" x="4.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_15" x="5" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_13" x="5.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_11" x="5.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_9" x="6.2" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_7" x="6.6" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_5" x="7" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_3" x="7.4" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
<smd name="J2_1" x="7.8" y="-28.84" dx="0.2" dy="0.7" layer="1"/>
</package>
</packages>
<symbols>
<symbol name="ABX00042_J1">
<wire x1="-20.32" y1="50.8" x2="-20.32" y2="-50.8" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-50.8" x2="20.32" y2="-50.8" width="0.254" layer="94"/>
<wire x1="20.32" y1="-50.8" x2="20.32" y2="50.8" width="0.254" layer="94"/>
<wire x1="20.32" y1="50.8" x2="-20.32" y2="50.8" width="0.254" layer="94"/>
<text x="-20.32" y="52.07" size="1.778" layer="95">&gt;NAME</text>
<text x="-20.32" y="-53.34" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="20.32" y1="38.1" x2="19.05" y2="38.1" width="0.254" layer="94"/>
<wire x1="18.415" y1="38.735" x2="18.415" y2="37.465" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="35.56" x2="19.05" y2="35.56" width="0.254" layer="94"/>
<wire x1="18.415" y1="36.195" x2="18.415" y2="34.925" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="33.02" x2="19.05" y2="33.02" width="0.254" layer="94"/>
<wire x1="18.415" y1="33.655" x2="18.415" y2="32.385" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="30.48" x2="19.05" y2="30.48" width="0.254" layer="94"/>
<wire x1="18.415" y1="31.115" x2="18.415" y2="29.845" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="27.94" x2="19.05" y2="27.94" width="0.254" layer="94"/>
<wire x1="18.415" y1="28.575" x2="18.415" y2="27.305" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="25.4" x2="19.05" y2="25.4" width="0.254" layer="94"/>
<wire x1="18.415" y1="26.035" x2="18.415" y2="24.765" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="27.94" x2="-19.05" y2="27.94" width="0.254" layer="94"/>
<wire x1="-18.415" y1="27.305" x2="-18.415" y2="28.575" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="30.48" x2="-19.05" y2="30.48" width="0.254" layer="94"/>
<wire x1="-18.415" y1="29.845" x2="-18.415" y2="31.115" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="33.02" x2="-19.05" y2="33.02" width="0.254" layer="94"/>
<wire x1="-18.415" y1="32.385" x2="-18.415" y2="33.655" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="35.56" x2="-19.05" y2="35.56" width="0.254" layer="94"/>
<wire x1="-18.415" y1="34.925" x2="-18.415" y2="36.195" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="38.1" x2="-19.05" y2="38.1" width="0.254" layer="94"/>
<wire x1="-18.415" y1="37.465" x2="-18.415" y2="38.735" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="43.18" x2="-19.05" y2="43.18" width="0.254" layer="94"/>
<wire x1="-18.415" y1="42.545" x2="-18.415" y2="43.815" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="0" x2="-19.05" y2="0" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-0.635" x2="-18.415" y2="0.635" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="2.54" x2="-19.05" y2="2.54" width="0.254" layer="94"/>
<wire x1="-18.415" y1="1.905" x2="-18.415" y2="3.175" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="5.08" x2="-19.05" y2="5.08" width="0.254" layer="94"/>
<wire x1="-18.415" y1="4.445" x2="-18.415" y2="5.715" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="7.62" x2="-19.05" y2="7.62" width="0.254" layer="94"/>
<wire x1="-18.415" y1="6.985" x2="-18.415" y2="8.255" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-48.26" x2="19.05" y2="-48.26" width="0.254" layer="94"/>
<wire x1="18.415" y1="-47.625" x2="18.415" y2="-48.895" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="12.7" x2="-19.05" y2="12.7" width="0.254" layer="94"/>
<wire x1="-18.415" y1="12.065" x2="-18.415" y2="13.335" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="15.24" x2="-19.05" y2="15.24" width="0.254" layer="94"/>
<wire x1="-18.415" y1="14.605" x2="-18.415" y2="15.875" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="17.78" x2="-19.05" y2="17.78" width="0.254" layer="94"/>
<wire x1="-18.415" y1="17.145" x2="-18.415" y2="18.415" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="20.32" x2="-19.05" y2="20.32" width="0.254" layer="94"/>
<wire x1="-18.415" y1="19.685" x2="-18.415" y2="20.955" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="25.4" x2="-19.05" y2="25.4" width="0.254" layer="94"/>
<wire x1="-18.415" y1="24.765" x2="-18.415" y2="26.035" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-30.48" x2="-19.05" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-31.115" x2="-18.415" y2="-29.845" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-27.94" x2="-19.05" y2="-27.94" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-28.575" x2="-18.415" y2="-27.305" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-25.4" x2="-19.05" y2="-25.4" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-26.035" x2="-18.415" y2="-24.765" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-22.86" x2="-19.05" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-23.495" x2="-18.415" y2="-22.225" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-20.32" x2="-19.05" y2="-20.32" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-20.955" x2="-18.415" y2="-19.685" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="45.72" x2="19.05" y2="45.72" width="0.254" layer="94"/>
<wire x1="18.415" y1="45.085" x2="18.415" y2="46.355" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-15.24" x2="-19.05" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-15.875" x2="-18.415" y2="-14.605" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-12.7" x2="-19.05" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-13.335" x2="-18.415" y2="-12.065" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-7.62" x2="-19.05" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-8.255" x2="-18.415" y2="-6.985" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-5.08" x2="-19.05" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-5.715" x2="-18.415" y2="-4.445" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="20.32" x2="19.05" y2="20.32" width="0.254" layer="94"/>
<wire x1="18.415" y1="20.955" x2="18.415" y2="19.685" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="17.78" x2="19.05" y2="17.78" width="0.254" layer="94"/>
<wire x1="18.415" y1="18.415" x2="18.415" y2="17.145" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="7.62" x2="19.05" y2="7.62" width="0.254" layer="94"/>
<wire x1="18.415" y1="8.255" x2="18.415" y2="6.985" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="5.08" x2="19.05" y2="5.08" width="0.254" layer="94"/>
<wire x1="18.415" y1="5.715" x2="18.415" y2="4.445" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="2.54" x2="19.05" y2="2.54" width="0.254" layer="94"/>
<wire x1="18.415" y1="3.175" x2="18.415" y2="1.905" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="0" x2="19.05" y2="0" width="0.254" layer="94"/>
<wire x1="18.415" y1="0.635" x2="18.415" y2="-0.635" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-5.08" x2="19.05" y2="-5.08" width="0.254" layer="94"/>
<wire x1="18.415" y1="-4.445" x2="18.415" y2="-5.715" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-7.62" x2="19.05" y2="-7.62" width="0.254" layer="94"/>
<wire x1="18.415" y1="-6.985" x2="18.415" y2="-8.255" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-20.32" x2="19.05" y2="-20.32" width="0.254" layer="94"/>
<wire x1="18.415" y1="-19.685" x2="18.415" y2="-20.955" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-22.86" x2="19.05" y2="-22.86" width="0.254" layer="94"/>
<wire x1="18.415" y1="-22.225" x2="18.415" y2="-23.495" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-25.4" x2="19.05" y2="-25.4" width="0.254" layer="94"/>
<wire x1="18.415" y1="-24.765" x2="18.415" y2="-26.035" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-27.94" x2="19.05" y2="-27.94" width="0.254" layer="94"/>
<wire x1="18.415" y1="-27.305" x2="18.415" y2="-28.575" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-33.02" x2="19.05" y2="-33.02" width="0.254" layer="94"/>
<wire x1="18.415" y1="-32.385" x2="18.415" y2="-33.655" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-35.56" x2="19.05" y2="-35.56" width="0.254" layer="94"/>
<wire x1="18.415" y1="-34.925" x2="18.415" y2="-36.195" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="48.26" x2="19.05" y2="48.26" width="0.254" layer="94"/>
<wire x1="18.415" y1="48.895" x2="18.415" y2="47.625" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-43.18" x2="-19.05" y2="-43.18" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-43.815" x2="-18.415" y2="-42.545" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-40.64" x2="-19.05" y2="-40.64" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-41.275" x2="-18.415" y2="-40.005" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-38.1" x2="-19.05" y2="-38.1" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-38.735" x2="-18.415" y2="-37.465" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-33.02" x2="-19.05" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-33.655" x2="-18.415" y2="-32.385" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-45.72" x2="-19.05" y2="-45.72" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-46.355" x2="-18.415" y2="-45.085" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-43.18" x2="19.05" y2="-43.18" width="0.254" layer="94"/>
<wire x1="18.415" y1="-42.545" x2="18.415" y2="-43.815" width="0.254" layer="94" curve="-180"/>
<pin name="ETH_A+" x="-25.4" y="38.1" length="middle" direction="in"/>
<pin name="ETH_A-" x="-25.4" y="35.56" length="middle" direction="in"/>
<pin name="ETH_B+" x="-25.4" y="33.02" length="middle" direction="in"/>
<pin name="ETH_B-" x="-25.4" y="30.48" length="middle" direction="in"/>
<pin name="DSI_D1+" x="25.4" y="38.1" length="middle" rot="R180"/>
<pin name="DSI_D1-" x="25.4" y="35.56" length="middle" rot="R180"/>
<pin name="DSI_D0+" x="25.4" y="33.02" length="middle" rot="R180"/>
<pin name="DSI_D0-" x="25.4" y="30.48" length="middle" rot="R180"/>
<pin name="ETH_L1" x="-25.4" y="27.94" length="middle" direction="out"/>
<pin name="DSI_CK+" x="25.4" y="27.94" length="middle" rot="R180"/>
<pin name="ETH_L2" x="-25.4" y="25.4" length="middle" direction="out"/>
<pin name="DSI_CK-" x="25.4" y="25.4" length="middle" rot="R180"/>
<pin name="VIN" x="-25.4" y="43.18" length="middle" direction="in"/>
<pin name="USB1_VBUS" x="-25.4" y="20.32" length="middle" direction="pwr"/>
<pin name="USB1_D+" x="-25.4" y="17.78" length="middle"/>
<pin name="USB1_D-" x="-25.4" y="15.24" length="middle"/>
<pin name="USB1_ID" x="-25.4" y="12.7" length="middle"/>
<pin name="GND" x="25.4" y="-48.26" length="middle" direction="pwr" rot="R180"/>
<pin name="UART1_TX" x="-25.4" y="7.62" length="middle" direction="out"/>
<pin name="UART1_RX" x="-25.4" y="5.08" length="middle" direction="in"/>
<pin name="UART1_RTS" x="-25.4" y="2.54" length="middle"/>
<pin name="UART1_CTS" x="-25.4" y="0" length="middle"/>
<pin name="I2C1_SDA" x="-25.4" y="-5.08" length="middle"/>
<pin name="I2C1_SCL" x="-25.4" y="-7.62" length="middle" direction="in"/>
<pin name="CAN1_TX" x="-25.4" y="-12.7" length="middle" direction="out"/>
<pin name="CAN1_RX" x="-25.4" y="-15.24" length="middle" direction="in"/>
<pin name="VSYS" x="25.4" y="45.72" length="middle" direction="pwr" rot="R180"/>
<pin name="SDC_CLK" x="-25.4" y="-20.32" length="middle" direction="in"/>
<pin name="SDC_CMD" x="-25.4" y="-22.86" length="middle" direction="in"/>
<pin name="SDC_D0" x="-25.4" y="-25.4" length="middle"/>
<pin name="USB0_D+" x="25.4" y="20.32" length="middle" rot="R180"/>
<pin name="USB0_D-" x="25.4" y="17.78" length="middle" rot="R180"/>
<pin name="UART0_TX" x="25.4" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="UART0_RX" x="25.4" y="5.08" length="middle" direction="in" rot="R180"/>
<pin name="UART0_RTS" x="25.4" y="2.54" length="middle" rot="R180"/>
<pin name="UART0_CTS" x="25.4" y="0" length="middle" rot="R180"/>
<pin name="I2C0_SDA" x="25.4" y="-5.08" length="middle" rot="R180"/>
<pin name="I2C0_SCL" x="25.4" y="-7.62" length="middle" direction="in" rot="R180"/>
<pin name="I2S_MCK" x="25.4" y="-20.32" length="middle" rot="R180"/>
<pin name="I2S_WS" x="25.4" y="-22.86" length="middle" rot="R180"/>
<pin name="I2S_DI" x="25.4" y="-25.4" length="middle" direction="in" rot="R180"/>
<pin name="I2S_DO" x="25.4" y="-27.94" length="middle" direction="out" rot="R180"/>
<pin name="DMIC_CK" x="25.4" y="-33.02" length="middle" rot="R180"/>
<pin name="DMIC_D0" x="25.4" y="-35.56" length="middle" rot="R180"/>
<pin name="V-SDCARD" x="25.4" y="48.26" length="middle" direction="pwr" rot="R180"/>
<pin name="SDC_D1" x="-25.4" y="-27.94" length="middle"/>
<pin name="SDC_D2" x="-25.4" y="-30.48" length="middle"/>
<pin name="SDC_D3" x="-25.4" y="-33.02" length="middle"/>
<pin name="!RESET" x="-25.4" y="-38.1" length="middle" direction="in"/>
<pin name="SWDIO" x="-25.4" y="-40.64" length="middle"/>
<pin name="SWCK" x="-25.4" y="-43.18" length="middle" direction="in"/>
<pin name="SWO" x="-25.4" y="-45.72" length="middle" direction="out"/>
<pin name="NC" x="25.4" y="-43.18" length="middle" direction="nc" rot="R180"/>
</symbol>
<symbol name="ABX00042_J2">
<wire x1="-20.32" y1="48.26" x2="-20.32" y2="-43.18" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-43.18" x2="-20.32" y2="-48.26" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-48.26" x2="20.32" y2="-48.26" width="0.254" layer="94"/>
<wire x1="20.32" y1="-48.26" x2="20.32" y2="48.26" width="0.254" layer="94"/>
<wire x1="20.32" y1="48.26" x2="-20.32" y2="48.26" width="0.254" layer="94"/>
<text x="-20.32" y="49.53" size="1.778" layer="95">&gt;NAME</text>
<text x="-20.32" y="-50.8" size="1.778" layer="96">&gt;VALUE</text>
<wire x1="20.32" y1="38.1" x2="19.05" y2="38.1" width="0.254" layer="94"/>
<wire x1="18.415" y1="38.735" x2="18.415" y2="37.465" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="35.56" x2="19.05" y2="35.56" width="0.254" layer="94"/>
<wire x1="18.415" y1="36.195" x2="18.415" y2="34.925" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="33.02" x2="19.05" y2="33.02" width="0.254" layer="94"/>
<wire x1="18.415" y1="33.655" x2="18.415" y2="32.385" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="30.48" x2="19.05" y2="30.48" width="0.254" layer="94"/>
<wire x1="18.415" y1="31.115" x2="18.415" y2="29.845" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="27.94" x2="19.05" y2="27.94" width="0.254" layer="94"/>
<wire x1="18.415" y1="28.575" x2="18.415" y2="27.305" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="25.4" x2="19.05" y2="25.4" width="0.254" layer="94"/>
<wire x1="18.415" y1="26.035" x2="18.415" y2="24.765" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="22.86" x2="19.05" y2="22.86" width="0.254" layer="94"/>
<wire x1="18.415" y1="23.495" x2="18.415" y2="22.225" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="20.32" x2="19.05" y2="20.32" width="0.254" layer="94"/>
<wire x1="18.415" y1="20.955" x2="18.415" y2="19.685" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="17.78" x2="19.05" y2="17.78" width="0.254" layer="94"/>
<wire x1="18.415" y1="18.415" x2="18.415" y2="17.145" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="15.24" x2="19.05" y2="15.24" width="0.254" layer="94"/>
<wire x1="18.415" y1="15.875" x2="18.415" y2="14.605" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="30.48" x2="-19.05" y2="30.48" width="0.254" layer="94"/>
<wire x1="-18.415" y1="29.845" x2="-18.415" y2="31.115" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="33.02" x2="-19.05" y2="33.02" width="0.254" layer="94"/>
<wire x1="-18.415" y1="32.385" x2="-18.415" y2="33.655" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="35.56" x2="-19.05" y2="35.56" width="0.254" layer="94"/>
<wire x1="-18.415" y1="34.925" x2="-18.415" y2="36.195" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="38.1" x2="-19.05" y2="38.1" width="0.254" layer="94"/>
<wire x1="-18.415" y1="37.465" x2="-18.415" y2="38.735" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-45.72" x2="19.05" y2="-45.72" width="0.254" layer="94"/>
<wire x1="18.415" y1="-46.355" x2="18.415" y2="-45.085" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="22.86" x2="-19.05" y2="22.86" width="0.254" layer="94"/>
<wire x1="-18.415" y1="22.225" x2="-18.415" y2="23.495" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="25.4" x2="-19.05" y2="25.4" width="0.254" layer="94"/>
<wire x1="-18.415" y1="24.765" x2="-18.415" y2="26.035" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="45.72" x2="19.05" y2="45.72" width="0.254" layer="94"/>
<wire x1="18.415" y1="45.085" x2="18.415" y2="46.355" width="0.254" layer="94" curve="180"/>
<wire x1="20.32" y1="-12.7" x2="19.05" y2="-12.7" width="0.254" layer="94"/>
<wire x1="18.415" y1="-13.335" x2="18.415" y2="-12.065" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="5.08" x2="-19.05" y2="5.08" width="0.254" layer="94"/>
<wire x1="-18.415" y1="4.445" x2="-18.415" y2="5.715" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="7.62" x2="-19.05" y2="7.62" width="0.254" layer="94"/>
<wire x1="-18.415" y1="6.985" x2="-18.415" y2="8.255" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="10.16" x2="-19.05" y2="10.16" width="0.254" layer="94"/>
<wire x1="-18.415" y1="9.525" x2="-18.415" y2="10.795" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="15.24" x2="-19.05" y2="15.24" width="0.254" layer="94"/>
<wire x1="-18.415" y1="14.605" x2="-18.415" y2="15.875" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="17.78" x2="-19.05" y2="17.78" width="0.254" layer="94"/>
<wire x1="-18.415" y1="17.145" x2="-18.415" y2="18.415" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="12.7" x2="19.05" y2="12.7" width="0.254" layer="94"/>
<wire x1="18.415" y1="13.335" x2="18.415" y2="12.065" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="7.62" x2="19.05" y2="7.62" width="0.254" layer="94"/>
<wire x1="18.415" y1="8.255" x2="18.415" y2="6.985" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="5.08" x2="19.05" y2="5.08" width="0.254" layer="94"/>
<wire x1="18.415" y1="5.715" x2="18.415" y2="4.445" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="0" x2="19.05" y2="0" width="0.254" layer="94"/>
<wire x1="18.415" y1="0.635" x2="18.415" y2="-0.635" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-2.54" x2="19.05" y2="-2.54" width="0.254" layer="94"/>
<wire x1="18.415" y1="-1.905" x2="18.415" y2="-3.175" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-5.08" x2="19.05" y2="-5.08" width="0.254" layer="94"/>
<wire x1="18.415" y1="-4.445" x2="18.415" y2="-5.715" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-7.62" x2="19.05" y2="-7.62" width="0.254" layer="94"/>
<wire x1="18.415" y1="-6.985" x2="18.415" y2="-8.255" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-27.94" x2="-19.05" y2="-27.94" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-27.305" x2="-18.415" y2="-28.575" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-30.48" x2="-19.05" y2="-30.48" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-29.845" x2="-18.415" y2="-31.115" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-33.02" x2="-19.05" y2="-33.02" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-32.385" x2="-18.415" y2="-33.655" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-35.56" x2="-19.05" y2="-35.56" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-34.925" x2="-18.415" y2="-36.195" width="0.254" layer="94" curve="180"/>
<wire x1="-18.415" y1="-37.465" x2="-18.415" y2="-38.735" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-38.1" x2="-19.05" y2="-38.1" width="0.254" layer="94"/>
<wire x1="-20.32" y1="-40.64" x2="-19.05" y2="-40.64" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-40.005" x2="-18.415" y2="-41.275" width="0.254" layer="94" curve="180"/>
<wire x1="20.32" y1="-25.4" x2="19.05" y2="-25.4" width="0.254" layer="94"/>
<wire x1="18.415" y1="-24.765" x2="18.415" y2="-26.035" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-27.94" x2="19.05" y2="-27.94" width="0.254" layer="94"/>
<wire x1="18.415" y1="-27.305" x2="18.415" y2="-28.575" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-30.48" x2="19.05" y2="-30.48" width="0.254" layer="94"/>
<wire x1="18.415" y1="-29.845" x2="18.415" y2="-31.115" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-33.02" x2="19.05" y2="-33.02" width="0.254" layer="94"/>
<wire x1="18.415" y1="-32.385" x2="18.415" y2="-33.655" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-35.56" x2="19.05" y2="-35.56" width="0.254" layer="94"/>
<wire x1="18.415" y1="-34.925" x2="18.415" y2="-36.195" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-40.64" x2="19.05" y2="-40.64" width="0.254" layer="94"/>
<wire x1="18.415" y1="-40.005" x2="18.415" y2="-41.275" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-2.54" x2="-19.05" y2="-2.54" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-1.905" x2="-18.415" y2="-3.175" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-15.24" x2="-19.05" y2="-15.24" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-14.605" x2="-18.415" y2="-15.875" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-5.08" x2="-19.05" y2="-5.08" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-5.715" x2="-18.415" y2="-4.445" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="0" x2="-19.05" y2="0" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-0.635" x2="-18.415" y2="0.635" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="43.18" x2="19.05" y2="43.18" width="0.254" layer="94"/>
<wire x1="18.415" y1="43.815" x2="18.415" y2="42.545" width="0.254" layer="94" curve="-180"/>
<wire x1="20.32" y1="-22.86" x2="19.05" y2="-22.86" width="0.254" layer="94"/>
<wire x1="18.415" y1="-23.495" x2="18.415" y2="-22.225" width="0.254" layer="94" curve="180"/>
<wire x1="20.32" y1="-20.32" x2="19.05" y2="-20.32" width="0.254" layer="94"/>
<wire x1="18.415" y1="-20.955" x2="18.415" y2="-19.685" width="0.254" layer="94" curve="180"/>
<wire x1="20.32" y1="-17.78" x2="19.05" y2="-17.78" width="0.254" layer="94"/>
<wire x1="18.415" y1="-18.415" x2="18.415" y2="-17.145" width="0.254" layer="94" curve="180"/>
<wire x1="20.32" y1="-15.24" x2="19.05" y2="-15.24" width="0.254" layer="94"/>
<wire x1="18.415" y1="-15.875" x2="18.415" y2="-14.605" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-17.78" x2="-19.05" y2="-17.78" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-17.145" x2="-18.415" y2="-18.415" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-7.62" x2="-19.05" y2="-7.62" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-8.255" x2="-18.415" y2="-6.985" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-10.16" x2="-19.05" y2="-10.16" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-10.795" x2="-18.415" y2="-9.525" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-20.32" x2="-19.05" y2="-20.32" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-19.685" x2="-18.415" y2="-20.955" width="0.254" layer="94" curve="180"/>
<wire x1="-20.32" y1="-12.7" x2="-19.05" y2="-12.7" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-13.335" x2="-18.415" y2="-12.065" width="0.254" layer="94" curve="-180"/>
<wire x1="-20.32" y1="-22.86" x2="-19.05" y2="-22.86" width="0.254" layer="94"/>
<wire x1="-18.415" y1="-22.225" x2="-18.415" y2="-23.495" width="0.254" layer="94" curve="180"/>
<wire x1="-18.415" y1="-42.545" x2="-19.05" y2="-43.18" width="0.254" layer="94" curve="90"/>
<wire x1="-19.05" y1="-43.18" x2="-18.415" y2="-43.815" width="0.254" layer="94" curve="90"/>
<wire x1="-20.32" y1="-43.18" x2="-19.05" y2="-43.18" width="0.254" layer="94"/>
<pin name="FORCE_BOOTLOADER" x="-25.4" y="38.1" length="middle" direction="in"/>
<pin name="BOOT_SOURCE" x="-25.4" y="35.56" length="middle" direction="in"/>
<pin name="POWER_ON_REQ" x="-25.4" y="33.02" length="middle" direction="in"/>
<pin name="COINCELL" x="-25.4" y="30.48" length="middle" direction="in"/>
<pin name="UART3_TX" x="-25.4" y="25.4" length="middle" direction="out"/>
<pin name="UART3_RX" x="-25.4" y="22.86" length="middle" direction="in"/>
<pin name="GND_1" x="25.4" y="-45.72" length="middle" direction="pwr" rot="R180"/>
<pin name="I2C2_SDA" x="-25.4" y="17.78" length="middle"/>
<pin name="I2C2_SCL" x="-25.4" y="15.24" length="middle" direction="in"/>
<pin name="SAI_CK" x="-25.4" y="10.16" length="middle" direction="in"/>
<pin name="SAI_FS" x="-25.4" y="7.62" length="middle"/>
<pin name="SAI_D0" x="-25.4" y="5.08" length="middle"/>
<pin name="PWM_1" x="25.4" y="-12.7" length="middle" rot="R180"/>
<pin name="PWM_2" x="25.4" y="-15.24" length="middle" rot="R180"/>
<pin name="PWM_3" x="25.4" y="-17.78" length="middle" rot="R180"/>
<pin name="PWM_4" x="25.4" y="-20.32" length="middle" rot="R180"/>
<pin name="PWM_5" x="25.4" y="-22.86" length="middle" rot="R180"/>
<pin name="VCC/+3V3" x="25.4" y="43.18" length="middle" direction="pwr" rot="R180"/>
<pin name="ADC_VREF+" x="-25.4" y="0" length="middle" direction="in"/>
<pin name="ADC_A0" x="-25.4" y="-5.08" length="middle" direction="in"/>
<pin name="ADC_A1" x="-25.4" y="-7.62" length="middle" direction="in"/>
<pin name="ADC_A2" x="-25.4" y="-10.16" length="middle" direction="in"/>
<pin name="CAM_CLK" x="25.4" y="15.24" length="middle" rot="R180"/>
<pin name="CAM_VS" x="25.4" y="17.78" length="middle" rot="R180"/>
<pin name="CAM_D0" x="25.4" y="20.32" length="middle" rot="R180"/>
<pin name="CAM_D1" x="25.4" y="22.86" length="middle" rot="R180"/>
<pin name="CAM_D2" x="25.4" y="25.4" length="middle" rot="R180"/>
<pin name="CAM_D3" x="25.4" y="27.94" length="middle" rot="R180"/>
<pin name="CAM_D4" x="25.4" y="30.48" length="middle" rot="R180"/>
<pin name="CAM_D5" x="25.4" y="33.02" length="middle" rot="R180"/>
<pin name="CAM_D6" x="25.4" y="35.56" length="middle" rot="R180"/>
<pin name="CAM_D7" x="25.4" y="38.1" length="middle" rot="R180"/>
<pin name="SPI1_MISO" x="25.4" y="-5.08" length="middle" direction="out" rot="R180"/>
<pin name="SPI1_CK" x="25.4" y="-2.54" length="middle" direction="in" rot="R180"/>
<pin name="SPI1_CS" x="25.4" y="0" length="middle" direction="in" rot="R180"/>
<pin name="VCC" x="25.4" y="45.72" length="middle" direction="pwr" rot="R180"/>
<pin name="UART2_RX" x="25.4" y="5.08" length="middle" direction="in" rot="R180"/>
<pin name="UART2_TX" x="25.4" y="7.62" length="middle" direction="out" rot="R180"/>
<pin name="CAM_HS" x="25.4" y="12.7" length="middle" rot="R180"/>
<pin name="PWM_6" x="25.4" y="-25.4" length="middle" rot="R180"/>
<pin name="GPIO_6" x="-25.4" y="-43.18" length="middle"/>
<pin name="GPIO_5" x="-25.4" y="-40.64" length="middle"/>
<pin name="GPIO_4" x="-25.4" y="-38.1" length="middle"/>
<pin name="GPIO_3" x="-25.4" y="-35.56" length="middle"/>
<pin name="GPIO_2" x="-25.4" y="-33.02" length="middle"/>
<pin name="GPIO_1" x="-25.4" y="-30.48" length="middle"/>
<pin name="GPIO_0" x="-25.4" y="-27.94" length="middle"/>
<pin name="SPI1_MOSI" x="25.4" y="-7.62" length="middle" direction="in" rot="R180"/>
<pin name="ADC_A7" x="-25.4" y="-22.86" length="middle" direction="in"/>
<pin name="ADC_A6" x="-25.4" y="-20.32" length="middle" direction="in"/>
<pin name="ADC_A5" x="-25.4" y="-17.78" length="middle" direction="in"/>
<pin name="ADC_A4" x="-25.4" y="-15.24" length="middle" direction="in"/>
<pin name="ADC_VREF-" x="-25.4" y="-2.54" length="middle" direction="in"/>
<pin name="NC_1" x="25.4" y="-40.64" length="middle" direction="nc" rot="R180"/>
<pin name="PWM_10" x="25.4" y="-35.56" length="middle" rot="R180"/>
<pin name="PWM_9" x="25.4" y="-33.02" length="middle" rot="R180"/>
<pin name="PWM_8" x="25.4" y="-30.48" length="middle" rot="R180"/>
<pin name="PWM_7" x="25.4" y="-27.94" length="middle" rot="R180"/>
<pin name="ADC_A3" x="-25.4" y="-12.7" length="middle" direction="in"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="ABX00042" prefix="U">
<description>STM32H747 Portenta H7 series ARM Cortex-M4, Cortex-M7 MCU 32-Bit Embedded Evaluation Board  &lt;a href="https://pricing.snapeda.com/parts/ABX00042/Arduino/view-part?ref=eda"&gt;Check availability&lt;/a&gt;</description>
<gates>
<gate name="G$1" symbol="ABX00042_J1" x="-35.56" y="0" swaplevel="1"/>
<gate name="G$2" symbol="ABX00042_J2" x="35.56" y="0" swaplevel="2"/>
</gates>
<devices>
<device name="" package="MODULE_ABX00042">
<connects>
<connect gate="G$1" pin="!RESET" pad="J1_73"/>
<connect gate="G$1" pin="CAN1_RX" pad="J1_51"/>
<connect gate="G$1" pin="CAN1_TX" pad="J1_49"/>
<connect gate="G$1" pin="DMIC_CK" pad="J1_66"/>
<connect gate="G$1" pin="DMIC_D0" pad="J1_68"/>
<connect gate="G$1" pin="DSI_CK+" pad="J1_18"/>
<connect gate="G$1" pin="DSI_CK-" pad="J1_20"/>
<connect gate="G$1" pin="DSI_D0+" pad="J1_14"/>
<connect gate="G$1" pin="DSI_D0-" pad="J1_16"/>
<connect gate="G$1" pin="DSI_D1+" pad="J1_10"/>
<connect gate="G$1" pin="DSI_D1-" pad="J1_12"/>
<connect gate="G$1" pin="ETH_A+" pad="J1_1"/>
<connect gate="G$1" pin="ETH_A-" pad="J1_3"/>
<connect gate="G$1" pin="ETH_B+" pad="J1_5"/>
<connect gate="G$1" pin="ETH_B-" pad="J1_7"/>
<connect gate="G$1" pin="ETH_L1" pad="J1_17"/>
<connect gate="G$1" pin="ETH_L2" pad="J1_19"/>
<connect gate="G$1" pin="GND" pad="J1_22 J1_31 J1_42 J1_47 J1_54"/>
<connect gate="G$1" pin="I2C0_SCL" pad="J1_46"/>
<connect gate="G$1" pin="I2C0_SDA" pad="J1_44"/>
<connect gate="G$1" pin="I2C1_SCL" pad="J1_45"/>
<connect gate="G$1" pin="I2C1_SDA" pad="J1_43"/>
<connect gate="G$1" pin="I2S_DI" pad="J1_60"/>
<connect gate="G$1" pin="I2S_DO" pad="J1_62"/>
<connect gate="G$1" pin="I2S_MCK" pad="J1_56"/>
<connect gate="G$1" pin="I2S_WS" pad="J1_58"/>
<connect gate="G$1" pin="NC" pad="J1_2 J1_4 J1_6 J1_8 J1_9 J1_11 J1_13 J1_15 J1_24 J1_30 J1_50 J1_52 J1_67 J1_69 J1_70 J1_71 J1_74 J1_76 J1_78 J1_80"/>
<connect gate="G$1" pin="SDC_CLK" pad="J1_55"/>
<connect gate="G$1" pin="SDC_CMD" pad="J1_57"/>
<connect gate="G$1" pin="SDC_D0" pad="J1_59"/>
<connect gate="G$1" pin="SDC_D1" pad="J1_61"/>
<connect gate="G$1" pin="SDC_D2" pad="J1_63"/>
<connect gate="G$1" pin="SDC_D3" pad="J1_65"/>
<connect gate="G$1" pin="SWCK" pad="J1_77"/>
<connect gate="G$1" pin="SWDIO" pad="J1_75"/>
<connect gate="G$1" pin="SWO" pad="J1_79"/>
<connect gate="G$1" pin="UART0_CTS" pad="J1_40"/>
<connect gate="G$1" pin="UART0_RTS" pad="J1_38"/>
<connect gate="G$1" pin="UART0_RX" pad="J1_36"/>
<connect gate="G$1" pin="UART0_TX" pad="J1_34"/>
<connect gate="G$1" pin="UART1_CTS" pad="J1_39"/>
<connect gate="G$1" pin="UART1_RTS" pad="J1_37"/>
<connect gate="G$1" pin="UART1_RX" pad="J1_35"/>
<connect gate="G$1" pin="UART1_TX" pad="J1_33"/>
<connect gate="G$1" pin="USB0_D+" pad="J1_26"/>
<connect gate="G$1" pin="USB0_D-" pad="J1_28"/>
<connect gate="G$1" pin="USB1_D+" pad="J1_25"/>
<connect gate="G$1" pin="USB1_D-" pad="J1_27"/>
<connect gate="G$1" pin="USB1_ID" pad="J1_29"/>
<connect gate="G$1" pin="USB1_VBUS" pad="J1_23"/>
<connect gate="G$1" pin="V-SDCARD" pad="J1_72"/>
<connect gate="G$1" pin="VIN" pad="J1_21 J1_32 J1_41 J1_48"/>
<connect gate="G$1" pin="VSYS" pad="J1_53 J1_64"/>
<connect gate="G$2" pin="ADC_A0" pad="J2_73"/>
<connect gate="G$2" pin="ADC_A1" pad="J2_75"/>
<connect gate="G$2" pin="ADC_A2" pad="J2_77"/>
<connect gate="G$2" pin="ADC_A3" pad="J2_79"/>
<connect gate="G$2" pin="ADC_A4" pad="J2_74"/>
<connect gate="G$2" pin="ADC_A5" pad="J2_76"/>
<connect gate="G$2" pin="ADC_A6" pad="J2_78"/>
<connect gate="G$2" pin="ADC_A7" pad="J2_80"/>
<connect gate="G$2" pin="ADC_VREF+" pad="J2_71"/>
<connect gate="G$2" pin="ADC_VREF-" pad="J2_72"/>
<connect gate="G$2" pin="BOOT_SOURCE" pad="J2_3"/>
<connect gate="G$2" pin="CAM_CLK" pad="J2_20"/>
<connect gate="G$2" pin="CAM_D0" pad="J2_16"/>
<connect gate="G$2" pin="CAM_D1" pad="J2_14"/>
<connect gate="G$2" pin="CAM_D2" pad="J2_12"/>
<connect gate="G$2" pin="CAM_D3" pad="J2_10"/>
<connect gate="G$2" pin="CAM_D4" pad="J2_8"/>
<connect gate="G$2" pin="CAM_D5" pad="J2_6"/>
<connect gate="G$2" pin="CAM_D6" pad="J2_4"/>
<connect gate="G$2" pin="CAM_D7" pad="J2_2"/>
<connect gate="G$2" pin="CAM_HS" pad="J2_22"/>
<connect gate="G$2" pin="CAM_VS" pad="J2_18"/>
<connect gate="G$2" pin="COINCELL" pad="J2_7"/>
<connect gate="G$2" pin="FORCE_BOOTLOADER" pad="J2_1"/>
<connect gate="G$2" pin="GND_1" pad="J2_24 J2_33 J2_44 J2_57 J2_70"/>
<connect gate="G$2" pin="GPIO_0" pad="J2_46"/>
<connect gate="G$2" pin="GPIO_1" pad="J2_48"/>
<connect gate="G$2" pin="GPIO_2" pad="J2_50"/>
<connect gate="G$2" pin="GPIO_3" pad="J2_52"/>
<connect gate="G$2" pin="GPIO_4" pad="J2_54"/>
<connect gate="G$2" pin="GPIO_5" pad="J2_56"/>
<connect gate="G$2" pin="GPIO_6" pad="J2_58"/>
<connect gate="G$2" pin="I2C2_SCL" pad="J2_47"/>
<connect gate="G$2" pin="I2C2_SDA" pad="J2_45"/>
<connect gate="G$2" pin="NC_1" pad="J2_9 J2_11 J2_13 J2_15 J2_17 J2_19 J2_21 J2_29 J2_30 J2_31 J2_32 J2_35 J2_37 J2_39 J2_41 J2_55"/>
<connect gate="G$2" pin="POWER_ON_REQ" pad="J2_5"/>
<connect gate="G$2" pin="PWM_1" pad="J2_59"/>
<connect gate="G$2" pin="PWM_10" pad="J2_68"/>
<connect gate="G$2" pin="PWM_2" pad="J2_61"/>
<connect gate="G$2" pin="PWM_3" pad="J2_63"/>
<connect gate="G$2" pin="PWM_4" pad="J2_65"/>
<connect gate="G$2" pin="PWM_5" pad="J2_67"/>
<connect gate="G$2" pin="PWM_6" pad="J2_60"/>
<connect gate="G$2" pin="PWM_7" pad="J2_62"/>
<connect gate="G$2" pin="PWM_8" pad="J2_64"/>
<connect gate="G$2" pin="PWM_9" pad="J2_66"/>
<connect gate="G$2" pin="SAI_CK" pad="J2_49"/>
<connect gate="G$2" pin="SAI_D0" pad="J2_53"/>
<connect gate="G$2" pin="SAI_FS" pad="J2_51"/>
<connect gate="G$2" pin="SPI1_CK" pad="J2_38"/>
<connect gate="G$2" pin="SPI1_CS" pad="J2_36"/>
<connect gate="G$2" pin="SPI1_MISO" pad="J2_40"/>
<connect gate="G$2" pin="SPI1_MOSI" pad="J2_42"/>
<connect gate="G$2" pin="UART2_RX" pad="J2_28"/>
<connect gate="G$2" pin="UART2_TX" pad="J2_26"/>
<connect gate="G$2" pin="UART3_RX" pad="J2_27"/>
<connect gate="G$2" pin="UART3_TX" pad="J2_25"/>
<connect gate="G$2" pin="VCC" pad="J2_34"/>
<connect gate="G$2" pin="VCC/+3V3" pad="J2_23 J2_43 J2_69"/>
</connects>
<technologies>
<technology name="">
<attribute name="AVAILABILITY" value="In Stock"/>
<attribute name="CHECK_PRICES" value="https://www.snapeda.com/parts/ABX00042/Arduino/view-part/?ref=eda"/>
<attribute name="DESCRIPTION" value=" Development Boards &amp; Kits - ARM Portenta H7 | Arduino ABX00042 "/>
<attribute name="MF" value="Arduino"/>
<attribute name="MP" value="ABX00042"/>
<attribute name="PACKAGE" value="None"/>
<attribute name="PRICE" value="None"/>
<attribute name="PURCHASE-URL" value="https://www.snapeda.com/api/url_track_click_mouser/?unipart_id=6801596&amp;manufacturer=Arduino&amp;part_name=ABX00042&amp;search_term=None"/>
<attribute name="SNAPEDA_LINK" value="https://www.snapeda.com/parts/ABX00042/Arduino/view-part/?ref=snap"/>
</technology>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="microbuilder">
<description>&lt;h2&gt;&lt;b&gt;microBuilder.eu&lt;/b&gt; Eagle Footprint Library&lt;/h2&gt;

&lt;p&gt;Footprints for common components used in our projects and products.  This is the same library that we use internally, and it is regularly updated.  The newest version can always be found at &lt;b&gt;www.microBuilder.eu&lt;/b&gt;.  If you find this library useful, please feel free to purchase something from our online store. Please also note that all holes are optimised for metric drill bits!&lt;/p&gt;

&lt;h3&gt;Obligatory Warning&lt;/h3&gt;
&lt;p&gt;While it probably goes without saying, there are no guarantees that the footprints or schematic symbols in this library are flawless, and we make no promises of fitness for production, prototyping or any other purpose. These libraries are provided for information puposes only, and are used at your own discretion.  While we make every effort to produce accurate footprints, and many of the items found in this library have be proven in production, we can't make any promises of suitability for a specific purpose. If you do find any errors, though, please feel free to contact us at www.microbuilder.eu to let us know about it so that we can update the library accordingly!&lt;/p&gt;

&lt;h3&gt;License&lt;/h3&gt;
&lt;p&gt;This work is placed in the public domain, and may be freely used for commercial and non-commercial work with the following conditions:&lt;/p&gt;
&lt;p&gt;THIS SOFTWARE IS PROVIDED ''AS IS'' AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE INSTITUTE OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING,  BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
&lt;/p&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.27" y1="0" x2="1.27" y2="0" width="0.254" layer="94"/>
<text x="-1.524" y="-2.54" size="1.27" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
<symbol name="3.3V">
<wire x1="-1.27" y1="-1.27" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="1.27" y2="-1.27" width="0.254" layer="94"/>
<text x="-1.524" y="1.016" size="1.27" layer="96">&gt;VALUE</text>
<pin name="3.3V" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND">
<description>&lt;b&gt;GND&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="3.3V">
<description>&lt;b&gt;3.3V Supply&lt;/b&gt;</description>
<gates>
<gate name="G$1" symbol="3.3V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="supply1" urn="urn:adsk.eagle:library:371">
<description>&lt;b&gt;Supply Symbols&lt;/b&gt;&lt;p&gt;
 GND, VCC, 0V, +5V, -5V, etc.&lt;p&gt;
 Please keep in mind, that these devices are necessary for the
 automatic wiring of the supply signals.&lt;p&gt;
 The pin name defined in the symbol is identical to the net which is to be wired automatically.&lt;p&gt;
 In this library the device names are the same as the pin names of the symbols, therefore the correct signal names appear next to the supply symbols in the schematic.&lt;p&gt;
 &lt;author&gt;Created by librarian@cadsoft.de&lt;/author&gt;</description>
<packages>
</packages>
<symbols>
<symbol name="VCC" urn="urn:adsk.eagle:symbol:26928/1" library_version="1">
<wire x1="1.27" y1="-1.905" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="-1.27" y2="-1.905" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96" rot="R90">&gt;VALUE</text>
<pin name="VCC" x="0" y="-2.54" visible="off" length="short" direction="sup" rot="R90"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="VCC" urn="urn:adsk.eagle:component:26957/1" prefix="P+" library_version="1">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="VCC" symbol="VCC" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun">
<packages>
</packages>
<symbols>
<symbol name="GND">
<wire x1="-1.905" y1="0" x2="1.905" y2="0" width="0.254" layer="94"/>
<text x="-2.54" y="-2.54" size="1.778" layer="96">&gt;VALUE</text>
<pin name="GND" x="0" y="2.54" visible="off" length="short" direction="sup" rot="R270"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="GND" prefix="GND">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
<gates>
<gate name="1" symbol="GND" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkFun-PowerSymbols">
<description>&lt;h3&gt;SparkFun Power Symbols&lt;/h3&gt;
This library contains power, ground, and voltage-supply symbols.
&lt;br&gt;
&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is &lt;b&gt; the end user's responsibility&lt;/b&gt; to ensure correctness and suitablity for a given componet or application. 
&lt;br&gt;
&lt;br&gt;If you enjoy using this library, please buy one of our products at &lt;a href=" www.sparkfun.com"&gt;SparkFun.com&lt;/a&gt;.
&lt;br&gt;
&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;
&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
</packages>
<symbols>
<symbol name="3.3V">
<description>&lt;h3&gt;3.3V Voltage Supply&lt;/h3&gt;</description>
<wire x1="0.762" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-0.762" y2="1.27" width="0.254" layer="94"/>
<pin name="3.3V" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
<text x="0" y="2.794" size="1.778" layer="96" align="bottom-center">&gt;VALUE</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="3.3V" prefix="SUPPLY">
<description>&lt;h3&gt;3.3V Supply Symbol&lt;/h3&gt;
&lt;p&gt;Power supply symbol for a specifically-stated 3.3V source.&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="3.3V" x="0" y="0"/>
</gates>
<devices>
<device name="">
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="SparkX">
<packages>
<package name="1X04">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.81" y1="0.635" x2="4.445" y2="1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="1.27" x2="5.715" y2="1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="5.715" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="5.715" y1="-1.27" x2="4.445" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="4.445" y1="-1.27" x2="3.81" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="6.985" y1="1.27" x2="6.35" y2="0.635" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.635" x2="6.985" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="-1.27" x2="6.985" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.27" x2="1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.635" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.27" y1="0.635" x2="1.905" y2="1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="1.27" x2="3.175" y2="1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="1.27" x2="3.81" y2="0.635" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-0.635" x2="3.175" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="3.175" y1="-1.27" x2="1.905" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-1.27" x2="1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.27" x2="-1.27" y2="0.635" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.635" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.635" x2="8.89" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_NO_SILK">
<description>&lt;h3&gt;Plated Through Hole - 4 Pin No Silk Outline&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_1MM_RA">
<description>&lt;h3&gt;SMD- 4 Pin Right Angle &lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:4&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_04&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.5" y1="-4.6" x2="1.5" y2="-4.6" width="0.254" layer="21"/>
<wire x1="-3" y1="-2" x2="-3" y2="-0.35" width="0.254" layer="21"/>
<wire x1="2.25" y1="-0.35" x2="3" y2="-0.35" width="0.254" layer="21"/>
<wire x1="3" y1="-0.35" x2="3" y2="-2" width="0.254" layer="21"/>
<wire x1="-3" y1="-0.35" x2="-2.25" y2="-0.35" width="0.254" layer="21"/>
<circle x="-2.5" y="0.3" radius="0.1414" width="0.4" layer="21"/>
<smd name="NC2" x="-2.8" y="-3.675" dx="1.2" dy="2" layer="1"/>
<smd name="NC1" x="2.8" y="-3.675" dx="1.2" dy="2" layer="1"/>
<smd name="1" x="-1.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="2" x="-0.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="3" x="0.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="4" x="1.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<text x="-1.397" y="-2.159" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-3.302" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X04_1MM_RA_STRESSRELIEF">
<wire x1="-1.5" y1="-4.6" x2="1.5" y2="-4.6" width="0.254" layer="21"/>
<wire x1="-3" y1="-2" x2="-3" y2="-0.35" width="0.254" layer="21"/>
<wire x1="2.25" y1="-0.35" x2="3" y2="-0.35" width="0.254" layer="21"/>
<wire x1="3" y1="-0.35" x2="3" y2="-2" width="0.254" layer="21"/>
<wire x1="-3" y1="-0.35" x2="-2.25" y2="-0.35" width="0.254" layer="21"/>
<circle x="-2.5" y="0.3" radius="0.1414" width="0.4" layer="21"/>
<smd name="NC2" x="-2.8" y="-3.675" dx="1.2" dy="2" layer="1"/>
<smd name="NC1" x="2.8" y="-3.675" dx="1.2" dy="2" layer="1"/>
<smd name="1" x="-1.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="2" x="-0.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="3" x="0.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<smd name="4" x="1.5" y="0" dx="0.6" dy="1.35" layer="1"/>
<text x="-1.397" y="-2.159" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-3.302" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<rectangle x1="-4" y1="-8" x2="4" y2="-6" layer="46"/>
<rectangle x1="-4" y1="-10" x2="-2" y2="-8" layer="46"/>
<wire x1="-2" y1="-10.16" x2="-2" y2="-8" width="0.3048" layer="20"/>
<wire x1="-2" y1="-8" x2="4" y2="-8" width="0.3048" layer="20"/>
<wire x1="4" y1="-8" x2="4" y2="-6" width="0.3048" layer="20"/>
<wire x1="4" y1="-6" x2="-4" y2="-6" width="0.3048" layer="20"/>
<wire x1="-4" y1="-6" x2="-4" y2="-10.16" width="0.3048" layer="20"/>
</package>
</packages>
<symbols>
<symbol name="I2C_STANDARD">
<description>&lt;h3&gt;SparkFun I&lt;sup&gt;2&lt;/sup&gt;C Standard Pinout Header&lt;/h3&gt;
&lt;p&gt;SparkFun has standardized on a pinout for all I&lt;sup&gt;2&lt;/sup&gt;C based sensor breakouts.&lt;br&gt;</description>
<wire x1="3.81" y1="-5.08" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="1.27" y1="2.54" x2="2.54" y2="2.54" width="0.6096" layer="94"/>
<wire x1="1.27" y1="0" x2="2.54" y2="0" width="0.6096" layer="94"/>
<wire x1="1.27" y1="-2.54" x2="2.54" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="-5.08" y2="-5.08" width="0.4064" layer="94"/>
<wire x1="3.81" y1="-5.08" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="7.62" x2="3.81" y2="7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="5.08" x2="2.54" y2="5.08" width="0.6096" layer="94"/>
<text x="-5.08" y="-5.334" size="1.778" layer="96" font="vector" align="top-left">&gt;VALUE</text>
<text x="-5.08" y="7.874" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="GND" x="7.62" y="-2.54" visible="pad" length="middle" direction="pwr" swaplevel="1" rot="R180"/>
<pin name="VCC" x="7.62" y="0" visible="pad" length="middle" direction="pwr" swaplevel="1" rot="R180"/>
<pin name="SDA" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="SCL" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<text x="-4.572" y="2.54" size="1.778" layer="94" font="vector" align="center-left">SDA</text>
<text x="-4.572" y="0" size="1.778" layer="94" font="vector" align="center-left">VCC</text>
<text x="-4.572" y="-2.54" size="1.778" layer="94" font="vector" align="center-left">GND</text>
<text x="-4.572" y="5.08" size="1.778" layer="94" font="vector" align="center-left">SCL</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="I2C_STANDARD" prefix="J" uservalue="yes">
<description>&lt;h3&gt;SparkFun I&lt;sup&gt;2&lt;/sup&gt;C Standard Pinout Header&lt;/h3&gt;
&lt;p&gt;SparkFun has standardized on a pinout for all I&lt;sup&gt;2&lt;/sup&gt;C based sensor breakouts.&lt;br&gt;
&lt;br&gt;
This pinout allows I&lt;sup&gt;2&lt;/sup&gt;C boards to be plugged directly into the headers on Arduino Uno compatible boards, and
to be daisy chained easily.&lt;/p&gt;
&lt;p&gt;&lt;b&gt;Example SparkFun Products:&lt;/b&gt;
&lt;ul&gt;&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/13676"&gt;SparkFun Atmospheric Sensor Breakout - BME280&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=”https://www.sparkfun.com/products/11084”&gt;SparkFun Altitude/Pressure Sensor Breakout - MPL3115A2&lt;/a&gt;&lt;/li&gt;
&lt;li&gt;&lt;a href=”https://www.sparkfun.com/products/12785”&gt;SparkFun TOF Range Finder Sensor - VL6180&lt;/a&gt;&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<gates>
<gate name="G$1" symbol="I2C_STANDARD" x="2.54" y="0"/>
</gates>
<devices>
<device name="SILK" package="1X04">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="SCL" pad="4"/>
<connect gate="G$1" pin="SDA" pad="3"/>
<connect gate="G$1" pin="VCC" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="_NO_SILK" package="1X04_NO_SILK">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="SCL" pad="4"/>
<connect gate="G$1" pin="SDA" pad="3"/>
<connect gate="G$1" pin="VCC" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="JS-1MM" package="1X04_1MM_RA">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="SCL" pad="4"/>
<connect gate="G$1" pin="SDA" pad="3"/>
<connect gate="G$1" pin="VCC" pad="2"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SR" package="1X04_1MM_RA_STRESSRELIEF">
<connects>
<connect gate="G$1" pin="GND" pad="1"/>
<connect gate="G$1" pin="SCL" pad="2"/>
<connect gate="G$1" pin="SDA" pad="3"/>
<connect gate="G$1" pin="VCC" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="MIKROE-4903">
<packages>
<package name="MIKROE-ALTITUDE-6-CLICK-PINOUT">
<description>Footprint of the Altitude 6 Click MikroBus pinout</description>
<rectangle x1="0" y1="0" x2="27.94" y2="28.575" layer="47"/>
<dimension x1="-0.635" y1="28.575" x2="-0.635" y2="0" x3="-2.54" y3="14.2875" textsize="1.27" layer="47"/>
<pad name="PWM" x="2.54" y="22.86" drill="0.9" shape="square"/>
<pad name="INT" x="2.54" y="20.32" drill="0.9"/>
<pad name="RX" x="2.54" y="17.78" drill="0.9"/>
<pad name="TX" x="2.54" y="15.24" drill="0.9"/>
<pad name="SCL" x="2.54" y="12.7" drill="0.9"/>
<pad name="SDA" x="2.54" y="10.16" drill="0.9"/>
<pad name="5V" x="2.54" y="7.62" drill="0.9"/>
<pad name="GND_0" x="2.54" y="5.08" drill="0.9"/>
<pad name="AN" x="25.4" y="22.86" drill="0.9" shape="square"/>
<pad name="RST" x="25.4" y="20.32" drill="0.9"/>
<pad name="CS" x="25.4" y="17.78" drill="0.9"/>
<pad name="SCK" x="25.4" y="15.24" drill="0.9"/>
<pad name="MISO" x="25.4" y="12.7" drill="0.9"/>
<pad name="MOSI" x="25.4" y="10.16" drill="0.9"/>
<pad name="3.3V" x="25.4" y="7.62" drill="0.9"/>
<pad name="GND_1" x="25.4" y="5.08" drill="0.9"/>
<dimension x1="-1.27" y1="24.13" x2="-1.27" y2="3.81" x3="0" y3="13.97" textsize="1.27" layer="47"/>
<dimension x1="0" y1="0" x2="27.94" y2="0" x3="13.97" y3="-2.54" textsize="1.27" layer="47"/>
<wire x1="0" y1="24.13" x2="3.81" y2="27.94" width="0.127" layer="21" curve="-80.537678"/>
<wire x1="27.94" y1="24.13" x2="24.13" y2="27.94" width="0.127" layer="21" curve="80.537678"/>
<wire x1="27.94" y1="3.81" x2="25.4" y2="1.27" width="0.127" layer="21" curve="-75.963757"/>
<wire x1="0" y1="3.81" x2="2.54" y2="1.27" width="0.127" layer="21" curve="90"/>
<wire x1="2.54" y1="1.27" x2="25.4" y2="1.27" width="0.127" layer="21"/>
<wire x1="27.94" y1="3.81" x2="27.94" y2="24.13" width="0.127" layer="21"/>
<wire x1="24.13" y1="27.94" x2="3.81" y2="27.94" width="0.127" layer="21"/>
<wire x1="0" y1="24.13" x2="0" y2="3.81" width="0.127" layer="21"/>
<text x="21.59" y="22.86" size="0.8128" layer="21">AN</text>
<text x="21.59" y="20.32" size="0.8128" layer="21">RST</text>
<text x="21.59" y="17.78" size="0.8128" layer="21">CS</text>
<text x="21.59" y="15.24" size="0.8128" layer="21">SCK</text>
<text x="21.59" y="12.7" size="0.8128" layer="21">MISO</text>
<text x="21.59" y="10.16" size="0.8128" layer="21">MOSI</text>
<text x="21.59" y="7.62" size="0.8128" layer="21">3.3V</text>
<text x="21.59" y="5.08" size="0.8128" layer="21">GND</text>
<text x="3.81" y="22.86" size="0.8128" layer="21">PWM</text>
<text x="3.81" y="20.32" size="0.8128" layer="21">INT</text>
<text x="3.81" y="17.78" size="0.8128" layer="21">RX</text>
<text x="3.81" y="15.24" size="0.8128" layer="21">TX</text>
<text x="3.81" y="12.7" size="0.8128" layer="21">SCL</text>
<text x="3.81" y="10.16" size="0.8128" layer="21">SDA</text>
<text x="3.81" y="7.62" size="0.8128" layer="21">5V</text>
<text x="3.81" y="5.08" size="0.8128" layer="21">GND</text>
<text x="14.224" y="25.781" size="0.8128" layer="21">mikro</text>
<text x="14.224" y="24.511" size="1.016" layer="21">BUS</text>
<circle x="11.557" y="26.289" radius="0.283978125" width="0.127" layer="21"/>
<circle x="12.827" y="26.289" radius="0.283978125" width="0.127" layer="21"/>
<circle x="10.922" y="24.765" radius="0.283978125" width="0.127" layer="21"/>
<circle x="12.192" y="24.765" radius="0.283978125" width="0.127" layer="21"/>
<circle x="13.462" y="24.765" radius="0.283978125" width="0.127" layer="21"/>
<wire x1="10.922" y1="25.019" x2="10.922" y2="25.527" width="0.127" layer="21"/>
<wire x1="10.922" y1="25.527" x2="11.557" y2="25.527" width="0.127" layer="21"/>
<wire x1="11.557" y1="25.527" x2="12.192" y2="25.527" width="0.127" layer="21"/>
<wire x1="12.192" y1="25.527" x2="12.827" y2="25.527" width="0.127" layer="21"/>
<wire x1="12.827" y1="25.527" x2="13.462" y2="25.527" width="0.127" layer="21"/>
<wire x1="13.462" y1="25.527" x2="13.462" y2="25.019" width="0.127" layer="21"/>
<wire x1="12.192" y1="25.019" x2="12.192" y2="25.527" width="0.127" layer="21"/>
<wire x1="12.827" y1="25.527" x2="12.827" y2="25.908" width="0.127" layer="21"/>
<wire x1="11.557" y1="25.527" x2="11.557" y2="25.908" width="0.127" layer="21"/>
</package>
</packages>
<symbols>
<symbol name="MIKROE-ALTITUDE-6-CLICK-PINOUT">
<description>Schematic capture of Altitude 6 Click MikroBus</description>
<wire x1="0" y1="22.86" x2="0" y2="0" width="0.254" layer="94"/>
<wire x1="0" y1="0" x2="7.62" y2="0" width="0.254" layer="94"/>
<wire x1="7.62" y1="0" x2="7.62" y2="22.86" width="0.254" layer="94"/>
<wire x1="7.62" y1="22.86" x2="0" y2="22.86" width="0.254" layer="94"/>
<wire x1="30.48" y1="22.86" x2="30.48" y2="0" width="0.254" layer="94"/>
<wire x1="30.48" y1="0" x2="38.1" y2="0" width="0.254" layer="94"/>
<wire x1="38.1" y1="0" x2="38.1" y2="22.86" width="0.254" layer="94"/>
<wire x1="38.1" y1="22.86" x2="30.48" y2="22.86" width="0.254" layer="94"/>
<pin name="AN" x="2.54" y="20.32" visible="pad" length="middle" rot="R180"/>
<pin name="RST" x="2.54" y="17.78" visible="pad" length="middle" swaplevel="1" rot="R180"/>
<pin name="CS" x="2.54" y="15.24" visible="pad" length="middle" swaplevel="2" rot="R180"/>
<pin name="SCK" x="2.54" y="12.7" visible="pad" length="middle" swaplevel="3" rot="R180"/>
<pin name="MISO" x="2.54" y="10.16" visible="pad" length="middle" swaplevel="4" rot="R180"/>
<pin name="MOSI" x="2.54" y="7.62" visible="pad" length="middle" swaplevel="5" rot="R180"/>
<pin name="3.3V" x="2.54" y="5.08" visible="pad" length="middle" swaplevel="6" rot="R180"/>
<pin name="GND_0" x="2.54" y="2.54" visible="pad" length="middle" swaplevel="7" rot="R180"/>
<pin name="PWM" x="33.02" y="20.32" visible="pad" length="middle" swaplevel="8" rot="R180"/>
<pin name="INT" x="33.02" y="17.78" visible="pad" length="middle" swaplevel="9" rot="R180"/>
<pin name="RX" x="33.02" y="15.24" visible="pad" length="middle" swaplevel="10" rot="R180"/>
<pin name="TX" x="33.02" y="12.7" visible="pad" length="middle" swaplevel="11" rot="R180"/>
<pin name="SCL" x="33.02" y="10.16" visible="pad" length="middle" swaplevel="12" rot="R180"/>
<pin name="SDA" x="33.02" y="7.62" visible="pad" length="middle" swaplevel="13" rot="R180"/>
<pin name="5V" x="33.02" y="5.08" visible="pad" length="middle" swaplevel="14" rot="R180"/>
<pin name="GND_1" x="33.02" y="2.54" visible="pad" length="middle" swaplevel="15" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="MIKROE-ALTITUDE-6-CLICK-DVC">
<description>Device for the Mikroe Altitude 6 Click device</description>
<gates>
<gate name="G$1" symbol="MIKROE-ALTITUDE-6-CLICK-PINOUT" x="-20.32" y="-33.02"/>
</gates>
<devices>
<device name="" package="MIKROE-ALTITUDE-6-CLICK-PINOUT">
<connects>
<connect gate="G$1" pin="3.3V" pad="3.3V"/>
<connect gate="G$1" pin="5V" pad="5V"/>
<connect gate="G$1" pin="AN" pad="AN"/>
<connect gate="G$1" pin="CS" pad="CS"/>
<connect gate="G$1" pin="GND_0" pad="GND_0"/>
<connect gate="G$1" pin="GND_1" pad="GND_1"/>
<connect gate="G$1" pin="INT" pad="INT"/>
<connect gate="G$1" pin="MISO" pad="MISO"/>
<connect gate="G$1" pin="MOSI" pad="MOSI"/>
<connect gate="G$1" pin="PWM" pad="PWM"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="RX" pad="RX"/>
<connect gate="G$1" pin="SCK" pad="SCK"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="TX" pad="TX"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
<library name="ADAFRUIT_BNO08x">
<packages>
<package name="ADAFRUIT_BNO08X_FOOTPRINT">
<description>Layout footprint for the Adafruit BNO08x</description>
<text x="7.62" y="2.159" size="1.016" layer="21" font="vector" ratio="14" align="center">VIN</text>
<text x="10.16" y="5.461" size="1.016" layer="21" font="vector" ratio="14" align="center">3Vo</text>
<text x="12.7" y="2.159" size="1.016" layer="21" font="vector" ratio="14" align="center">GND</text>
<text x="15.24" y="5.461" size="1.016" layer="21" font="vector" ratio="14" align="center">SCL</text>
<text x="17.78" y="2.159" size="1.016" layer="21" font="vector" ratio="14" align="center">SDA</text>
<text x="20.701" y="2.159" size="1.016" layer="21" font="vector" ratio="14" align="center">INT</text>
<text x="13.97" y="19.05" size="1.4732" layer="21" font="vector" ratio="15" align="center">BNO08x 9-DoF</text>
<text x="12.319" y="23.368" size="1.016" layer="21" font="vector" ratio="14" align="center">P1</text>
<text x="7.2136" y="23.3172" size="1.016" layer="21" font="vector" ratio="14" align="center">BT</text>
<text x="9.6266" y="23.3172" size="1.016" layer="21" font="vector" ratio="14" align="center">P0</text>
<text x="16.129" y="23.368" size="1.016" layer="21" font="vector" ratio="14" align="center">RST</text>
<text x="18.6055" y="23.368" size="1.016" layer="21" font="vector" ratio="14" align="center">DI</text>
<text x="21.1455" y="23.368" size="1.016" layer="21" font="vector" ratio="14" align="center">CS</text>
<text x="18.665" y="9.5895" size="1.27" layer="21" font="vector" ratio="20">Y</text>
<text x="22.61" y="7.6825" size="1.27" layer="21" font="vector" ratio="20" rot="R180">X</text>
<text x="18.665" y="6.4145" size="1.27" layer="21" font="vector" ratio="20">Z</text>
<polygon width="0.254" layer="21">
<vertex x="20.197" y="6.9205"/>
<vertex x="20.197" y="7.1745"/>
<vertex x="20.832" y="7.1745"/>
<vertex x="20.832" y="7.4285"/>
<vertex x="21.34" y="7.0475"/>
<vertex x="20.832" y="6.6665"/>
<vertex x="20.832" y="6.9205"/>
</polygon>
<polygon width="0.254" layer="21">
<vertex x="19.3" y="8.0655"/>
<vertex x="19.046" y="8.0655"/>
<vertex x="19.046" y="8.7005"/>
<vertex x="18.792" y="8.7005"/>
<vertex x="19.173" y="9.2085"/>
<vertex x="19.554" y="8.7005"/>
<vertex x="19.3" y="8.7005"/>
</polygon>
<wire x1="20.197" y1="7.0475" x2="19.181" y2="6.0315" width="0.254" layer="21" curve="-90"/>
<wire x1="19.181" y1="6.0315" x2="18.165" y2="7.0475" width="0.254" layer="21" curve="-90"/>
<wire x1="18.165" y1="7.0475" x2="19.181" y2="8.0635" width="0.254" layer="21" curve="-90"/>
<wire x1="19.181" y1="8.0635" x2="20.197" y2="7.0475" width="0.254" layer="21" curve="-92"/>
<pad name="BT" x="7.62" y="21.59" drill="1" diameter="1.778"/>
<pad name="P0" x="10.16" y="21.59" drill="1" diameter="1.778"/>
<pad name="P1" x="12.7" y="21.59" drill="1" diameter="1.778"/>
<pad name="RST" x="15.24" y="21.59" drill="1" diameter="1.778"/>
<pad name="DI" x="17.78" y="21.59" drill="1" diameter="1.778"/>
<pad name="CS" x="20.32" y="21.59" drill="1" diameter="1.778"/>
<pad name="VIN" x="7.62" y="3.81" drill="1" diameter="1.778"/>
<pad name="3VO" x="10.16" y="3.81" drill="1" diameter="1.778"/>
<pad name="GND" x="12.7" y="3.81" drill="1" diameter="1.778"/>
<pad name="SCL" x="15.24" y="3.81" drill="1" diameter="1.778"/>
<pad name="SDA" x="17.78" y="3.81" drill="1" diameter="1.778"/>
<pad name="INT" x="20.32" y="3.81" drill="1" diameter="1.778"/>
<wire x1="3.81" y1="24.13" x2="24.13" y2="24.13" width="0.1524" layer="21"/>
<wire x1="26.67" y1="21.59" x2="26.67" y2="3.81" width="0.1524" layer="21"/>
<wire x1="24.13" y1="1.27" x2="3.81" y2="1.27" width="0.1524" layer="21"/>
<wire x1="1.27" y1="21.59" x2="1.27" y2="3.81" width="0.1524" layer="21"/>
<wire x1="1.27" y1="3.81" x2="3.81" y2="1.27" width="0.1524" layer="21" curve="90"/>
<wire x1="3.81" y1="24.13" x2="1.27" y2="21.59" width="0.1524" layer="21" curve="90"/>
<wire x1="24.13" y1="24.13" x2="26.67" y2="21.59" width="0.1524" layer="21" curve="-90"/>
<wire x1="26.67" y1="3.81" x2="24.13" y2="1.27" width="0.1524" layer="21" curve="-90"/>
</package>
</packages>
<symbols>
<symbol name="ADAFRUIT_BNO08X_PINOUT">
<description>Pinout schematic capture for the Adafruit BNO08x</description>
<wire x1="2.54" y1="17.78" x2="2.54" y2="0" width="0.1524" layer="94"/>
<wire x1="2.54" y1="0" x2="10.16" y2="0" width="0.1524" layer="94"/>
<wire x1="10.16" y1="0" x2="10.16" y2="17.78" width="0.1524" layer="94"/>
<wire x1="10.16" y1="17.78" x2="2.54" y2="17.78" width="0.1524" layer="94"/>
<wire x1="27.94" y1="17.78" x2="27.94" y2="0" width="0.1524" layer="94"/>
<wire x1="27.94" y1="0" x2="35.56" y2="0" width="0.1524" layer="94"/>
<wire x1="35.56" y1="0" x2="35.56" y2="17.78" width="0.1524" layer="94"/>
<wire x1="35.56" y1="17.78" x2="27.94" y2="17.78" width="0.1524" layer="94"/>
<pin name="VCC" x="7.62" y="15.24" visible="off" length="short" rot="R180"/>
<pin name="3.3V" x="7.62" y="12.7" visible="off" length="short" rot="R180"/>
<pin name="GND" x="7.62" y="10.16" visible="off" length="short" rot="R180"/>
<pin name="SCL" x="7.62" y="7.62" visible="off" length="short" rot="R180"/>
<pin name="SDA" x="7.62" y="5.08" visible="off" length="short" rot="R180"/>
<pin name="INT" x="7.62" y="2.54" visible="off" length="short" rot="R180"/>
<pin name="BOOT" x="33.02" y="15.24" visible="off" length="short" rot="R180"/>
<pin name="PS0" x="33.02" y="12.7" visible="off" length="short" rot="R180"/>
<pin name="PS1" x="33.02" y="10.16" visible="off" length="short" rot="R180"/>
<pin name="RST" x="33.02" y="7.62" visible="off" length="short" rot="R180"/>
<pin name="MOSI" x="33.02" y="5.08" visible="off" length="short" rot="R180"/>
<pin name="CS" x="33.02" y="2.54" visible="off" length="short" rot="R180"/>
<wire x1="5.08" y1="15.24" x2="-2.54" y2="15.24" width="0.1524" layer="91"/>
<wire x1="5.08" y1="12.7" x2="-2.54" y2="12.7" width="0.1524" layer="91"/>
<wire x1="5.08" y1="10.16" x2="-2.54" y2="10.16" width="0.1524" layer="91"/>
<wire x1="5.08" y1="7.62" x2="-2.54" y2="7.62" width="0.1524" layer="91"/>
<wire x1="5.08" y1="5.08" x2="-2.54" y2="5.08" width="0.1524" layer="91"/>
<wire x1="5.08" y1="2.54" x2="-2.54" y2="2.54" width="0.1524" layer="91"/>
<text x="-2.54" y="15.24" size="1.778" layer="95">VCC</text>
<text x="-2.54" y="12.7" size="1.778" layer="95">3.3V</text>
<text x="-2.54" y="7.62" size="1.778" layer="95">SCL</text>
<text x="-2.54" y="5.08" size="1.778" layer="95">SDA</text>
<text x="-2.54" y="2.54" size="1.778" layer="95">INT</text>
<text x="-2.54" y="10.16" size="1.778" layer="95">GND</text>
<wire x1="30.48" y1="15.24" x2="22.86" y2="15.24" width="0.1524" layer="91"/>
<wire x1="30.48" y1="12.7" x2="22.86" y2="12.7" width="0.1524" layer="91"/>
<wire x1="30.48" y1="10.16" x2="22.86" y2="10.16" width="0.1524" layer="91"/>
<wire x1="30.48" y1="7.62" x2="22.86" y2="7.62" width="0.1524" layer="91"/>
<wire x1="30.48" y1="5.08" x2="22.86" y2="5.08" width="0.1524" layer="91"/>
<wire x1="30.48" y1="2.54" x2="22.86" y2="2.54" width="0.1524" layer="91"/>
<text x="22.86" y="15.24" size="1.778" layer="95">BOOT</text>
<text x="22.86" y="12.7" size="1.778" layer="95">PS0</text>
<text x="22.86" y="7.62" size="1.778" layer="95">RST</text>
<text x="22.86" y="5.08" size="1.778" layer="95">MOSI</text>
<text x="22.86" y="2.54" size="1.778" layer="95">CS</text>
<text x="22.86" y="10.16" size="1.778" layer="95">PS1</text>
</symbol>
</symbols>
<devicesets>
<deviceset name="ADAFRUIT_BNO08X">
<description>Adafruit BNO08x Device</description>
<gates>
<gate name="G$1" symbol="ADAFRUIT_BNO08X_PINOUT" x="0" y="0"/>
</gates>
<devices>
<device name="" package="ADAFRUIT_BNO08X_FOOTPRINT">
<connects>
<connect gate="G$1" pin="3.3V" pad="3VO"/>
<connect gate="G$1" pin="BOOT" pad="BT"/>
<connect gate="G$1" pin="CS" pad="CS"/>
<connect gate="G$1" pin="GND" pad="GND"/>
<connect gate="G$1" pin="INT" pad="INT"/>
<connect gate="G$1" pin="MOSI" pad="DI"/>
<connect gate="G$1" pin="PS0" pad="P0"/>
<connect gate="G$1" pin="PS1" pad="P1"/>
<connect gate="G$1" pin="RST" pad="RST"/>
<connect gate="G$1" pin="SCL" pad="SCL"/>
<connect gate="G$1" pin="SDA" pad="SDA"/>
<connect gate="G$1" pin="VCC" pad="VIN"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
</devicesets>
</library>
</libraries>
<attributes>
</attributes>
<variantdefs>
</variantdefs>
<classes>
<class number="0" name="default" width="0" drill="0">
</class>
<class number="1" name="vcc" width="0.1524" drill="0">
</class>
<class number="2" name="lowpower" width="0.254" drill="0.381">
</class>
</classes>
<parts>
<part name="PORTENTA_H7" library="ABX00042" deviceset="ABX00042" device=""/>
<part name="SUPPLY7" library="SparkFun-PowerSymbols" deviceset="3.3V" device=""/>
<part name="J3" library="SparkX" deviceset="I2C_STANDARD" device="_NO_SILK" value="PTH"/>
<part name="GND12" library="SparkFun" deviceset="GND" device=""/>
<part name="U$2" library="microbuilder" deviceset="GND" device=""/>
<part name="U$3" library="microbuilder" deviceset="GND" device=""/>
<part name="P+2" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device=""/>
<part name="U$4" library="microbuilder" deviceset="3.3V" device=""/>
<part name="U$1" library="MIKROE-4903" deviceset="MIKROE-ALTITUDE-6-CLICK-DVC" device=""/>
<part name="P+3" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device=""/>
<part name="U$6" library="microbuilder" deviceset="3.3V" device=""/>
<part name="U$7" library="microbuilder" deviceset="GND" device=""/>
<part name="U$5" library="ADAFRUIT_BNO08x" deviceset="ADAFRUIT_BNO08X" device=""/>
</parts>
<sheets>
<sheet>
<plain>
<text x="0" y="5.08" size="1.778" layer="91">ACE SCHEMATIC</text>
<text x="0" y="-10.16" size="1.778" layer="91">Note: Portenta H7 is not lite version. Should be fine, given only VIN, GND, and any serial comm/electromotive/analog IO will be used</text>
<text x="109.22" y="78.74" size="1.778" layer="91">OpenLog Comms Pinout</text>
<text x="106.68" y="124.46" size="1.778" layer="91">BNO085 Comms Pinout</text>
<text x="187.96" y="124.46" size="1.778" layer="91">Altitude 6 Click Pinout</text>
</plain>
<instances>
<instance part="PORTENTA_H7" gate="G$1" x="50.8" y="71.12" smashed="yes">
<attribute name="NAME" x="30.48" y="123.19" size="1.778" layer="95"/>
<attribute name="VALUE" x="30.48" y="17.78" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY7" gate="G$1" x="119.38" y="71.12" smashed="yes">
<attribute name="VALUE" x="119.38" y="73.914" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="J3" gate="G$1" x="129.54" y="63.5" smashed="yes" rot="MR0">
<attribute name="VALUE" x="134.62" y="58.166" size="1.778" layer="96" font="vector" rot="MR0" align="top-left"/>
<attribute name="NAME" x="134.62" y="71.374" size="1.778" layer="95" font="vector" rot="MR0"/>
</instance>
<instance part="GND12" gate="1" x="119.38" y="55.88" smashed="yes">
<attribute name="VALUE" x="116.84" y="53.34" size="1.778" layer="96"/>
</instance>
<instance part="U$2" gate="G$1" x="203.2" y="93.98" smashed="yes">
<attribute name="VALUE" x="201.676" y="91.44" size="1.27" layer="96"/>
</instance>
<instance part="U$3" gate="G$1" x="233.68" y="93.98" smashed="yes">
<attribute name="VALUE" x="232.156" y="91.44" size="1.27" layer="96"/>
</instance>
<instance part="P+2" gate="VCC" x="210.82" y="109.22" smashed="yes">
<attribute name="VALUE" x="208.28" y="106.68" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="U$4" gate="G$1" x="180.34" y="109.22" smashed="yes">
<attribute name="VALUE" x="178.816" y="110.236" size="1.27" layer="96"/>
</instance>
<instance part="U$1" gate="G$1" x="190.5" y="93.98" smashed="yes"/>
<instance part="P+3" gate="VCC" x="114.3" y="119.38" smashed="yes">
<attribute name="VALUE" x="111.76" y="116.84" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="U$6" gate="G$1" x="106.68" y="119.38" smashed="yes">
<attribute name="VALUE" x="105.156" y="120.396" size="1.27" layer="96"/>
</instance>
<instance part="U$7" gate="G$1" x="137.16" y="104.14" smashed="yes">
<attribute name="VALUE" x="135.636" y="101.6" size="1.27" layer="96"/>
</instance>
<instance part="U$5" gate="G$1" x="121.92" y="96.52" smashed="yes"/>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="2">
<segment>
<pinref part="J3" gate="G$1" pin="GND"/>
<wire x1="121.92" y1="60.96" x2="119.38" y2="60.96" width="0.1524" layer="91"/>
<wire x1="119.38" y1="60.96" x2="119.38" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="U$2" gate="G$1" pin="GND"/>
<pinref part="U$1" gate="G$1" pin="GND_0"/>
<wire x1="193.04" y1="96.52" x2="203.2" y2="96.52" width="0.1524" layer="91"/>
</segment>
<segment>
<pinref part="U$7" gate="G$1" pin="GND"/>
<wire x1="127" y1="106.68" x2="129.54" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U$5" gate="G$1" pin="GND"/>
<wire x1="129.54" y1="106.68" x2="137.16" y2="106.68" width="0.1524" layer="91"/>
<junction x="129.54" y="106.68"/>
</segment>
</net>
<net name="VCC" class="2">
<segment>
<wire x1="218.44" y1="99.06" x2="215.9" y2="99.06" width="0.1524" layer="91"/>
<wire x1="215.9" y1="99.06" x2="210.82" y2="99.06" width="0.1524" layer="91"/>
<wire x1="210.82" y1="99.06" x2="210.82" y2="106.68" width="0.1524" layer="91"/>
<pinref part="P+2" gate="VCC" pin="VCC"/>
<pinref part="U$1" gate="G$1" pin="5V"/>
<wire x1="223.52" y1="99.06" x2="218.44" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="119.38" y1="111.76" x2="114.3" y2="111.76" width="0.1524" layer="91"/>
<wire x1="114.3" y1="111.76" x2="114.3" y2="116.84" width="0.1524" layer="91"/>
<pinref part="P+3" gate="VCC" pin="VCC"/>
<pinref part="U$5" gate="G$1" pin="VCC"/>
<wire x1="129.54" y1="111.76" x2="119.38" y2="111.76" width="0.1524" layer="91"/>
</segment>
</net>
<net name="3.3V" class="2">
<segment>
<pinref part="J3" gate="G$1" pin="VCC"/>
<wire x1="121.92" y1="63.5" x2="119.38" y2="63.5" width="0.1524" layer="91"/>
<wire x1="119.38" y1="63.5" x2="119.38" y2="71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY7" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<wire x1="187.96" y1="99.06" x2="185.42" y2="99.06" width="0.1524" layer="91"/>
<wire x1="185.42" y1="99.06" x2="180.34" y2="99.06" width="0.1524" layer="91"/>
<wire x1="180.34" y1="99.06" x2="180.34" y2="106.68" width="0.1524" layer="91"/>
<pinref part="U$4" gate="G$1" pin="3.3V"/>
<pinref part="U$1" gate="G$1" pin="3.3V"/>
<wire x1="193.04" y1="99.06" x2="187.96" y2="99.06" width="0.1524" layer="91"/>
</segment>
<segment>
<wire x1="121.92" y1="109.22" x2="114.3" y2="109.22" width="0.1524" layer="91"/>
<wire x1="114.3" y1="109.22" x2="106.68" y2="109.22" width="0.1524" layer="91"/>
<wire x1="106.68" y1="109.22" x2="106.68" y2="116.84" width="0.1524" layer="91"/>
<pinref part="U$6" gate="G$1" pin="3.3V"/>
<pinref part="U$5" gate="G$1" pin="3.3V"/>
<wire x1="129.54" y1="109.22" x2="121.92" y2="109.22" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="J3" gate="G$1" pin="SCL"/>
<wire x1="121.92" y1="68.58" x2="116.84" y2="68.58" width="0.1524" layer="91"/>
<label x="116.84" y="68.58" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<wire x1="223.52" y1="104.14" x2="218.44" y2="104.14" width="0.1524" layer="91"/>
<label x="218.44" y="104.14" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$1" gate="G$1" pin="SCL"/>
</segment>
<segment>
<wire x1="121.92" y1="104.14" x2="114.3" y2="104.14" width="0.1524" layer="91"/>
<label x="114.3" y="104.14" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$5" gate="G$1" pin="SCL"/>
<wire x1="121.92" y1="104.14" x2="129.54" y2="104.14" width="0.1524" layer="91"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="J3" gate="G$1" pin="SDA"/>
<wire x1="121.92" y1="66.04" x2="116.84" y2="66.04" width="0.1524" layer="91"/>
<label x="116.84" y="66.04" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<wire x1="223.52" y1="101.6" x2="218.44" y2="101.6" width="0.1524" layer="91"/>
<label x="218.44" y="101.6" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$1" gate="G$1" pin="SDA"/>
</segment>
<segment>
<wire x1="121.92" y1="101.6" x2="114.3" y2="101.6" width="0.1524" layer="91"/>
<label x="114.3" y="101.6" size="1.27" layer="95" rot="R180" xref="yes"/>
<pinref part="U$5" gate="G$1" pin="SDA"/>
<wire x1="121.92" y1="101.6" x2="129.54" y2="101.6" width="0.1524" layer="91"/>
</segment>
</net>
<net name="N$1" class="2">
<segment>
<pinref part="U$3" gate="G$1" pin="GND"/>
<pinref part="U$1" gate="G$1" pin="GND_1"/>
<wire x1="223.52" y1="96.52" x2="233.68" y2="96.52" width="0.1524" layer="91"/>
</segment>
</net>
</nets>
</sheet>
</sheets>
</schematic>
</drawing>
<compatibility>
<note version="8.2" severity="warning">
Since Version 8.2, EAGLE supports online libraries. The ids
of those online libraries will not be understood (or retained)
with this version.
</note>
<note version="8.3" severity="warning">
Since Version 8.3, EAGLE supports URNs for individual library
assets (packages, symbols, and devices). The URNs of those assets
will not be understood (or retained) with this version.
</note>
</compatibility>
</eagle>
