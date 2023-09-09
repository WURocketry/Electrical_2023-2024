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
<package name="1X06_OVAL">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.2032" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" shape="long" rot="R90"/>
<text x="-7.6962" y="1.8288" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06_ROUND">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.2032" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.6764" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" diameter="1.6764" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" diameter="1.6764" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" diameter="1.6764" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" diameter="1.6764" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" diameter="1.6764" rot="R90"/>
<text x="-7.6962" y="1.8288" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06_SMT_4UCON_06676">
<description>&lt;p&gt;&lt;b&gt;Pin Headers&lt;/b&gt;&lt;br/&gt;
6 Pin, 0.1"/2.54mm pitch, SMT&lt;/p&gt;
&lt;p&gt;4UCON: 06676&lt;/p&gt;</description>
<smd name="1" x="-6.35" y="1.52" dx="1" dy="2.5" layer="1"/>
<smd name="2" x="-3.81" y="-1.52" dx="1" dy="2.5" layer="1"/>
<smd name="3" x="-1.27" y="1.52" dx="1" dy="2.5" layer="1"/>
<smd name="4" x="1.27" y="-1.52" dx="1" dy="2.5" layer="1"/>
<smd name="5" x="3.81" y="1.52" dx="1" dy="2.5" layer="1"/>
<smd name="6" x="6.35" y="-1.52" dx="1" dy="2.5" layer="1"/>
<text x="-7.6962" y="3.25" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-3.23" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<wire x1="-8" y1="2.5" x2="8" y2="2.5" width="0.127" layer="51"/>
<wire x1="8" y1="2.5" x2="8" y2="-2.5" width="0.127" layer="51"/>
<wire x1="8" y1="-2.5" x2="-8" y2="-2.5" width="0.127" layer="51"/>
<wire x1="-8" y1="-2.5" x2="-8" y2="2.5" width="0.127" layer="51"/>
<wire x1="-7.2" y1="2.6" x2="-8.1" y2="2.6" width="0.127" layer="21"/>
<wire x1="-8.1" y1="2.6" x2="-8.1" y2="-2.6" width="0.127" layer="21"/>
<wire x1="-8.1" y1="-2.6" x2="-4.6" y2="-2.6" width="0.127" layer="21"/>
<wire x1="4.6" y1="2.6" x2="8.1" y2="2.6" width="0.127" layer="21"/>
<wire x1="8.1" y1="2.6" x2="8.1" y2="-2.6" width="0.127" layer="21"/>
<wire x1="8.1" y1="-2.6" x2="7.1" y2="-2.6" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="-6.4" y="-0.5"/>
<vertex x="-7" y="-1.1"/>
<vertex x="-5.8" y="-1.1"/>
</polygon>
</package>
<package name="1X06_ROUND_76">
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.2032" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" diameter="1.9304" rot="R90"/>
<text x="-7.6962" y="1.8288" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-1.905" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06_ROUND_70">
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.2032" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.778" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" diameter="1.778" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" diameter="1.778" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" diameter="1.778" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" diameter="1.778" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" diameter="1.778" rot="R90"/>
<text x="-7.6962" y="1.8288" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06_ROUND_FULL_76">
<pad name="1" x="-6.35" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="1" diameter="1.9304" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="1" diameter="1.9304" rot="R90"/>
<text x="-7.6962" y="1.8288" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-1.905" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
<package name="1X06_SMT_4UCON_20609">
<smd name="1" x="-6.35" y="-1.375" dx="1.02" dy="2.75" layer="1"/>
<smd name="2" x="-3.81" y="1.375" dx="1.02" dy="2.75" layer="1"/>
<smd name="3" x="-1.27" y="-1.375" dx="1.02" dy="2.75" layer="1"/>
<smd name="4" x="1.27" y="1.375" dx="1.02" dy="2.75" layer="1"/>
<smd name="5" x="3.81" y="-1.375" dx="1.02" dy="2.75" layer="1"/>
<smd name="6" x="6.35" y="1.375" dx="1.02" dy="2.75" layer="1"/>
<wire x1="-8" y1="1.25" x2="-8" y2="-1.25" width="0.127" layer="51"/>
<wire x1="8" y1="-1.25" x2="8" y2="1.25" width="0.127" layer="51"/>
<wire x1="-3.995" y1="2.725" x2="3.995" y2="2.725" width="0.127" layer="51"/>
<wire x1="3.995" y1="2.725" x2="3.995" y2="-2.725" width="0.127" layer="51"/>
<wire x1="3.995" y1="-2.725" x2="-3.995" y2="-2.725" width="0.127" layer="51"/>
<wire x1="-3.995" y1="-2.725" x2="-3.995" y2="2.725" width="0.127" layer="51"/>
<wire x1="-4" y1="1.25" x2="-4.06" y2="1.25" width="0.127" layer="51"/>
<wire x1="-4.06" y1="1.25" x2="-8" y2="1.25" width="0.127" layer="51"/>
<wire x1="4" y1="-1.25" x2="8" y2="-1.25" width="0.127" layer="51"/>
<wire x1="8" y1="1.25" x2="4" y2="1.25" width="0.127" layer="51"/>
<wire x1="-8" y1="-1.25" x2="-4" y2="-1.25" width="0.127" layer="51"/>
<wire x1="4" y1="1.25" x2="-4" y2="1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="-4.06" y1="1.25" x2="-4" y2="1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="-3.56" y1="1.25" x2="-4" y2="1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="4" y1="-1.25" x2="-4" y2="-1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="-4.6" y1="1.4" x2="-8.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="-8.1" y1="1.4" x2="-8.1" y2="-1.4" width="0.127" layer="21"/>
<wire x1="-8.1" y1="-1.4" x2="-7.2" y2="-1.4" width="0.127" layer="21"/>
<wire x1="4.7" y1="-1.4" x2="8.1" y2="-1.4" width="0.127" layer="21"/>
<wire x1="8.1" y1="-1.4" x2="8.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="8.1" y1="1.4" x2="7.2" y2="1.4" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="-6.34" y="1.82"/>
<vertex x="-5.74" y="2.42"/>
<vertex x="-6.94" y="2.42"/>
</polygon>
<text x="-8.35" y="-1.3962" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="0" y="0" size="0.4064" layer="27" ratio="10" align="center">&gt;VALUE</text>
<wire x1="-6.55" y1="-2.35" x2="-6.15" y2="-2.35" width="0.127" layer="51"/>
<wire x1="-6.15" y1="-2.35" x2="-6.15" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-6.55" y1="-2.35" x2="-6.55" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-1.47" y1="-2.35" x2="-1.07" y2="-2.35" width="0.127" layer="51"/>
<wire x1="-1.07" y1="-2.35" x2="-1.07" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-1.47" y1="-2.35" x2="-1.47" y2="-1.27" width="0.127" layer="51"/>
<wire x1="3.61" y1="-2.35" x2="4.01" y2="-2.35" width="0.127" layer="51"/>
<wire x1="4.01" y1="-2.35" x2="4.01" y2="-1.27" width="0.127" layer="51"/>
<wire x1="3.61" y1="-2.35" x2="3.61" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-3.56" y1="1.25" x2="-3.56" y2="2.25" width="0.127" layer="51"/>
<wire x1="-3.56" y1="2.25" x2="-4.06" y2="2.25" width="0.127" layer="51"/>
<wire x1="-4.06" y1="2.25" x2="-4.06" y2="1.25" width="0.127" layer="51"/>
<wire x1="1.52" y1="1.25" x2="1.52" y2="2.25" width="0.127" layer="51"/>
<wire x1="1.52" y1="2.25" x2="1.02" y2="2.25" width="0.127" layer="51"/>
<wire x1="1.02" y1="2.25" x2="1.02" y2="1.25" width="0.127" layer="51"/>
<wire x1="6.6" y1="1.25" x2="6.6" y2="2.25" width="0.127" layer="51"/>
<wire x1="6.6" y1="2.25" x2="6.1" y2="2.25" width="0.127" layer="51"/>
<wire x1="6.1" y1="2.25" x2="6.1" y2="1.25" width="0.127" layer="51"/>
</package>
<package name="1X06_SMT_4UCON_20609_MICRO">
<smd name="1" x="-6.35" y="-1.375" dx="1.02" dy="2.1" layer="1"/>
<smd name="2" x="-3.81" y="1.375" dx="1.02" dy="2.1" layer="1"/>
<smd name="3" x="-1.27" y="-1.375" dx="1.02" dy="2.1" layer="1"/>
<smd name="4" x="1.27" y="1.375" dx="1.02" dy="2.1" layer="1"/>
<smd name="5" x="3.81" y="-1.375" dx="1.02" dy="2.1" layer="1"/>
<smd name="6" x="6.35" y="1.375" dx="1.02" dy="2.1" layer="1"/>
<wire x1="-8" y1="1.25" x2="-8" y2="-1.25" width="0.127" layer="51"/>
<wire x1="8" y1="-1.25" x2="8" y2="1.25" width="0.127" layer="51"/>
<wire x1="-3.995" y1="2.725" x2="3.995" y2="2.725" width="0.127" layer="51"/>
<wire x1="3.995" y1="2.725" x2="3.995" y2="-2.725" width="0.127" layer="51"/>
<wire x1="3.995" y1="-2.725" x2="-3.995" y2="-2.725" width="0.127" layer="51"/>
<wire x1="-3.995" y1="-2.725" x2="-3.995" y2="2.725" width="0.127" layer="51"/>
<wire x1="-4" y1="1.25" x2="-4.06" y2="1.25" width="0.127" layer="51"/>
<wire x1="-4.06" y1="1.25" x2="-8" y2="1.25" width="0.127" layer="51"/>
<wire x1="4" y1="-1.25" x2="8" y2="-1.25" width="0.127" layer="51"/>
<wire x1="8" y1="1.25" x2="4" y2="1.25" width="0.127" layer="51"/>
<wire x1="-8" y1="-1.25" x2="-4" y2="-1.25" width="0.127" layer="51"/>
<wire x1="4" y1="1.25" x2="-4" y2="1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="-4.06" y1="1.25" x2="-4" y2="1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="-3.56" y1="1.25" x2="-4" y2="1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="4" y1="-1.25" x2="-4" y2="-1.25" width="0.127" layer="51" style="shortdash"/>
<wire x1="-4.6" y1="1.4" x2="-8.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="-8.1" y1="1.4" x2="-8.1" y2="-1.4" width="0.127" layer="21"/>
<wire x1="-8.1" y1="-1.4" x2="-7.2" y2="-1.4" width="0.127" layer="21"/>
<wire x1="4.7" y1="-1.4" x2="8.1" y2="-1.4" width="0.127" layer="21"/>
<wire x1="8.1" y1="-1.4" x2="8.1" y2="1.4" width="0.127" layer="21"/>
<wire x1="8.1" y1="1.4" x2="7.2" y2="1.4" width="0.127" layer="21"/>
<polygon width="0.127" layer="21">
<vertex x="-6.34" y="0.042"/>
<vertex x="-5.74" y="0.642"/>
<vertex x="-6.94" y="0.642"/>
</polygon>
<text x="-8.35" y="-1.3962" size="0.8128" layer="25" ratio="18" rot="R90">&gt;NAME</text>
<text x="0" y="0" size="0.4064" layer="27" ratio="10" align="center">&gt;VALUE</text>
<wire x1="-6.55" y1="-2.35" x2="-6.15" y2="-2.35" width="0.127" layer="51"/>
<wire x1="-6.15" y1="-2.35" x2="-6.15" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-6.55" y1="-2.35" x2="-6.55" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-1.47" y1="-2.35" x2="-1.07" y2="-2.35" width="0.127" layer="51"/>
<wire x1="-1.07" y1="-2.35" x2="-1.07" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-1.47" y1="-2.35" x2="-1.47" y2="-1.27" width="0.127" layer="51"/>
<wire x1="3.61" y1="-2.35" x2="4.01" y2="-2.35" width="0.127" layer="51"/>
<wire x1="4.01" y1="-2.35" x2="4.01" y2="-1.27" width="0.127" layer="51"/>
<wire x1="3.61" y1="-2.35" x2="3.61" y2="-1.27" width="0.127" layer="51"/>
<wire x1="-3.56" y1="1.25" x2="-3.56" y2="2.25" width="0.127" layer="51"/>
<wire x1="-3.56" y1="2.25" x2="-4.06" y2="2.25" width="0.127" layer="51"/>
<wire x1="-4.06" y1="2.25" x2="-4.06" y2="1.25" width="0.127" layer="51"/>
<wire x1="1.52" y1="1.25" x2="1.52" y2="2.25" width="0.127" layer="51"/>
<wire x1="1.52" y1="2.25" x2="1.02" y2="2.25" width="0.127" layer="51"/>
<wire x1="1.02" y1="2.25" x2="1.02" y2="1.25" width="0.127" layer="51"/>
<wire x1="6.6" y1="1.25" x2="6.6" y2="2.25" width="0.127" layer="51"/>
<wire x1="6.6" y1="2.25" x2="6.1" y2="2.25" width="0.127" layer="51"/>
<wire x1="6.1" y1="2.25" x2="6.1" y2="1.25" width="0.127" layer="51"/>
</package>
<package name="1X06_OVALWAVE">
<wire x1="-7.62" y1="0.635" x2="-7.62" y2="-0.635" width="0.2032" layer="51"/>
<pad name="1" x="-6.35" y="0" drill="0.8" diameter="1.5" shape="long" rot="R90"/>
<pad name="2" x="-3.81" y="0" drill="0.8" diameter="1.5" shape="long" rot="R90"/>
<pad name="3" x="-1.27" y="0" drill="0.8" diameter="1.5" shape="long" rot="R90"/>
<pad name="4" x="1.27" y="0" drill="0.8" diameter="1.5" shape="long" rot="R90"/>
<pad name="5" x="3.81" y="0" drill="0.8" diameter="1.5" shape="long" rot="R90"/>
<pad name="6" x="6.35" y="0" drill="0.8" diameter="1.5" shape="long" rot="R90"/>
<text x="-7.6962" y="1.8288" size="0.8128" layer="25" ratio="18">&gt;NAME</text>
<text x="-7.62" y="-3.175" size="0.4064" layer="27" ratio="10">&gt;VALUE</text>
<rectangle x1="3.556" y1="-0.254" x2="4.064" y2="0.254" layer="51"/>
<rectangle x1="1.016" y1="-0.254" x2="1.524" y2="0.254" layer="51"/>
<rectangle x1="-1.524" y1="-0.254" x2="-1.016" y2="0.254" layer="51"/>
<rectangle x1="-4.064" y1="-0.254" x2="-3.556" y2="0.254" layer="51"/>
<rectangle x1="-6.604" y1="-0.254" x2="-6.096" y2="0.254" layer="51"/>
<rectangle x1="6.096" y1="-0.254" x2="6.604" y2="0.254" layer="51"/>
</package>
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
<symbol name="PINHD6">
<wire x1="-6.35" y1="-7.62" x2="1.27" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="1.27" y1="10.16" x2="-6.35" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-6.35" y1="10.16" x2="-6.35" y2="-7.62" width="0.4064" layer="94"/>
<text x="-6.35" y="10.795" size="1.778" layer="95">&gt;NAME</text>
<text x="-6.35" y="-10.16" size="1.778" layer="96">&gt;VALUE</text>
<pin name="1" x="-2.54" y="7.62" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="2" x="-2.54" y="5.08" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="3" x="-2.54" y="2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="4" x="-2.54" y="0" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="5" x="-2.54" y="-2.54" visible="pad" length="short" direction="pas" function="dot"/>
<pin name="6" x="-2.54" y="-5.08" visible="pad" length="short" direction="pas" function="dot"/>
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
<deviceset name="HEADER-1X6" prefix="JP" uservalue="yes">
<description>&lt;b&gt;PIN HEADER&lt;/b&gt;</description>
<gates>
<gate name="A" symbol="PINHD6" x="0" y="-2.54"/>
</gates>
<devices>
<device name="" package="1X06_OVAL">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="ROUND" package="1X06_ROUND">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMT" package="1X06_SMT_4UCON_06676">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="76MIL" package="1X06_ROUND_76">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="70MIL" package="1X06_ROUND_70">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="76MIL_FULLROUND" package="1X06_ROUND_FULL_76">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="20609" package="1X06_SMT_4UCON_20609">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="20609_MP" package="1X06_SMT_4UCON_20609_MICRO">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="OVALWAVE" package="1X06_OVALWAVE">
<connects>
<connect gate="A" pin="1" pad="1"/>
<connect gate="A" pin="2" pad="2"/>
<connect gate="A" pin="3" pad="3"/>
<connect gate="A" pin="4" pad="4"/>
<connect gate="A" pin="5" pad="5"/>
<connect gate="A" pin="6" pad="6"/>
</connects>
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
<symbol name="3.3V">
<wire x1="0.762" y1="1.27" x2="0" y2="2.54" width="0.254" layer="94"/>
<wire x1="0" y1="2.54" x2="-0.762" y2="1.27" width="0.254" layer="94"/>
<text x="-1.016" y="3.556" size="1.778" layer="96">&gt;VALUE</text>
<pin name="3.3V" x="0" y="0" visible="off" length="short" direction="sup" rot="R90"/>
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
<deviceset name="3.3V" prefix="P+">
<description>&lt;b&gt;SUPPLY SYMBOL&lt;/b&gt;</description>
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
<library name="SparkFun-Connectors">
<description>&lt;h3&gt;SparkFun Electronics' preferred foot prints&lt;/h3&gt;
In this library you'll find connectors and sockets- basically anything that can be plugged into or onto.&lt;br&gt;&lt;br&gt;
We've spent an enormous amount of time creating and checking these footprints and parts, but it is the end user's responsibility to ensure correctness and suitablity for a given componet or application. If you enjoy using this library, please buy one of our products at www.sparkfun.com.
&lt;br&gt;&lt;br&gt;
&lt;b&gt;Licensing:&lt;/b&gt; Creative Commons ShareAlike 4.0 International - https://creativecommons.org/licenses/by-sa/4.0/ 
&lt;br&gt;&lt;br&gt;
You are welcome to use this library for commercial purposes. For attribution, we ask that when you begin to sell your device using our footprint, you email us with a link to the product being sold. We want bragging rights that we helped (in a very small part) to create your 8th world wonder. We would like the opportunity to feature your device on our homepage.</description>
<packages>
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
<description>Qwiic connector with milled cutout. Sliding the cable into this slot prevents the cable from coming unplugged.</description>
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
<package name="1X06">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="11.43" y1="0.635" x2="12.065" y2="1.27" width="0.2032" layer="21"/>
<wire x1="12.065" y1="1.27" x2="13.335" y2="1.27" width="0.2032" layer="21"/>
<wire x1="13.335" y1="1.27" x2="13.97" y2="0.635" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-0.635" x2="13.335" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="13.335" y1="-1.27" x2="12.065" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="12.065" y1="-1.27" x2="11.43" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="6.985" y1="1.27" x2="8.255" y2="1.27" width="0.2032" layer="21"/>
<wire x1="8.255" y1="1.27" x2="8.89" y2="0.635" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.635" x2="8.255" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.635" x2="9.525" y2="1.27" width="0.2032" layer="21"/>
<wire x1="9.525" y1="1.27" x2="10.795" y2="1.27" width="0.2032" layer="21"/>
<wire x1="10.795" y1="1.27" x2="11.43" y2="0.635" width="0.2032" layer="21"/>
<wire x1="11.43" y1="-0.635" x2="10.795" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="10.795" y1="-1.27" x2="9.525" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="9.525" y1="-1.27" x2="8.89" y2="-0.635" width="0.2032" layer="21"/>
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
<wire x1="13.97" y1="0.635" x2="13.97" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="5" x="10.16" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="6" x="12.7" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="12.446" y1="-0.254" x2="12.954" y2="0.254" layer="51"/>
<rectangle x1="9.906" y1="-0.254" x2="10.414" y2="0.254" layer="51"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="MOLEX-1X6">
<description>&lt;h3&gt;Molex 6-Pin Plated Through-Hole&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/2pin_molex_set_19iv10.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="3.048" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="13.97" y1="3.048" x2="13.97" y2="-2.54" width="0.127" layer="21"/>
<wire x1="13.97" y1="3.048" x2="-1.27" y2="3.048" width="0.127" layer="21"/>
<wire x1="13.97" y1="-2.54" x2="12.7" y2="-2.54" width="0.127" layer="21"/>
<wire x1="12.7" y1="-2.54" x2="0" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="-1.27" x2="12.7" y2="-1.27" width="0.127" layer="21"/>
<wire x1="12.7" y1="-1.27" x2="12.7" y2="-2.54" width="0.127" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796"/>
<pad name="5" x="10.16" y="0" drill="1.016" diameter="1.8796"/>
<pad name="6" x="12.7" y="0" drill="1.016" diameter="1.8796"/>
<text x="4.699" y="3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="4.699" y="-3.556" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.27" x2="-0.635" y2="1.27" width="0.2032" layer="22"/>
</package>
<package name="MOLEX-1X6-RA">
<description>&lt;h3&gt;Molex 6-Pin Plated Through-Hole Right Angle&lt;/h3&gt;
tPlace shows angle of connector. 
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/2pin_molex_set_19iv10.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="3.175" width="0.127" layer="21"/>
<wire x1="13.97" y1="0.635" x2="13.97" y2="3.175" width="0.127" layer="21"/>
<wire x1="13.97" y1="0.635" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="13.97" y1="3.175" x2="12.7" y2="3.175" width="0.127" layer="21"/>
<wire x1="12.7" y1="3.175" x2="0" y2="3.175" width="0.127" layer="21"/>
<wire x1="0" y1="3.175" x2="-1.27" y2="3.175" width="0.127" layer="21"/>
<wire x1="0" y1="3.175" x2="0" y2="7.62" width="0.127" layer="21"/>
<wire x1="0" y1="7.62" x2="12.7" y2="7.62" width="0.127" layer="21"/>
<wire x1="12.7" y1="7.62" x2="12.7" y2="3.175" width="0.127" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796"/>
<pad name="5" x="10.16" y="0" drill="1.016" diameter="1.8796"/>
<pad name="6" x="12.7" y="0" drill="1.016" diameter="1.8796"/>
<text x="4.953" y="5.334" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="4.699" y="4.445" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.2032" layer="22"/>
</package>
<package name="1X06-SMD_RA_MALE">
<description>&lt;h3&gt;SMD - 6 Pin Right Angle Male Header&lt;/h3&gt;
tDocu layer shows pin locations.
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="7.62" y1="1.25" x2="-7.62" y2="1.25" width="0.127" layer="51"/>
<wire x1="-7.62" y1="1.25" x2="-7.62" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-7.62" y1="-1.25" x2="-6.35" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-6.35" y1="-1.25" x2="-3.81" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-1.25" x2="-1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.27" y1="-1.25" x2="3.81" y2="-1.25" width="0.127" layer="51"/>
<wire x1="3.81" y1="-1.25" x2="6.35" y2="-1.25" width="0.127" layer="51"/>
<wire x1="6.35" y1="-1.25" x2="7.62" y2="-1.25" width="0.127" layer="51"/>
<wire x1="7.62" y1="-1.25" x2="7.62" y2="1.25" width="0.127" layer="51"/>
<wire x1="6.35" y1="-1.25" x2="6.35" y2="-7.25" width="0.127" layer="51"/>
<wire x1="3.81" y1="-1.25" x2="3.81" y2="-7.25" width="0.127" layer="51"/>
<wire x1="1.27" y1="-1.25" x2="1.27" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="-1.27" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-3.81" y1="-1.25" x2="-3.81" y2="-7.25" width="0.127" layer="51"/>
<wire x1="-6.35" y1="-1.25" x2="-6.35" y2="-7.25" width="0.127" layer="51"/>
<smd name="4" x="1.27" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="5" x="3.81" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="6" x="6.35" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="3" x="-1.27" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="2" x="-3.81" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<smd name="1" x="-6.35" y="5" dx="3" dy="1" layer="1" rot="R90"/>
<hole x="-5.08" y="0" drill="1.4"/>
<hole x="5.08" y="0" drill="1.4"/>
<text x="-1.524" y="0.381" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-1.016" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_LOCK">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin with Locking Footprint&lt;/h3&gt;
Holes are offset 0.005" from center, locking pins in place during soldering.
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.508" x2="-0.635" y2="1.143" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="1.143" x2="0.635" y2="1.143" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.143" x2="1.27" y2="0.508" width="0.2032" layer="21"/>
<wire x1="1.27" y1="0.508" x2="1.905" y2="1.143" width="0.2032" layer="21"/>
<wire x1="1.905" y1="1.143" x2="3.175" y2="1.143" width="0.2032" layer="21"/>
<wire x1="3.175" y1="1.143" x2="3.81" y2="0.508" width="0.2032" layer="21"/>
<wire x1="3.81" y1="0.508" x2="4.445" y2="1.143" width="0.2032" layer="21"/>
<wire x1="4.445" y1="1.143" x2="5.715" y2="1.143" width="0.2032" layer="21"/>
<wire x1="5.715" y1="1.143" x2="6.35" y2="0.508" width="0.2032" layer="21"/>
<wire x1="6.35" y1="0.508" x2="6.985" y2="1.143" width="0.2032" layer="21"/>
<wire x1="6.985" y1="1.143" x2="8.255" y2="1.143" width="0.2032" layer="21"/>
<wire x1="8.255" y1="1.143" x2="8.89" y2="0.508" width="0.2032" layer="21"/>
<wire x1="8.89" y1="0.508" x2="9.525" y2="1.143" width="0.2032" layer="21"/>
<wire x1="9.525" y1="1.143" x2="10.795" y2="1.143" width="0.2032" layer="21"/>
<wire x1="10.795" y1="1.143" x2="11.43" y2="0.508" width="0.2032" layer="21"/>
<wire x1="11.43" y1="0.508" x2="12.065" y2="1.143" width="0.2032" layer="21"/>
<wire x1="12.065" y1="1.143" x2="13.335" y2="1.143" width="0.2032" layer="21"/>
<wire x1="13.335" y1="1.143" x2="13.97" y2="0.508" width="0.2032" layer="21"/>
<wire x1="13.97" y1="0.508" x2="13.97" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-0.762" x2="13.335" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="13.335" y1="-1.397" x2="12.065" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="12.065" y1="-1.397" x2="11.43" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="11.43" y1="-0.762" x2="10.795" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="10.795" y1="-1.397" x2="9.525" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="9.525" y1="-1.397" x2="8.89" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="8.89" y1="-0.762" x2="8.255" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="8.255" y1="-1.397" x2="6.985" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="6.985" y1="-1.397" x2="6.35" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="6.35" y1="-0.762" x2="5.715" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="5.715" y1="-1.397" x2="4.445" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="4.445" y1="-1.397" x2="3.81" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="3.81" y1="-0.762" x2="3.175" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="3.175" y1="-1.397" x2="1.905" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="1.905" y1="-1.397" x2="1.27" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="1.27" y1="-0.762" x2="0.635" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="0.635" y1="-1.397" x2="-0.635" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.397" x2="-1.27" y2="-0.762" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.762" x2="-1.27" y2="0.508" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796"/>
<pad name="2" x="2.54" y="-0.254" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="-0.254" drill="1.016" diameter="1.8796"/>
<pad name="5" x="10.16" y="0" drill="1.016" diameter="1.8796"/>
<pad name="6" x="12.7" y="-0.254" drill="1.016" diameter="1.8796"/>
<rectangle x1="-0.2921" y1="-0.4191" x2="0.2921" y2="0.1651" layer="51"/>
<rectangle x1="2.2479" y1="-0.4191" x2="2.8321" y2="0.1651" layer="51"/>
<rectangle x1="4.7879" y1="-0.4191" x2="5.3721" y2="0.1651" layer="51"/>
<rectangle x1="7.3279" y1="-0.4191" x2="7.9121" y2="0.1651" layer="51"/>
<rectangle x1="9.8679" y1="-0.4191" x2="10.4521" y2="0.1651" layer="51"/>
<rectangle x1="12.4079" y1="-0.4191" x2="12.9921" y2="0.1651" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.286" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_LOCK_LONGPADS">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin with Locking Footprint with Long Pads&lt;/h3&gt;
Holes are offset 0.005" from center, locking pins in place during soldering.
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="1.524" y1="-0.127" x2="1.016" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="4.064" y1="-0.127" x2="3.556" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="6.604" y1="-0.127" x2="6.096" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="9.144" y1="-0.127" x2="8.636" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="11.684" y1="-0.127" x2="11.176" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.127" x2="-1.016" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.127" x2="-1.27" y2="0.8636" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="0.8636" x2="-0.9906" y2="1.143" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-0.127" x2="-1.27" y2="-1.1176" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="-1.1176" x2="-0.9906" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-0.127" x2="13.716" y2="-0.127" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-0.127" x2="13.97" y2="-1.1176" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-1.1176" x2="13.6906" y2="-1.397" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-0.127" x2="13.97" y2="0.8636" width="0.2032" layer="21"/>
<wire x1="13.97" y1="0.8636" x2="13.6906" y2="1.143" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="-0.254" drill="1.016" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="4" x="7.62" y="-0.254" drill="1.016" shape="long" rot="R90"/>
<pad name="5" x="10.16" y="0" drill="1.016" shape="long" rot="R90"/>
<pad name="6" x="12.7" y="-0.254" drill="1.016" shape="long" rot="R90"/>
<rectangle x1="-0.2921" y1="-0.4191" x2="0.2921" y2="0.1651" layer="51"/>
<rectangle x1="2.2479" y1="-0.4191" x2="2.8321" y2="0.1651" layer="51"/>
<rectangle x1="4.7879" y1="-0.4191" x2="5.3721" y2="0.1651" layer="51"/>
<rectangle x1="7.3279" y1="-0.4191" x2="7.9121" y2="0.1651" layer="51" rot="R90"/>
<rectangle x1="9.8679" y1="-0.4191" x2="10.4521" y2="0.1651" layer="51"/>
<rectangle x1="12.4079" y1="-0.4191" x2="12.9921" y2="0.1651" layer="51"/>
<text x="-1.143" y="2.032" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.143" y="-2.667" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="MOLEX-1X6_LOCK">
<description>&lt;h3&gt;Molex 6-Pin Plated Through-Hole Locking Footprint&lt;/h3&gt;
Holes are offset 0.005" from center to hold pins in place during soldering.  
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/2pin_molex_set_19iv10.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="3.048" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="13.97" y1="3.048" x2="13.97" y2="-2.54" width="0.127" layer="21"/>
<wire x1="13.97" y1="3.048" x2="-1.27" y2="3.048" width="0.127" layer="21"/>
<wire x1="13.97" y1="-2.54" x2="12.7" y2="-2.54" width="0.127" layer="21"/>
<wire x1="12.7" y1="-2.54" x2="0" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="-1.27" y2="-2.54" width="0.127" layer="21"/>
<wire x1="0" y1="-2.54" x2="0" y2="-1.27" width="0.127" layer="21"/>
<wire x1="0" y1="-1.27" x2="12.7" y2="-1.27" width="0.127" layer="21"/>
<wire x1="12.7" y1="-1.27" x2="12.7" y2="-2.54" width="0.127" layer="21"/>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796"/>
<pad name="2" x="2.54" y="-0.254" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="-0.254" drill="1.016" diameter="1.8796"/>
<pad name="5" x="10.16" y="0" drill="1.016" diameter="1.8796"/>
<pad name="6" x="12.7" y="-0.254" drill="1.016" diameter="1.8796"/>
<rectangle x1="-0.2921" y1="-0.4191" x2="0.2921" y2="0.1651" layer="51"/>
<rectangle x1="2.2479" y1="-0.4191" x2="2.8321" y2="0.1651" layer="51"/>
<rectangle x1="4.7879" y1="-0.4191" x2="5.3721" y2="0.1651" layer="51"/>
<rectangle x1="7.3279" y1="-0.4191" x2="7.9121" y2="0.1651" layer="51"/>
<rectangle x1="9.8679" y1="-0.4191" x2="10.4521" y2="0.1651" layer="51"/>
<rectangle x1="12.4079" y1="-0.4191" x2="12.9921" y2="0.1651" layer="51"/>
<text x="4.445" y="3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="4.191" y="-3.429" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="-0.635" y1="1.27" x2="0.635" y2="1.27" width="0.2032" layer="21"/>
<wire x1="0.635" y1="1.27" x2="-0.635" y2="1.27" width="0.2032" layer="22"/>
</package>
<package name="MOLEX_1X6_RA_LOCK">
<description>&lt;h3&gt;Molex 6-Pin Plated Through-Hole Right Angle Locking Footprint&lt;/h3&gt;
Holes are offset 0.005" from center to hold pins in place during soldering.  
tPlace shows location of connector.
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/2pin_molex_set_19iv10.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="3.175" width="0.127" layer="21"/>
<wire x1="13.97" y1="0.635" x2="13.97" y2="3.175" width="0.127" layer="21"/>
<wire x1="13.97" y1="0.635" x2="-1.27" y2="0.635" width="0.127" layer="21"/>
<wire x1="13.97" y1="3.175" x2="12.7" y2="3.175" width="0.127" layer="21"/>
<wire x1="12.7" y1="3.175" x2="0" y2="3.175" width="0.127" layer="21"/>
<wire x1="0" y1="3.175" x2="-1.27" y2="3.175" width="0.127" layer="21"/>
<wire x1="0" y1="3.175" x2="0" y2="7.62" width="0.127" layer="21"/>
<wire x1="0" y1="7.62" x2="12.7" y2="7.62" width="0.127" layer="21"/>
<wire x1="12.7" y1="7.62" x2="12.7" y2="3.175" width="0.127" layer="21"/>
<pad name="1" x="0" y="0.127" drill="1.016" diameter="1.8796"/>
<pad name="2" x="2.54" y="-0.127" drill="1.016" diameter="1.8796"/>
<pad name="3" x="5.08" y="0.127" drill="1.016" diameter="1.8796"/>
<pad name="4" x="7.62" y="-0.127" drill="1.016" diameter="1.8796"/>
<pad name="5" x="10.16" y="0.127" drill="1.016" diameter="1.8796"/>
<pad name="6" x="12.7" y="-0.127" drill="1.016" diameter="1.8796"/>
<text x="4.826" y="5.588" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="4.699" y="4.318" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<wire x1="0.635" y1="-1.27" x2="-0.635" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-0.635" y1="-1.27" x2="0.635" y2="-1.27" width="0.2032" layer="22"/>
</package>
<package name="1X06_FEMALE_LOCK.010">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin Locking Header&lt;/h3&gt;
Includes silk outline for 6 pin female header
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://cdn.sparkfun.com/datasheets/Prototyping/SP-140520-XX-001.pdf”&gt;Datasheet referenced for footprint:&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="1.27" x2="-1.27" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="-1.27" y1="1.27" x2="13.97" y2="1.27" width="0.2032" layer="21"/>
<wire x1="13.97" y1="-1.27" x2="-1.27" y2="-1.27" width="0.2032" layer="21"/>
<wire x1="13.97" y1="1.27" x2="13.97" y2="-1.27" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0.254" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="-0.254" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0.254" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="-0.254" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="5" x="10.16" y="0.254" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="6" x="12.7" y="-0.254" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="-0.3175" y1="-0.1905" x2="0.3175" y2="0.1905" layer="51"/>
<rectangle x1="2.2225" y1="-0.1905" x2="2.8575" y2="0.1905" layer="51"/>
<rectangle x1="4.7625" y1="-0.1905" x2="5.3975" y2="0.1905" layer="51"/>
<rectangle x1="7.3025" y1="-0.1905" x2="7.9375" y2="0.1905" layer="51"/>
<rectangle x1="9.8425" y1="-0.1905" x2="10.4775" y2="0.1905" layer="51"/>
<rectangle x1="12.3825" y1="-0.1905" x2="13.0175" y2="0.1905" layer="51"/>
<text x="-1.143" y="1.524" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.143" y="-2.159" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_LONGPADS">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin with Long Pads&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="0.635" x2="-1.27" y2="-0.635" width="0.2032" layer="21"/>
<wire x1="13.97" y1="0.635" x2="13.97" y2="-0.635" width="0.2032" layer="21"/>
<pad name="1" x="0" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="5" x="10.16" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<pad name="6" x="12.7" y="0" drill="1.1176" diameter="1.8796" shape="long" rot="R90"/>
<text x="-1.27" y="2.032" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.667" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<rectangle x1="12.446" y1="-0.254" x2="12.954" y2="0.254" layer="51"/>
<rectangle x1="9.906" y1="-0.254" x2="10.414" y2="0.254" layer="51"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
</package>
<package name="SCREWTERMINAL-3.5MM-6">
<description>&lt;h3&gt;Screw Terminal  3.5mm Pitch -6 Pin PTH&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count: 6&lt;/li&gt;
&lt;li&gt;Pin pitch: 3.5mm/138mil&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”https://www.sparkfun.com/datasheets/Prototyping/Screw-Terminal-3.5mm.pdf”&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.75" y1="3.4" x2="19.25" y2="3.4" width="0.2032" layer="21"/>
<wire x1="19.25" y1="3.4" x2="19.25" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="19.25" y1="-2.8" x2="19.25" y2="-3.6" width="0.2032" layer="21"/>
<wire x1="19.25" y1="-3.6" x2="-1.75" y2="-3.6" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-3.6" x2="-1.75" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-2.8" x2="-1.75" y2="3.4" width="0.2032" layer="21"/>
<wire x1="19.25" y1="-2.8" x2="-1.75" y2="-2.8" width="0.2032" layer="21"/>
<wire x1="-1.75" y1="-1.35" x2="-2.25" y2="-1.35" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-1.35" x2="-2.25" y2="-2.35" width="0.2032" layer="51"/>
<wire x1="-2.25" y1="-2.35" x2="-1.75" y2="-2.35" width="0.2032" layer="51"/>
<wire x1="19.25" y1="3.15" x2="19.75" y2="3.15" width="0.2032" layer="51"/>
<wire x1="19.75" y1="3.15" x2="19.75" y2="2.15" width="0.2032" layer="51"/>
<wire x1="19.75" y1="2.15" x2="19.25" y2="2.15" width="0.2032" layer="51"/>
<pad name="1" x="0" y="0" drill="1.2" diameter="2.032" shape="square"/>
<pad name="2" x="3.5" y="0" drill="1.2" diameter="2.032"/>
<pad name="3" x="7" y="0" drill="1.2" diameter="2.032"/>
<pad name="4" x="10.5" y="0" drill="1.2" diameter="2.032"/>
<pad name="5" x="14" y="0" drill="1.2" diameter="2.032"/>
<pad name="6" x="17.5" y="0" drill="1.2" diameter="2.032"/>
<text x="7.112" y="2.413" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="6.858" y="1.524" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06-SMD-FEMALE">
<description>&lt;h3&gt;Header - 6 pin Female SMD&lt;/h3&gt;
Right angle 0.1"
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”http://cdn.sparkfun.com/datasheets/Prototyping/19686.pdf”&gt;Datasheet referenced for footprint:&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-7.5" y1="0.45" x2="-7.5" y2="-8.05" width="0.127" layer="21"/>
<wire x1="7.5" y1="0.45" x2="-7.5" y2="0.45" width="0.127" layer="21"/>
<wire x1="7.5" y1="-8.05" x2="7.5" y2="0.45" width="0.127" layer="21"/>
<wire x1="-7.5" y1="-8.05" x2="7.5" y2="-8.05" width="0.127" layer="21"/>
<smd name="4" x="-1.27" y="3.425" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="5" x="-3.81" y="3.425" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="6" x="-6.35" y="3.425" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="3" x="1.27" y="3.425" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="2" x="3.81" y="3.425" dx="1.25" dy="3" layer="1" rot="R180"/>
<smd name="1" x="6.35" y="3.425" dx="1.25" dy="3" layer="1" rot="R180"/>
<text x="-1.524" y="-3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.778" y="-4.826" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_HOLES_ONLY">
<description>&lt;h3&gt; 6 Pin Holes&lt;/h3&gt;
No silk, no plating
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<circle x="0" y="0" radius="0.635" width="0.127" layer="51"/>
<circle x="2.54" y="0" radius="0.635" width="0.127" layer="51"/>
<circle x="5.08" y="0" radius="0.635" width="0.127" layer="51"/>
<circle x="7.62" y="0" radius="0.635" width="0.127" layer="51"/>
<circle x="10.16" y="0" radius="0.635" width="0.127" layer="51"/>
<circle x="12.7" y="0" radius="0.635" width="0.127" layer="51"/>
<pad name="1" x="0" y="0" drill="0.889" diameter="0.8128" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="0.889" diameter="0.8128" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="0.889" diameter="0.8128" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="0.889" diameter="0.8128" rot="R90"/>
<pad name="5" x="10.16" y="0" drill="0.889" diameter="0.8128" rot="R90"/>
<pad name="6" x="12.7" y="0" drill="0.889" diameter="0.8128" rot="R90"/>
<hole x="0" y="0" drill="1.4732"/>
<hole x="2.54" y="0" drill="1.4732"/>
<hole x="5.08" y="0" drill="1.4732"/>
<hole x="7.62" y="0" drill="1.4732"/>
<hole x="10.16" y="0" drill="1.4732"/>
<hole x="12.7" y="0" drill="1.4732"/>
</package>
<package name="1X06_SMD_STRAIGHT">
<description>&lt;h3&gt; 6 Pin SMD Female Header&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”http://cdn.sparkfun.com/datasheets/Prototyping/femaleSMDheader.pdf”&gt;Datasheet referenced for footprint:&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="1.37" y1="1.25" x2="-14.07" y2="1.25" width="0.127" layer="51"/>
<wire x1="-14.07" y1="1.25" x2="-14.07" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-14.07" y1="-1.25" x2="1.37" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.37" y1="-1.25" x2="1.37" y2="1.25" width="0.127" layer="51"/>
<wire x1="1.37" y1="1.25" x2="1.37" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-14.07" y1="-1.25" x2="-14.07" y2="1.25" width="0.127" layer="21"/>
<wire x1="0.85" y1="1.25" x2="1.37" y2="1.25" width="0.127" layer="21"/>
<wire x1="-14.07" y1="1.25" x2="-10.883" y2="1.25" width="0.127" layer="21"/>
<wire x1="-13.55" y1="-1.25" x2="-14.07" y2="-1.25" width="0.127" layer="21"/>
<wire x1="1.37" y1="-1.25" x2="-1.817" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-4.377" y1="1.25" x2="-0.703" y2="1.25" width="0.127" layer="21"/>
<wire x1="-9.457" y1="1.25" x2="-5.783" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.329" y1="-1.25" x2="-6.831" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-8.409" y1="-1.25" x2="-11.911" y2="-1.25" width="0.127" layer="21"/>
<smd name="5" x="-10.16" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="3" x="-5.08" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="1" x="0" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="6" x="-12.7" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="4" x="-7.62" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="2" x="-2.54" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<text x="-13.716" y="2.921" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-13.843" y="-3.429" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_SMD_STRAIGHT_ALT">
<description>&lt;h3&gt; 6 Pin SMD Female Header&lt;/h3&gt;
Alternate pin configuration
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”http://cdn.sparkfun.com/datasheets/Prototyping/femaleSMDheader.pdf”&gt;Datasheet referenced for footprint:&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="1.37" y1="1.25" x2="-14.07" y2="1.25" width="0.127" layer="51"/>
<wire x1="-14.07" y1="1.25" x2="-14.07" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-14.07" y1="-1.25" x2="1.37" y2="-1.25" width="0.127" layer="51"/>
<wire x1="1.37" y1="-1.25" x2="1.37" y2="1.25" width="0.127" layer="51"/>
<wire x1="-14.07" y1="1.25" x2="-14.07" y2="-1.25" width="0.127" layer="21"/>
<wire x1="1.37" y1="-1.25" x2="1.37" y2="1.25" width="0.127" layer="21"/>
<wire x1="-13.55" y1="1.25" x2="-14.07" y2="1.25" width="0.127" layer="21"/>
<wire x1="1.37" y1="1.25" x2="-1.817" y2="1.25" width="0.127" layer="21"/>
<wire x1="0.85" y1="-1.25" x2="1.37" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-14.07" y1="-1.25" x2="-10.883" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-8.323" y1="1.25" x2="-11.997" y2="1.25" width="0.127" layer="21"/>
<wire x1="-3.243" y1="1.25" x2="-6.917" y2="1.25" width="0.127" layer="21"/>
<wire x1="-9.371" y1="-1.25" x2="-5.869" y2="-1.25" width="0.127" layer="21"/>
<wire x1="-4.291" y1="-1.25" x2="-0.789" y2="-1.25" width="0.127" layer="21"/>
<smd name="5" x="-10.16" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="3" x="-5.08" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="1" x="0" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="6" x="-12.7" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="4" x="-7.62" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="2" x="-2.54" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<text x="-13.716" y="2.921" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-13.843" y="-3.556" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_SMD_STRAIGHT_COMBO">
<description>&lt;h3&gt; 6 Pin SMD Female Header - Combined Footprint&lt;/h3&gt;

&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”http://cdn.sparkfun.com/datasheets/Prototyping/femaleSMDheader.pdf”&gt;Datasheet referenced for footprint:&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="12.7" y1="1.27" x2="12.7" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="10.16" y1="1.27" x2="10.16" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="7.62" y1="1.27" x2="7.62" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="5.08" y1="1.27" x2="5.08" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="2.54" y1="1.27" x2="2.54" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="0" y1="1.27" x2="0" y2="-1.27" width="0.4064" layer="1"/>
<wire x1="-1.37" y1="-1.25" x2="-1.37" y2="1.25" width="0.1778" layer="21"/>
<wire x1="14.07" y1="1.25" x2="14.07" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="-0.73" y1="-1.25" x2="-1.37" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="14.07" y1="-1.25" x2="13.4" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="13.4" y1="1.25" x2="14.07" y2="1.25" width="0.1778" layer="21"/>
<wire x1="-1.37" y1="1.25" x2="-0.73" y2="1.25" width="0.1778" layer="21"/>
<wire x1="10.949" y1="1.25" x2="11.911" y2="1.25" width="0.1778" layer="21"/>
<wire x1="10.949" y1="-1.29" x2="11.911" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="8.409" y1="1.25" x2="9.371" y2="1.25" width="0.1778" layer="21"/>
<wire x1="8.409" y1="-1.29" x2="9.371" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="5.869" y1="-1.29" x2="6.831" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="5.869" y1="1.25" x2="6.831" y2="1.25" width="0.1778" layer="21"/>
<wire x1="3.329" y1="-1.29" x2="4.291" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="3.329" y1="1.25" x2="4.291" y2="1.25" width="0.1778" layer="21"/>
<wire x1="0.789" y1="-1.29" x2="1.751" y2="-1.29" width="0.1778" layer="21"/>
<wire x1="0.789" y1="1.25" x2="1.751" y2="1.25" width="0.1778" layer="21"/>
<smd name="5" x="10.16" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="3" x="5.08" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="1" x="0" y="-1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="6" x="12.7" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="4" x="7.62" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="2" x="2.54" y="1.65" dx="2" dy="1" layer="1" rot="R270"/>
<smd name="1-2" x="0" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="2-2" x="2.54" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="3-2" x="5.08" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="4-2" x="7.62" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="5-2" x="10.16" y="1.65" dx="2" dy="1" layer="1" rot="R90"/>
<smd name="6-2" x="12.7" y="-1.65" dx="2" dy="1" layer="1" rot="R90"/>
<text x="-0.508" y="2.921" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-0.508" y="-3.556" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_SMD_MALE">
<description>&lt;h3&gt; 6 Pin SMD Male Header&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;&lt;a href=”http://cdn.sparkfun.com/datasheets/Prototyping/maleSMDheader.pdf”&gt;Datasheet referenced for footprint:&lt;/a&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-1.27" y1="1.25" x2="-1.27" y2="-1.25" width="0.127" layer="51"/>
<wire x1="-1.27" y1="-1.25" x2="13.97" y2="-1.25" width="0.127" layer="51"/>
<wire x1="13.97" y1="-1.25" x2="13.97" y2="1.25" width="0.127" layer="51"/>
<wire x1="13.97" y1="1.25" x2="-1.27" y2="1.25" width="0.127" layer="51"/>
<circle x="0" y="0" radius="0.64" width="0.127" layer="51"/>
<circle x="2.54" y="0" radius="0.64" width="0.127" layer="51"/>
<circle x="5.08" y="0" radius="0.64" width="0.127" layer="51"/>
<circle x="7.62" y="0" radius="0.64" width="0.127" layer="51"/>
<circle x="10.16" y="0" radius="0.64" width="0.127" layer="51"/>
<circle x="12.7" y="0" radius="0.64" width="0.127" layer="51"/>
<rectangle x1="-0.32" y1="0" x2="0.32" y2="2.75" layer="51"/>
<rectangle x1="4.76" y1="0" x2="5.4" y2="2.75" layer="51"/>
<rectangle x1="9.84" y1="0" x2="10.48" y2="2.75" layer="51"/>
<rectangle x1="2.22" y1="-2.75" x2="2.86" y2="0" layer="51" rot="R180"/>
<rectangle x1="7.3" y1="-2.75" x2="7.94" y2="0" layer="51" rot="R180"/>
<rectangle x1="12.38" y1="-2.75" x2="13.02" y2="0" layer="51" rot="R180"/>
<smd name="1" x="0" y="0" dx="1.02" dy="6" layer="1"/>
<smd name="2" x="2.54" y="0" dx="1.02" dy="6" layer="1"/>
<smd name="3" x="5.08" y="0" dx="1.02" dy="6" layer="1"/>
<smd name="4" x="7.62" y="0" dx="1.02" dy="6" layer="1"/>
<smd name="5" x="10.16" y="0" dx="1.02" dy="6" layer="1"/>
<smd name="6" x="12.7" y="0" dx="1.02" dy="6" layer="1"/>
<wire x1="-1.27" y1="1.25" x2="-1.27" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="-1.27" y1="-1.25" x2="-0.635" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="-1.27" y1="1.25" x2="-0.635" y2="1.25" width="0.1778" layer="21"/>
<wire x1="0.762" y1="1.25" x2="1.778" y2="1.25" width="0.1778" layer="21"/>
<wire x1="3.302" y1="1.25" x2="4.318" y2="1.25" width="0.1778" layer="21"/>
<wire x1="5.842" y1="1.25" x2="6.858" y2="1.25" width="0.1778" layer="21"/>
<wire x1="8.382" y1="1.25" x2="9.398" y2="1.25" width="0.1778" layer="21"/>
<wire x1="10.922" y1="1.25" x2="11.938" y2="1.25" width="0.1778" layer="21"/>
<wire x1="1.778" y1="-1.25" x2="0.762" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="4.318" y1="-1.25" x2="3.302" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="6.858" y1="-1.25" x2="5.842" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="9.398" y1="-1.25" x2="8.382" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="11.938" y1="-1.25" x2="10.922" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="13.97" y1="-1.25" x2="13.97" y2="1.25" width="0.1778" layer="21"/>
<wire x1="13.97" y1="-1.25" x2="13.335" y2="-1.25" width="0.1778" layer="21"/>
<wire x1="13.97" y1="1.25" x2="13.335" y2="1.25" width="0.1778" layer="21"/>
<text x="-0.508" y="3.302" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-0.635" y="-3.937" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06-1MM">
<description>&lt;h3&gt;JST SH Vertical  6-Pin Connector -SMD&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:1mm&lt;/li&gt;
&lt;p&gt;&lt;b&gt;&lt;a href="https://www.sparkfun.com/datasheets/GPS/EM406-SMDConnector-eSH.pdf"&gt;Datasheet referenced for footprint&lt;/a&gt;&lt;/b&gt;&lt;/p&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;li&gt;EM-406&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-2.54" y1="-1.651" x2="2.54" y2="-1.651" width="0.254" layer="21"/>
<wire x1="-4.318" y1="0.508" x2="-4.318" y2="1.905" width="0.254" layer="21"/>
<wire x1="3.302" y1="1.905" x2="4.318" y2="1.905" width="0.254" layer="21"/>
<wire x1="4.318" y1="1.905" x2="4.318" y2="0.508" width="0.254" layer="21"/>
<wire x1="-4.318" y1="1.905" x2="-3.302" y2="1.905" width="0.254" layer="21"/>
<smd name="1" x="-2.54" y="1.27" dx="0.6" dy="1.55" layer="1"/>
<smd name="2" x="-1.54" y="1.27" dx="0.6" dy="1.55" layer="1"/>
<smd name="3" x="-0.54" y="1.27" dx="0.6" dy="1.55" layer="1"/>
<smd name="4" x="0.46" y="1.27" dx="0.6" dy="1.55" layer="1"/>
<smd name="5" x="1.46" y="1.27" dx="0.6" dy="1.55" layer="1"/>
<smd name="6" x="2.46" y="1.27" dx="0.6" dy="1.55" layer="1"/>
<smd name="P$1" x="-3.84" y="-0.955" dx="1.2" dy="1.8" layer="1"/>
<smd name="P$2" x="3.76" y="-0.955" dx="1.2" dy="1.8" layer="1"/>
<text x="-1.397" y="-0.381" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.651" y="-1.27" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
<circle x="-3.6" y="2.47" radius="0.1047" width="0.4064" layer="21"/>
</package>
<package name="1X06_NO_SILK">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin No Silk Outline&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:0.1"&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<pad name="1" x="0" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="2" x="2.54" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="3" x="5.08" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="4" x="7.62" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="5" x="10.16" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<pad name="6" x="12.7" y="0" drill="1.016" diameter="1.8796" rot="R90"/>
<rectangle x1="12.446" y1="-0.254" x2="12.954" y2="0.254" layer="51"/>
<rectangle x1="9.906" y1="-0.254" x2="10.414" y2="0.254" layer="51"/>
<rectangle x1="7.366" y1="-0.254" x2="7.874" y2="0.254" layer="51"/>
<rectangle x1="4.826" y1="-0.254" x2="5.334" y2="0.254" layer="51"/>
<rectangle x1="2.286" y1="-0.254" x2="2.794" y2="0.254" layer="51"/>
<rectangle x1="-0.254" y1="-0.254" x2="0.254" y2="0.254" layer="51"/>
<text x="-1.27" y="1.397" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-1.27" y="-2.032" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_1.27MM">
<description>&lt;h3&gt;Plated Through Hole - 6 Pin&lt;/h3&gt;
&lt;p&gt;Specifications:
&lt;ul&gt;&lt;li&gt;Pin count:6&lt;/li&gt;
&lt;li&gt;Pin pitch:1.27mm&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;
&lt;p&gt;Example device(s):
&lt;ul&gt;&lt;li&gt;CONN_06&lt;/li&gt;
&lt;/ul&gt;&lt;/p&gt;</description>
<wire x1="-0.381" y1="-0.889" x2="0.381" y2="-0.889" width="0.127" layer="21"/>
<wire x1="0.381" y1="-0.889" x2="0.635" y2="-0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="-0.635" x2="0.889" y2="-0.889" width="0.127" layer="21"/>
<wire x1="0.889" y1="-0.889" x2="1.651" y2="-0.889" width="0.127" layer="21"/>
<wire x1="1.651" y1="-0.889" x2="1.905" y2="-0.635" width="0.127" layer="21"/>
<wire x1="1.905" y1="-0.635" x2="2.159" y2="-0.889" width="0.127" layer="21"/>
<wire x1="2.159" y1="-0.889" x2="2.921" y2="-0.889" width="0.127" layer="21"/>
<wire x1="2.921" y1="-0.889" x2="3.175" y2="-0.635" width="0.127" layer="21"/>
<wire x1="3.175" y1="-0.635" x2="3.429" y2="-0.889" width="0.127" layer="21"/>
<wire x1="3.429" y1="-0.889" x2="4.191" y2="-0.889" width="0.127" layer="21"/>
<wire x1="4.191" y1="-0.889" x2="4.445" y2="-0.635" width="0.127" layer="21"/>
<wire x1="4.445" y1="-0.635" x2="4.699" y2="-0.889" width="0.127" layer="21"/>
<wire x1="4.699" y1="-0.889" x2="5.461" y2="-0.889" width="0.127" layer="21"/>
<wire x1="5.461" y1="0.889" x2="4.699" y2="0.889" width="0.127" layer="21"/>
<wire x1="4.699" y1="0.889" x2="4.445" y2="0.635" width="0.127" layer="21"/>
<wire x1="4.445" y1="0.635" x2="4.191" y2="0.889" width="0.127" layer="21"/>
<wire x1="4.191" y1="0.889" x2="3.429" y2="0.889" width="0.127" layer="21"/>
<wire x1="3.429" y1="0.889" x2="3.175" y2="0.635" width="0.127" layer="21"/>
<wire x1="3.175" y1="0.635" x2="2.921" y2="0.889" width="0.127" layer="21"/>
<wire x1="2.921" y1="0.889" x2="2.159" y2="0.889" width="0.127" layer="21"/>
<wire x1="2.159" y1="0.889" x2="1.905" y2="0.635" width="0.127" layer="21"/>
<wire x1="1.905" y1="0.635" x2="1.651" y2="0.889" width="0.127" layer="21"/>
<wire x1="1.651" y1="0.889" x2="0.889" y2="0.889" width="0.127" layer="21"/>
<wire x1="0.889" y1="0.889" x2="0.635" y2="0.635" width="0.127" layer="21"/>
<wire x1="0.635" y1="0.635" x2="0.381" y2="0.889" width="0.127" layer="21"/>
<wire x1="0.381" y1="0.889" x2="-0.381" y2="0.889" width="0.127" layer="21"/>
<wire x1="-0.381" y1="0.889" x2="-0.889" y2="0.381" width="0.127" layer="21"/>
<wire x1="-0.889" y1="-0.381" x2="-0.381" y2="-0.889" width="0.127" layer="21"/>
<wire x1="-0.889" y1="0.381" x2="-0.889" y2="-0.381" width="0.127" layer="21"/>
<pad name="5" x="5.08" y="0" drill="0.508" diameter="1"/>
<pad name="4" x="3.81" y="0" drill="0.508" diameter="1"/>
<pad name="3" x="2.54" y="0" drill="0.508" diameter="1"/>
<pad name="2" x="1.27" y="0" drill="0.508" diameter="1"/>
<pad name="1" x="0" y="0" drill="0.508" diameter="1"/>
<pad name="6" x="6.35" y="0" drill="0.508" diameter="1"/>
<wire x1="5.461" y1="-0.889" x2="5.715" y2="-0.635" width="0.127" layer="21"/>
<wire x1="5.715" y1="-0.635" x2="5.969" y2="-0.889" width="0.127" layer="21"/>
<wire x1="5.969" y1="-0.889" x2="6.731" y2="-0.889" width="0.127" layer="21"/>
<wire x1="6.731" y1="0.889" x2="5.969" y2="0.889" width="0.127" layer="21"/>
<wire x1="5.969" y1="0.889" x2="5.715" y2="0.635" width="0.127" layer="21"/>
<wire x1="5.715" y1="0.635" x2="5.461" y2="0.889" width="0.127" layer="21"/>
<wire x1="6.731" y1="0.889" x2="7.239" y2="0.381" width="0.127" layer="21"/>
<wire x1="7.239" y1="0.381" x2="7.239" y2="-0.381" width="0.127" layer="21"/>
<wire x1="7.239" y1="-0.381" x2="6.731" y2="-0.889" width="0.127" layer="21"/>
<text x="-0.381" y="1.016" size="0.6096" layer="25" font="vector" ratio="20">&gt;NAME</text>
<text x="-0.381" y="-1.651" size="0.6096" layer="27" font="vector" ratio="20">&gt;VALUE</text>
</package>
<package name="1X06_SCREW_TERMINAL_BLOCK">
<wire x1="-10.4" y1="-4.85" x2="10.4" y2="-4.85" width="0.2032" layer="51"/>
<wire x1="10.4" y1="-4.85" x2="10.4" y2="6.05" width="0.2032" layer="51"/>
<wire x1="10.4" y1="6.05" x2="-10.4" y2="6.05" width="0.2032" layer="51"/>
<wire x1="-10.4" y1="6.05" x2="-10.4" y2="-4.85" width="0.2032" layer="51"/>
<rectangle x1="-9.275" y1="-4.9" x2="-8.225" y2="-1.225" layer="51"/>
<rectangle x1="-5.775" y1="-4.9" x2="-4.725" y2="-1.225" layer="51"/>
<rectangle x1="-2.275" y1="-4.9" x2="-1.225" y2="-1.225" layer="51"/>
<rectangle x1="1.225" y1="-4.9" x2="2.275" y2="-1.225" layer="51"/>
<rectangle x1="4.725" y1="-4.9" x2="5.775" y2="-1.225" layer="51"/>
<rectangle x1="8.225" y1="-4.9" x2="9.275" y2="-1.225" layer="51"/>
<pad name="1" x="-8.75" y="5.25" drill="1.4224" shape="long" rot="R90"/>
<pad name="2" x="-5.25" y="5.25" drill="1.4224" shape="long" rot="R90"/>
<pad name="3" x="-1.75" y="5.25" drill="1.4224" shape="long" rot="R90"/>
<pad name="4" x="1.75" y="5.25" drill="1.4224" shape="long" rot="R90"/>
<pad name="5" x="5.25" y="5.25" drill="1.4224" shape="long" rot="R90"/>
<pad name="6" x="8.75" y="5.25" drill="1.4224" shape="long" rot="R90"/>
<text x="-3.67" y="7.635" size="1.27" layer="25">&gt;NAME</text>
<text x="-3.67" y="-6.505" size="1.27" layer="27">&gt;VALUE</text>
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
<pin name="1" x="7.62" y="-2.54" visible="pad" length="middle" direction="pwr" swaplevel="1" rot="R180"/>
<pin name="2" x="7.62" y="0" visible="pad" length="middle" direction="pwr" swaplevel="1" rot="R180"/>
<pin name="3" x="7.62" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="7.62" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<text x="-4.572" y="2.54" size="1.778" layer="94" font="vector" align="center-left">SDA</text>
<text x="-4.572" y="0" size="1.778" layer="94" font="vector" align="center-left">VCC</text>
<text x="-4.572" y="-2.54" size="1.778" layer="94" font="vector" align="center-left">GND</text>
<text x="-4.572" y="5.08" size="1.778" layer="94" font="vector" align="center-left">SCL</text>
</symbol>
<symbol name="CONN_06">
<description>&lt;h3&gt;6 Pin Connection&lt;/h3&gt;</description>
<wire x1="1.27" y1="-7.62" x2="-5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="0" x2="0" y2="0" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="-2.54" x2="0" y2="-2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="-5.08" x2="0" y2="-5.08" width="0.6096" layer="94"/>
<wire x1="-5.08" y1="10.16" x2="-5.08" y2="-7.62" width="0.4064" layer="94"/>
<wire x1="1.27" y1="-7.62" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-5.08" y1="10.16" x2="1.27" y2="10.16" width="0.4064" layer="94"/>
<wire x1="-1.27" y1="5.08" x2="0" y2="5.08" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="2.54" x2="0" y2="2.54" width="0.6096" layer="94"/>
<wire x1="-1.27" y1="7.62" x2="0" y2="7.62" width="0.6096" layer="94"/>
<text x="-5.08" y="-9.906" size="1.778" layer="96" font="vector">&gt;VALUE</text>
<text x="-5.08" y="10.668" size="1.778" layer="95" font="vector">&gt;NAME</text>
<pin name="1" x="5.08" y="-5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="2" x="5.08" y="-2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="3" x="5.08" y="0" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="4" x="5.08" y="2.54" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="5" x="5.08" y="5.08" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
<pin name="6" x="5.08" y="7.62" visible="pad" length="middle" direction="pas" swaplevel="1" rot="R180"/>
</symbol>
</symbols>
<devicesets>
<deviceset name="QWIIC_CONNECTOR" prefix="J" uservalue="yes">
<description>&lt;h3&gt;SparkFun I&lt;sup&gt;2&lt;/sup&gt;C Standard Qwiic Connector&lt;/h3&gt;
An SMD 1mm pitch JST connector makes it easy and quick (get it? Qwiic?) to connect I&lt;sup&gt;2&lt;/sup&gt;C devices to each other. The &lt;a href=”http://www.sparkfun.com/qwiic”&gt;Qwiic system&lt;/a&gt; enables fast and solderless connection between popular platforms and various sensors and actuators.

&lt;br&gt;&lt;br&gt;

We carry &lt;a href=”https://www.sparkfun.com/products/14204”&gt;200mm&lt;/a&gt;, &lt;a href=”https://www.sparkfun.com/products/14205”&gt;100mm&lt;/a&gt;, &lt;a href=”https://www.sparkfun.com/products/14206”&gt;50mm&lt;/a&gt;, and &lt;a href=”https://www.sparkfun.com/products/14207”&gt;breadboard friendly&lt;/a&gt; Qwiic cables. We also offer &lt;a href=”https://www.sparkfun.com/products/14323”&gt;10 pcs strips&lt;/a&gt; the SMD connectors.</description>
<gates>
<gate name="G$1" symbol="I2C_STANDARD" x="0" y="0"/>
</gates>
<devices>
<device name="JS-1MM" package="1X04_1MM_RA">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-13694" constant="no"/>
<attribute name="VALUE" value="" constant="no"/>
</technology>
</technologies>
</device>
<device name="SR" package="1X04_1MM_RA_STRESSRELIEF">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
</devices>
</deviceset>
<deviceset name="CONN_06" prefix="J" uservalue="yes">
<description>&lt;h3&gt;Multi connection point. Often used as Generic Header-pin footprint for 0.1 inch spaced/style header connections&lt;/h3&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;On any of the 0.1 inch spaced packages, you can populate with these:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/116"&gt; Break Away Headers - Straight&lt;/a&gt; (PRT-00116)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/553"&gt; Break Away Male Headers - Right Angle&lt;/a&gt; (PRT-00553)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/115"&gt; Female Headers&lt;/a&gt; (PRT-00115)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/117"&gt; Break Away Headers - Machine Pin&lt;/a&gt; (PRT-00117)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/743"&gt; Break Away Female Headers - Swiss Machine Pin&lt;/a&gt; (PRT-00743)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/9280"&gt; Arduino Stackable Header - 6 Pin&lt;/a&gt; (PRT-09280)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt; For SCREWTERMINALS and SPRING TERMINALS visit here:&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/search/results?term=Screw+Terminals"&gt; Screw Terimnals on SparkFun.com&lt;/a&gt; (5mm/3.5mm/2.54mm spacing)&lt;/li&gt;
&lt;/ul&gt;

&lt;p&gt;&lt;/p&gt;
&lt;b&gt;This device is also useful as a general connection point to wire up your design to another part of your project. Our various solder wires solder well into these plated through hole pads.&lt;/b&gt;
&lt;ul&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11375"&gt; Hook-Up Wire - Assortment (Stranded, 22 AWG)&lt;/a&gt; (PRT-11375)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/products/11367"&gt; Hook-Up Wire - Assortment (Solid Core, 22 AWG)&lt;/a&gt; (PRT-11367)&lt;/li&gt;
&lt;li&gt;&lt;a href="https://www.sparkfun.com/categories/141"&gt; View the entire wire category on our website here&lt;/a&gt;&lt;/li&gt;
&lt;p&gt;&lt;/p&gt;
&lt;/ul&gt;</description>
<gates>
<gate name="G$1" symbol="CONN_06" x="-2.54" y="0"/>
</gates>
<devices>
<device name="SILK_FEMALE_PTH" package="1X06">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08437"/>
</technology>
</technologies>
</device>
<device name="POLAR" package="MOLEX-1X6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RA" package="MOLEX-1X6-RA">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD" package="1X06-SMD_RA_MALE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08971" constant="no"/>
<attribute name="VALUE" value="RA 6Pin SMD" constant="no"/>
</technology>
</technologies>
</device>
<device name="LOCK" package="1X06_LOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LOCK_LONGPADS" package="1X06_LOCK_LONGPADS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="POLAR_LOCK" package="MOLEX-1X6_LOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="RA_LOCK" package="MOLEX_1X6_RA_LOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="FEMALE_LOCK" package="1X06_FEMALE_LOCK.010">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="LONGPADS" package="1X06_LONGPADS">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="3.5MM-6" package="SCREWTERMINAL-3.5MM-6">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="SMD-FEMALE-V2" package="1X06-SMD-FEMALE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-09668"/>
</technology>
</technologies>
</device>
<device name="POGOPIN_HOLES_ONLY" package="1X06_HOLES_ONLY">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08437"/>
</technology>
</technologies>
</device>
<device name="SMD-STRAIGHT-FEMALE" package="1X06_SMD_STRAIGHT">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-10203"/>
</technology>
</technologies>
</device>
<device name="SMD-STRAIGHT-ALT-FEMALE" package="1X06_SMD_STRAIGHT_ALT">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-10203"/>
</technology>
</technologies>
</device>
<device name="SMD-STRAIGHT-COMBO-FEMALE" package="1X06_SMD_STRAIGHT_COMBO">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-10203"/>
</technology>
</technologies>
</device>
<device name="SMD_MALE" package="1X06_SMD_MALE">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-11293"/>
</technology>
</technologies>
</device>
<device name="SMD-1MM" package="1X06-1MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08249" constant="no"/>
<attribute name="SF_ID" value="GPS-00579" constant="no"/>
</technology>
</technologies>
</device>
<device name="NO_SILK_FEMALE_PTH" package="1X06_NO_SILK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name="">
<attribute name="PROD_ID" value="CONN-08437"/>
</technology>
</technologies>
</device>
<device name="1.27MM" package="1X06_1.27MM">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="NO_SILK_NO_POP" package="1X06_NO_SILK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
<technologies>
<technology name=""/>
</technologies>
</device>
<device name="2.5MM-6-90" package="1X06_SCREW_TERMINAL_BLOCK">
<connects>
<connect gate="G$1" pin="1" pad="1"/>
<connect gate="G$1" pin="2" pad="2"/>
<connect gate="G$1" pin="3" pad="3"/>
<connect gate="G$1" pin="4" pad="4"/>
<connect gate="G$1" pin="5" pad="5"/>
<connect gate="G$1" pin="6" pad="6"/>
</connects>
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
<modules>
<module name="TEST" prefix="" dx="30.48" dy="20.32">
<ports>
</ports>
<variantdefs>
</variantdefs>
<parts>
</parts>
<sheets>
<sheet>
<plain>
</plain>
<instances>
</instances>
<busses>
</busses>
<nets>
</nets>
</sheet>
</sheets>
</module>
</modules>
<parts>
<part name="PORTENTA_H7" library="ABX00042" deviceset="ABX00042" device=""/>
<part name="U$10" library="microbuilder" deviceset="GND" device=""/>
<part name="U$16" library="microbuilder" deviceset="3.3V" device=""/>
<part name="JP1" library="microbuilder" deviceset="HEADER-1X6" device="70MIL"/>
<part name="P+4" library="supply1" library_urn="urn:adsk.eagle:library:371" deviceset="VCC" device=""/>
<part name="JP2" library="microbuilder" deviceset="HEADER-1X6" device="70MIL"/>
<part name="GND6" library="SparkFun" deviceset="GND" device=""/>
<part name="SUPPLY4" library="SparkFun-PowerSymbols" deviceset="3.3V" device=""/>
<part name="J2" library="SparkFun-Connectors" deviceset="QWIIC_CONNECTOR" device="JS-1MM" value="SMD"/>
<part name="GND11" library="SparkFun" deviceset="GND" device=""/>
<part name="SUPPLY7" library="SparkFun-PowerSymbols" deviceset="3.3V" device=""/>
<part name="J3" library="SparkX" deviceset="I2C_STANDARD" device="_NO_SILK" value="PTH"/>
<part name="GND12" library="SparkFun" deviceset="GND" device=""/>
<part name="SUPPLY8" library="SparkFun-PowerSymbols" deviceset="3.3V" device=""/>
<part name="J4" library="SparkFun-Connectors" deviceset="QWIIC_CONNECTOR" device="JS-1MM" value="SMD"/>
<part name="GND13" library="SparkFun" deviceset="GND" device=""/>
<part name="P+1" library="SparkFun" deviceset="3.3V" device=""/>
<part name="J6" library="SparkFun-Connectors" deviceset="CONN_06" device="NO_SILK_NO_POP"/>
</parts>
<sheets>
<sheet>
<plain>
<text x="0" y="5.08" size="1.778" layer="91">ACE SCHEMATIC</text>
<text x="0" y="-10.16" size="1.778" layer="91">Note: Portenta H7 is not lite version. Should be fine, given only VIN, GND, and any serial comm/electromotive/analog IO will be used</text>
<text x="121.92" y="78.74" size="1.778" layer="91">OpenLog Comms Pinout</text>
<text x="119.38" y="124.46" size="1.778" layer="91">BNO085 Comms Pinout</text>
</plain>
<instances>
<instance part="PORTENTA_H7" gate="G$1" x="50.8" y="71.12" smashed="yes">
<attribute name="NAME" x="30.48" y="123.19" size="1.778" layer="95"/>
<attribute name="VALUE" x="30.48" y="17.78" size="1.778" layer="96"/>
</instance>
<instance part="U$10" gate="G$1" x="149.86" y="101.6" smashed="yes">
<attribute name="VALUE" x="148.336" y="99.06" size="1.27" layer="96"/>
</instance>
<instance part="U$16" gate="G$1" x="124.46" y="116.84" smashed="yes">
<attribute name="VALUE" x="122.936" y="117.856" size="1.27" layer="96"/>
</instance>
<instance part="JP1" gate="A" x="142.24" y="101.6" smashed="yes">
<attribute name="NAME" x="135.89" y="112.395" size="1.778" layer="95"/>
<attribute name="VALUE" x="135.89" y="91.44" size="1.778" layer="96"/>
</instance>
<instance part="P+4" gate="VCC" x="132.08" y="116.84" smashed="yes">
<attribute name="VALUE" x="129.54" y="114.3" size="1.778" layer="96" rot="R90"/>
</instance>
<instance part="JP2" gate="A" x="175.26" y="101.6" smashed="yes">
<attribute name="NAME" x="168.91" y="112.395" size="1.778" layer="95"/>
<attribute name="VALUE" x="168.91" y="91.44" size="1.778" layer="96"/>
</instance>
<instance part="GND6" gate="1" x="170.18" y="22.86" smashed="yes">
<attribute name="VALUE" x="167.64" y="20.32" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY4" gate="G$1" x="129.54" y="71.12" smashed="yes">
<attribute name="VALUE" x="129.54" y="73.914" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="J2" gate="G$1" x="139.7" y="63.5" smashed="yes" rot="MR0">
<attribute name="VALUE" x="144.78" y="58.166" size="1.778" layer="96" font="vector" rot="MR0" align="top-left"/>
<attribute name="NAME" x="144.78" y="71.374" size="1.778" layer="95" font="vector" rot="MR0"/>
</instance>
<instance part="GND11" gate="1" x="129.54" y="55.88" smashed="yes">
<attribute name="VALUE" x="127" y="53.34" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY7" gate="G$1" x="160.02" y="71.12" smashed="yes">
<attribute name="VALUE" x="160.02" y="73.914" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="J3" gate="G$1" x="170.18" y="63.5" smashed="yes" rot="MR0">
<attribute name="VALUE" x="175.26" y="58.166" size="1.778" layer="96" font="vector" rot="MR0" align="top-left"/>
<attribute name="NAME" x="175.26" y="71.374" size="1.778" layer="95" font="vector" rot="MR0"/>
</instance>
<instance part="GND12" gate="1" x="160.02" y="55.88" smashed="yes">
<attribute name="VALUE" x="157.48" y="53.34" size="1.778" layer="96"/>
</instance>
<instance part="SUPPLY8" gate="G$1" x="129.54" y="43.18" smashed="yes">
<attribute name="VALUE" x="129.54" y="45.974" size="1.778" layer="96" align="bottom-center"/>
</instance>
<instance part="J4" gate="G$1" x="139.7" y="35.56" smashed="yes" rot="MR0">
<attribute name="VALUE" x="144.78" y="30.226" size="1.778" layer="96" font="vector" rot="MR0" align="top-left"/>
<attribute name="NAME" x="144.78" y="43.434" size="1.778" layer="95" font="vector" rot="MR0"/>
</instance>
<instance part="GND13" gate="1" x="129.54" y="27.94" smashed="yes">
<attribute name="VALUE" x="127" y="25.4" size="1.778" layer="96"/>
</instance>
<instance part="P+1" gate="G$1" x="170.18" y="43.18" smashed="yes">
<attribute name="VALUE" x="167.894" y="46.736" size="1.778" layer="96"/>
</instance>
<instance part="J6" gate="G$1" x="162.56" y="33.02" smashed="yes">
<attribute name="VALUE" x="157.48" y="23.114" size="1.778" layer="96" font="vector"/>
<attribute name="NAME" x="157.48" y="43.688" size="1.778" layer="95" font="vector"/>
</instance>
</instances>
<busses>
</busses>
<nets>
<net name="GND" class="2">
<segment>
<pinref part="U$10" gate="G$1" pin="GND"/>
<wire x1="139.7" y1="104.14" x2="149.86" y2="104.14" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="3"/>
</segment>
<segment>
<wire x1="170.18" y1="27.94" x2="170.18" y2="25.4" width="0.1524" layer="91"/>
<pinref part="GND6" gate="1" pin="GND"/>
<wire x1="167.64" y1="30.48" x2="170.18" y2="30.48" width="0.1524" layer="91"/>
<wire x1="170.18" y1="30.48" x2="170.18" y2="27.94" width="0.1524" layer="91"/>
<wire x1="167.64" y1="27.94" x2="170.18" y2="27.94" width="0.1524" layer="91"/>
<junction x="170.18" y="27.94"/>
<pinref part="J6" gate="G$1" pin="1"/>
<pinref part="J6" gate="G$1" pin="2"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="1"/>
<wire x1="132.08" y1="60.96" x2="129.54" y2="60.96" width="0.1524" layer="91"/>
<wire x1="129.54" y1="60.96" x2="129.54" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND11" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="GND"/>
<wire x1="162.56" y1="60.96" x2="160.02" y2="60.96" width="0.1524" layer="91"/>
<wire x1="160.02" y1="60.96" x2="160.02" y2="58.42" width="0.1524" layer="91"/>
<pinref part="GND12" gate="1" pin="GND"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="1"/>
<wire x1="132.08" y1="33.02" x2="129.54" y2="33.02" width="0.1524" layer="91"/>
<wire x1="129.54" y1="33.02" x2="129.54" y2="30.48" width="0.1524" layer="91"/>
<pinref part="GND13" gate="1" pin="GND"/>
</segment>
</net>
<net name="SCL/SCK/RX" class="0">
<segment>
<wire x1="139.7" y1="101.6" x2="119.38" y2="101.6" width="0.1524" layer="91"/>
<label x="119.38" y="101.6" size="1.778" layer="95"/>
<pinref part="JP1" gate="A" pin="4"/>
</segment>
</net>
<net name="SDA/MISO/TX" class="0">
<segment>
<wire x1="139.7" y1="99.06" x2="119.38" y2="99.06" width="0.1524" layer="91"/>
<label x="119.38" y="99.06" size="1.778" layer="95"/>
<pinref part="JP1" gate="A" pin="5"/>
</segment>
</net>
<net name="VCC" class="2">
<segment>
<wire x1="139.7" y1="109.22" x2="132.08" y2="109.22" width="0.1524" layer="91"/>
<wire x1="132.08" y1="109.22" x2="132.08" y2="114.3" width="0.1524" layer="91"/>
<pinref part="JP1" gate="A" pin="1"/>
<pinref part="P+4" gate="VCC" pin="VCC"/>
</segment>
</net>
<net name="3.3V" class="2">
<segment>
<wire x1="139.7" y1="106.68" x2="124.46" y2="106.68" width="0.1524" layer="91"/>
<wire x1="124.46" y1="106.68" x2="124.46" y2="114.3" width="0.1524" layer="91"/>
<pinref part="U$16" gate="G$1" pin="3.3V"/>
<pinref part="JP1" gate="A" pin="2"/>
</segment>
<segment>
<pinref part="J2" gate="G$1" pin="2"/>
<wire x1="132.08" y1="63.5" x2="129.54" y2="63.5" width="0.1524" layer="91"/>
<wire x1="129.54" y1="63.5" x2="129.54" y2="71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY4" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="VCC"/>
<wire x1="162.56" y1="63.5" x2="160.02" y2="63.5" width="0.1524" layer="91"/>
<wire x1="160.02" y1="63.5" x2="160.02" y2="71.12" width="0.1524" layer="91"/>
<pinref part="SUPPLY7" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="2"/>
<wire x1="132.08" y1="35.56" x2="129.54" y2="35.56" width="0.1524" layer="91"/>
<wire x1="129.54" y1="35.56" x2="129.54" y2="43.18" width="0.1524" layer="91"/>
<pinref part="SUPPLY8" gate="G$1" pin="3.3V"/>
</segment>
<segment>
<wire x1="167.64" y1="33.02" x2="170.18" y2="33.02" width="0.1524" layer="91"/>
<wire x1="170.18" y1="33.02" x2="170.18" y2="43.18" width="0.1524" layer="91"/>
<pinref part="P+1" gate="G$1" pin="3.3V"/>
<pinref part="J6" gate="G$1" pin="3"/>
</segment>
</net>
<net name="INT" class="0">
<segment>
<pinref part="JP1" gate="A" pin="6"/>
<wire x1="139.7" y1="96.52" x2="119.38" y2="96.52" width="0.1524" layer="91"/>
<label x="119.38" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="PS1" class="0">
<segment>
<pinref part="JP2" gate="A" pin="3"/>
<wire x1="172.72" y1="104.14" x2="157.48" y2="104.14" width="0.1524" layer="91"/>
<label x="157.48" y="104.14" size="1.778" layer="95"/>
</segment>
</net>
<net name="PS0" class="0">
<segment>
<pinref part="JP2" gate="A" pin="2"/>
<wire x1="172.72" y1="106.68" x2="157.48" y2="106.68" width="0.1524" layer="91"/>
<label x="157.48" y="106.68" size="1.778" layer="95"/>
</segment>
</net>
<net name="RST" class="0">
<segment>
<pinref part="JP2" gate="A" pin="4"/>
<wire x1="172.72" y1="101.6" x2="157.48" y2="101.6" width="0.1524" layer="91"/>
<label x="157.48" y="101.6" size="1.778" layer="95"/>
</segment>
</net>
<net name="MOSI" class="0">
<segment>
<pinref part="JP2" gate="A" pin="5"/>
<wire x1="172.72" y1="99.06" x2="157.48" y2="99.06" width="0.1524" layer="91"/>
<label x="157.48" y="99.06" size="1.778" layer="95"/>
</segment>
</net>
<net name="BOOT" class="0">
<segment>
<pinref part="JP2" gate="A" pin="1"/>
<wire x1="172.72" y1="109.22" x2="157.48" y2="109.22" width="0.1524" layer="91"/>
<label x="157.48" y="109.22" size="1.778" layer="95"/>
</segment>
</net>
<net name="CS" class="0">
<segment>
<pinref part="JP2" gate="A" pin="6"/>
<wire x1="172.72" y1="96.52" x2="157.48" y2="96.52" width="0.1524" layer="91"/>
<label x="157.48" y="96.52" size="1.778" layer="95"/>
</segment>
</net>
<net name="TXO" class="0">
<segment>
<wire x1="167.64" y1="38.1" x2="172.72" y2="38.1" width="0.1524" layer="91"/>
<label x="172.72" y="38.1" size="1.27" layer="95" rot="MR180" xref="yes"/>
<pinref part="J6" gate="G$1" pin="5"/>
</segment>
</net>
<net name="DTR" class="0">
<segment>
<wire x1="167.64" y1="40.64" x2="172.72" y2="40.64" width="0.1524" layer="91"/>
<label x="172.72" y="40.64" size="1.27" layer="95" rot="MR180" xref="yes"/>
<pinref part="J6" gate="G$1" pin="6"/>
</segment>
</net>
<net name="RXI" class="0">
<segment>
<wire x1="167.64" y1="35.56" x2="172.72" y2="35.56" width="0.1524" layer="91"/>
<label x="172.72" y="35.56" size="1.27" layer="95" rot="MR180" xref="yes"/>
<pinref part="J6" gate="G$1" pin="4"/>
</segment>
</net>
<net name="SCL" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="4"/>
<wire x1="132.08" y1="68.58" x2="127" y2="68.58" width="0.1524" layer="91"/>
<label x="127" y="68.58" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="SCL"/>
<wire x1="162.56" y1="68.58" x2="157.48" y2="68.58" width="0.1524" layer="91"/>
<label x="157.48" y="68.58" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="4"/>
<wire x1="132.08" y1="40.64" x2="127" y2="40.64" width="0.1524" layer="91"/>
<label x="127" y="40.64" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
</net>
<net name="SDA" class="0">
<segment>
<pinref part="J2" gate="G$1" pin="3"/>
<wire x1="132.08" y1="66.04" x2="127" y2="66.04" width="0.1524" layer="91"/>
<label x="127" y="66.04" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J3" gate="G$1" pin="SDA"/>
<wire x1="162.56" y1="66.04" x2="157.48" y2="66.04" width="0.1524" layer="91"/>
<label x="157.48" y="66.04" size="1.27" layer="95" rot="R180" xref="yes"/>
</segment>
<segment>
<pinref part="J4" gate="G$1" pin="3"/>
<wire x1="132.08" y1="38.1" x2="127" y2="38.1" width="0.1524" layer="91"/>
<label x="127" y="38.1" size="1.27" layer="95" rot="R180" xref="yes"/>
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
