//Since the base numbers 2-10 follow this exact format, Its obviously easier to reuse a method rather than have many methods doing essentially the same thing
//As well as being more efficient, it is impossible for some base numbers to convert directly into others, as per the Distributed rule (http://mathforum.org/library/drmath/view/62037.html)
//i.e. Base 4 can convert directly to Base 16, however, Base 5 cannot convert directly to Base 20, and must be converted to another base number first, in this case, Decimal

public static String BaseBaseM(String s, Integer t, Integer u) {

  //Converts to Decimal first
  String chars = "0123456789ABCDEFGHIJLKMNOPQRSTUVWXYZ";  //the index of each character in this string corresponds to the number it holds with numbers of a base number; i.e. J, is at index 19 of this string, and corresponds to 19 in base20
  int BaseBasetotal = 0;
  ArrayList<Integer> BaseBase = new ArrayList<Integer>();

  for (int i = 0; i < String.valueOf(s).length(); i++) { //adds each char of string to an arraylist
    BaseBase.add(chars.indexOf(s.charAt(i)));
  }

  Collections.reverse(BaseBase); //reverse arraylist

  for (int i = 0; i < BaseBase.size(); i++) {  //converts arraylist to decimal and sets it to variable BaseBasetotal
    BaseBase.set(i, (int) (BaseBase.get(i) * Math.pow(u, i)));
    BaseBasetotal += BaseBase.get(i);
  }
  //Then converts to the required base number
  return DecBaseM(BaseBasetotal, t);
}

public static String DecBaseM(Integer s, Integer t) {
  ArrayList<String> DecBase = new ArrayList<String>();
  String DBaseAns = "";
  String chars = "0123456789ABCDEFGHIJLKMNOPQRSTUVWXYZ";

  while (s > 0) {
    DecBase.add(String.valueOf(chars.charAt(s % t))); // Divide and get remainder
    s /= t;
  }
  for (int i = DecBase.size() - 1; i >= 0; i--) {     //outputs in reverse

    DBaseAns += DecBase.get(i);
  }
  return DBaseAns;
}

/*
Everything below this was previously used to convert between bases and was since replaced for the methods above when I added more bases.
I left them here to show different methods are possible for different base numbers
*/


//public static String Fill0s(String s, Integer split) {
//  String FillAns = "";
//  ArrayList<String> FArray = new ArrayList<String>();

//  for (int i = 0; i < String.valueOf(s).length(); i++) {
//    FArray.add(String.valueOf(String.valueOf(s).charAt(i)));
//  }

//  Collections.reverse(FArray);
//  if (FArray.size() % split != 0) {
//    for (int i = 0; i < FArray.size() % split; i++) {
//      FArray.add("0");
//    }
//  }
//  Collections.reverse(FArray);

//  for (int i = 0; i < FArray.size(); i++) {
//    FillAns += FArray.get(i);
//  }

//  return FillAns;
//}


//public static String DecBinM(Integer s) {
//  // Decimal to Binary
//  // Divide number by two, and get remainder.
//  // Then Divide again by two and get remainder ... continue until quotient = 0
//  // Read the remainders from most recently divided to the first divided.
//  // This is the Binary of that number

//  ArrayList<Integer> DecBin = new ArrayList<Integer>();
//  String DBAns = "";

//  while (s > 0) {
//    DecBin.add(s % 2); // Divide and get remainder
//    s /= 2;
//  }
//  for (int i = DecBin.size() - 1; i >= 0; i--) { // System.out.print outputs in reverse
//    DBAns += String.valueOf(DecBin.get(i));
//  }
//  System.out.println(DBAns);
//  return DBAns;
//}

//public static String DecTerM(Integer s) {
//  ArrayList<Integer> DecTer = new ArrayList<Integer>();
//  String DTAns = "";

//  while (s > 0) {
//    DecTer.add(s % 3); // Divide and get remainder
//    s /= 3;
//  }
//  for (int i = DecTer.size() - 1; i >= 0; i--) { // System.out.print outputs in reverse
//    DTAns += String.valueOf(DecTer.get(i));
//  }
//  return DTAns;
//}

//public static String DecQuaM(Integer s) {
//  ArrayList<Integer> DecQua = new ArrayList<Integer>();
//  String DQAns = "";

//  while (s > 0) {
//    DecQua.add(s % 4); // Divide and get remainder
//    s /= 4;
//  }
//  for (int i = DecQua.size() - 1; i >= 0; i--) { // System.out.print outputs in reverse
//    DQAns += String.valueOf(DecQua.get(i));
//  }
//  return DQAns;
//}


//public static int BinDecM(Integer s) {
//  // Binary to Decimal
//  // For each digit in the binary sequence, from left to right, raise to the power
//  // of {bit -1}
//  // And add each of these together
//  // For example: 100 -> 1^4 + 1^3 + 0^2 + 1^1 = 13
//int BDtotal = 0;
//ArrayList<Integer> BinDec = new ArrayList<Integer>();

//for (int i = 0; i < String.valueOf(s).length(); i++) {
//  BinDec.add(Integer.parseInt(String.valueOf(String.valueOf(s).charAt(i))));
//}

//Collections.reverse(BinDec);

//for (int i = 0; i < BinDec.size(); i++) {
//  BinDec.set(i, (int) (BinDec.get(i) * Math.pow(2, i)));
//  BDtotal += BinDec.get(i);
//}
//return BDtotal;
//}

//public static String DecHexM(Integer s) {
//  // Decimal to Hexadecimal

//  int BHQ = s;
//  ArrayList<Integer> BinHexRemainder = new ArrayList<Integer>();
//  ArrayList<String> BinHexFinal = new ArrayList<String>();

//  while (BHQ > 16) {
//    BinHexRemainder.add(BHQ % 16);
//    BHQ /= 16;
//  }
//  BinHexRemainder.add(BHQ % 16);

//  for (int i = 0; i < BinHexRemainder.size(); i++) {
//    switch (BinHexRemainder.get(i)) {
//    case 10:
//      BinHexFinal.add("A");
//      break;
//    case 11:
//      BinHexFinal.add("B");
//      break;
//    case 12:
//      BinHexFinal.add("C");
//      break;
//    case 13:
//      BinHexFinal.add("D");
//      break;
//    case 14:
//      BinHexFinal.add("E");
//      break;
//    case 15:
//      BinHexFinal.add("F");
//      break;
//    default:
//      BinHexFinal.add(String.valueOf(BinHexRemainder.get(i)));
//      break;
//    }
//  }

//  Collections.reverse(BinHexFinal);

//  String BinHexAns = "";
//  for (int i = 0; i < BinHexFinal.size(); i++) {
//    BinHexAns += BinHexFinal.get(i);
//  }
//  return BinHexAns;
//}

//public static Integer HexDecM(String s) {
//  // Hexadecimal to Decimal
//  ArrayList<String> HDarray = new ArrayList<String>();
//  ArrayList<Integer> HDarrayAns = new ArrayList<Integer>();
//  int HexDecAns = 0;

//  for (int i = 0; i < s.length(); i++) {
//    HDarray.add(String.valueOf(s.charAt(i)));

//    switch (HDarray.get(i)) {
//    case "A":
//      HDarray.set(i, "10");
//      break;
//    case "B":
//      HDarray.set(i, "11");
//      break;
//    case "C":
//      HDarray.set(i, "12");
//      break;
//    case "D":
//      HDarray.set(i, "13");
//      break;
//    case "E":
//      HDarray.set(i, "14");
//      break;
//    case "F":
//      HDarray.set(i, "15");
//      break;
//    default:
//      break;
//    }
//  }

//  Collections.reverse(HDarray);
//  for (int i = 0; i < HDarray.size(); i++) {
//    HDarrayAns.add(Integer.parseInt(HDarray.get(i)));
//  }
//  int j = 1;
//  for (int i = 0; i < HDarrayAns.size(); i++) {
//    HDarrayAns.set(i, HDarrayAns.get(i) * j);
//    j *= 16;
//  }
//  for (int i = 0; i < HDarrayAns.size(); i++) {
//    HexDecAns += HDarrayAns.get(i);
//  }
//  return HexDecAns;
//}

//public static String BinHexM(String s) {
//  ArrayList<Integer> BHarray = new ArrayList<Integer>();
//  String BHFullString = "";
//  String BHSubString = "";
//  String BHAns = "";

//  for (int i = 0; i < String.valueOf(s).length(); i++) {
//    BHarray.add(Integer.parseInt(String.valueOf(String.valueOf(s).charAt(i))));
//  }
//  Collections.reverse(BHarray);
//  if (BHarray.size() % 4 != 0) {
//    for (int i = 0; i < BHarray.size() % 4; i++) {
//      BHarray.add(0);
//    }
//  }
//  Collections.reverse(BHarray);

//  for (int i = 0; i < BHarray.size(); i++) {
//    BHFullString += BHarray.get(i);
//  }
//  for (int i = 0; i < BHarray.size() / 4; i++) {
//    BHSubString = BHFullString.substring(0, 4);
//    BHFullString = BHFullString.substring(4, BHFullString.length());

//    switch (BHSubString) {
//    case "0000":
//      BHAns += "0";
//      break;
//    case "0001":
//      BHAns += "1";
//      break;
//    case "0010":
//      BHAns += "2";
//      break;
//    case "0011":
//      BHAns += "3";
//      break;
//    case "0100":
//      BHAns += "4";
//      break;
//    case "0101":
//      BHAns += "5";
//      break;
//    case "0110":
//      BHAns += "6";
//      break;
//    case "0111":
//      BHAns += "7";
//      break;
//    case "1000":
//      BHAns += "8";
//      break;
//    case "1001":
//      BHAns += "9";
//      break;
//    case "1010":
//      BHAns += "A";
//      break;
//    case "1011":
//      BHAns += "B";
//      break;
//    case "1100":
//      BHAns += "C";
//      break;
//    case "1101":
//      BHAns += "D";
//      break;
//    case "1110":
//      BHAns += "E";
//      break;
//    case "1111":
//      BHAns += "F";
//      break;
//    default:
//      break;
//    }
//  }
//  return BHAns;
//}

//public static String HexBinM(String s) {

//  String HexBinAns = "";

//  for (int i = 0; i < s.length(); i++) {
//    switch (s.charAt(i)) {
//    case '0':
//      HexBinAns += "0000";
//      break;
//    case '1':
//      HexBinAns += "0001";
//      break;
//    case '2':
//      HexBinAns += "0010";
//      break;
//    case '3':
//      HexBinAns += "0011";
//      break;
//    case '4':
//      HexBinAns += "0100";
//      break;
//    case '5':
//      HexBinAns += "0101";
//      break;
//    case '6':
//      HexBinAns += "0110";
//      break;
//    case '7':
//      HexBinAns += "0111";
//      break;
//    case '8':
//      HexBinAns += "1000";
//      break;
//    case '9':
//      HexBinAns += "1001";
//      break;
//    case 'A':
//      HexBinAns += "1010";
//      break;
//    case 'B':
//      HexBinAns += "1011";
//      break;
//    case 'C':
//      HexBinAns += "1100";
//      break;
//    case 'D':
//      HexBinAns += "1101";
//      break;
//    case 'E':
//      HexBinAns += "1110";
//      break;
//    case 'F':
//      HexBinAns += "1111";
//      break;
//    default:
//      break;
//    }
//  }
//  return HexBinAns;
//}

///*
//*public static int OctDecM(int s) {
// *  int decResult = 0;
// *  int size = String.valueOf(s).length();
// *  String t = "" + s;
// *  for (int i = 0; i < size -1; i++) {
// *    decResult += Integer.parseInt(String.valueOf(String.valueOf(s).charAt(0)));
// *    t = "" + s;
// *    s = Integer.parseInt(t.substring(1));
// *    decResult *= 8;
// *  }
// *  decResult += s;
// *
// *  return decResult;
// *}
// */

//public static int OctBinM(int s) {
//  String OctBinAns = "";
//  for (int i = 0; i < String.valueOf(s).length(); i++) {
//    switch (String.valueOf(s).charAt(i)) {
//    case '0':
//      OctBinAns += 000;
//      break;
//    case '1':
//      OctBinAns += 001;
//      break;
//    case '2':
//      OctBinAns += 010;
//      break;
//    case '3':
//      OctBinAns += 011;
//      break;
//    case '4':
//      OctBinAns += 100;
//      break;
//    case '5':
//      OctBinAns += 101;
//      break;
//    case '6':
//      OctBinAns += 110;
//      break;
//    case '7':
//      OctBinAns += 111;
//      break;
//    default:
//      break;
//    }
//  }
//  return Integer.parseInt(OctBinAns);
//}

//public static String BinOctM(Integer s) {
//  String BinOctAns = "";
//  String BinOctFin = "";
//  ArrayList<Integer> BOArray = new ArrayList<Integer>();
//  ArrayList<String> BOArray1 = new ArrayList<String>();

//  for (int i = 0; i < String.valueOf(s).length(); i++) {
//    BOArray.add(Integer.parseInt(String.valueOf(String.valueOf(s).charAt(i))));
//  }

//  Collections.reverse(BOArray);
//  if (BOArray.size() % 3 != 0) {
//    for (int i = 0; i < BOArray.size() % 3; i++) {
//      BOArray.add(0);
//    }
//  }
//  Collections.reverse(BOArray);

//  for (int i = 0; i < BOArray.size(); i++) {
//    BinOctFin += BOArray.get(i);
//  }

//  int BOplaceHolder = BinOctFin.length();
//  for (int i = 0; i < BOplaceHolder/3; i++) {
//    BOArray1.add(BinOctFin.substring(0, 3));
//    BinOctFin = BinOctFin.substring(3);
//  }

//  for (int i = 0; i < BOArray1.size(); i++) {
//    switch(BOArray1.get(i)) {
//    case "000":
//      BinOctAns += '0';
//      break;
//    case "001":
//      BinOctAns += '1';
//      break;
//    case "010":
//      BinOctAns += '2';
//      break;
//    case "011":
//      BinOctAns += '3';
//      break;
//    case "100":
//      BinOctAns += '4';
//      break;
//    case "101":
//      BinOctAns += '5';
//      break;
//    case "110":
//      BinOctAns += '6';
//      break;
//    case "111":
//      BinOctAns += '7';
//      break;
//    default:
//      break;
//    }
//  }
//  return BinOctAns;
//}

//public static String DecBCDM(Integer s) {
// String DecBCDAns = "";
// for (int i = 0; i < String.valueOf(s).length(); i++) {
// DecBCDAns += Fill0s(DecBinM(Integer.parseInt(String.valueOf(String.valueOf(s).charAt(i)))), 4) + " ";
// }
// return DecBCDAns;
// }
 
// public static String BinBCDM(String s) {
// //Oh the dreaded Double Dabble Algorithm... This is horrible... Why did I choose to do this?!
// //Only 8 bit numbers, as it is much less stressful to do rather than 16 bit, although they could be dont
// String BinBCDAns = "";
 
// ArrayList<String> Units = new ArrayList<String>();
// ArrayList<String> Tens = new ArrayList<String>();
// ArrayList<String> Hundreds = new ArrayList<String>();
 
// String UnitsS = "";
// String TensS = "";
// String HundredsS = "";
 
// for (int i = 0; i < 4; i++) {
// Units.add("0");
// Tens.add("0");
// Hundreds.add("0");
// }
 
 
// for (int i = 0; i < 8; i++) {
 
// UnitsS = String.join("", Units);
// TensS = String.join("", Tens);
// HundredsS = String.join("", Hundreds);
 
// switch(UnitsS) {
// case "0101":
// UnitsS = "1000";
// break;
// case "0110":
// UnitsS = "1001";
// break;
// case "0111":
// UnitsS = "1010";
// break;
// case "1000":
// UnitsS = "1011";
// break;
// case "1001":
// UnitsS = "1100";
// break;
// default:
// break;
// }
// switch(TensS) {
// case "0101":
// TensS = "1000";
// break;
// case "0110":
// TensS = "1001";
// break;
// case "0111":
// TensS = "1010";
// break;
// case "1000":
// TensS = "1011";
// break;
// case "1001":
// TensS = "1100";
// break;
// default:
// break;
// }
// switch(HundredsS) {
// case "0101":
// HundredsS = "1000";
// break;
// case "0110":
// HundredsS = "1001";
// break;
// case "0111":
// HundredsS = "1010";
// break;
// case "1000":
// HundredsS = "1011";
// break;
// case "1001":
// HundredsS = "1100";
// break;
// default:
// break;
// }
 
// Hundreds.add(Tens.get(0));
// Tens.remove(0);
// Tens.add(Units.get(0));
// Units.remove(0);
// Units.add(String.valueOf(s.charAt(0)));
// s = s.substring(1);
// } 
// return BinBCDAns;
// }