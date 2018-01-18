/*
 Using Jasypt library by Daniel Fernández for Encryption/Decryption <http://www.jasypt.org/>
 Using G4P and the G4P GUI Builder too to construct the GUI interface
 */



import g4p_controls.*;
import javax.swing.JOptionPane;
import java.awt.Font;
import java.util.ArrayList;
import java.util.Collections;
import java.util.Arrays;
import org.jasypt.util.text.*;

int Intype;            //Base of number to convert
int Outtype;           //Base of outputted number
String Inputted = "";  //Inputted number

Font font = new Font("Serif", Font.PLAIN, 16);
Font OFont = new Font("Serif", Font.PLAIN, 32);

public void setup() {
  size(500, 800, JAVA2D);
  createGUI();
  customGUI();

  EncryptSetup();
}

public void draw() {

  EncryptDraw();

  background(230);
  Inputted = UserInput.getText();

  if (InBin.isSelected()) Intype = 2;    //set intype and outtype depending on selected base number
  if (InTer.isSelected()) Intype = 3;
  if (InQua.isSelected()) Intype = 4;
  if (InQui.isSelected()) Intype = 5;
  if (InSen.isSelected()) Intype = 6;
  if (InSep.isSelected()) Intype = 7;
  if (InOct.isSelected()) Intype = 8;
  if (InNon.isSelected()) Intype = 9;
  if (InDec.isSelected()) Intype = 10;
  if (InUnd.isSelected()) Intype = 11;
  if (InDuo.isSelected()) Intype = 12;
  if (InTri.isSelected()) Intype = 13;
  if (InTet.isSelected()) Intype = 14;
  if (InPen.isSelected()) Intype = 15;
  if (InHex.isSelected()) Intype = 16;
  if (InSepD.isSelected()) Intype = 17;
  if (InOctD.isSelected()) Intype = 18;
  if (InNonD.isSelected()) Intype = 19;
  if (InVig.isSelected()) Intype = 20;

  if (OutBin.isSelected()) Outtype = 2;
  if (OutTer.isSelected()) Outtype = 3;
  if (OutQua.isSelected()) Outtype = 4;
  if (OutQui.isSelected()) Outtype = 5;
  if (OutSen.isSelected()) Outtype = 6;
  if (OutSep.isSelected()) Outtype = 7;
  if (OutOct.isSelected()) Outtype = 8;
  if (OutNon.isSelected()) Outtype = 9;
  if (OutDec.isSelected()) Outtype = 10;
  if (OutUnd.isSelected()) Outtype = 11;
  if (OutDuo.isSelected()) Outtype = 12;
  if (OutTri.isSelected()) Outtype = 13;
  if (OutTet.isSelected()) Outtype = 14;
  if (OutPen.isSelected()) Outtype = 15;
  if (OutHex.isSelected()) Outtype = 16;
  if (OutSepD.isSelected()) Outtype = 17;
  if (OutOctD.isSelected()) Outtype = 18;
  if (OutNonD.isSelected()) Outtype = 19;
  if (OutVig.isSelected()) Outtype = 20;
}

// Use this method to add additional statements
// to customise the GUI controls
public void customGUI() {
  label1.setFont(font); //set font of all radio buttons/labels
  label2.setFont(font);
  Output.setFont(OFont);
  InBin.setFont(font);
  InTer.setFont(font);
  InQua.setFont(font);
  InQui.setFont(font);
  InSen.setFont(font);
  InSep.setFont(font);
  InOct.setFont(font);
  InNon.setFont(font);
  InDec.setFont(font);
  InUnd.setFont(font);
  InDuo.setFont(font);
  InTri.setFont(font);
  InTet.setFont(font);
  InPen.setFont(font);
  InHex.setFont(font);
  InSepD.setFont(font);
  InOctD.setFont(font);
  InNonD.setFont(font);
  InVig.setFont(font);
  OutBin.setFont(font);
  OutQua.setFont(font);
  OutTer.setFont(font);
  OutQua.setFont(font);
  OutQui.setFont(font);
  OutSen.setFont(font);
  OutSep.setFont(font);
  OutOct.setFont(font);
  OutNon.setFont(font);
  OutDec.setFont(font);
  OutUnd.setFont(font);
  OutDuo.setFont(font);
  OutTri.setFont(font);
  OutTet.setFont(font);
  OutPen.setFont(font);
  OutHex.setFont(font);
  OutSepD.setFont(font);
  OutOctD.setFont(font);
  OutNonD.setFont(font);
  OutVig.setFont(font);
}

public void TestType(String s, Integer u) {    //make sure inputted numbers are in correct form with regard to their base number

  if (s.isEmpty()) {
    JOptionPane.showMessageDialog(frame, "Input is Empty", "Error", JOptionPane.ERROR_MESSAGE);
  }

  try {
    Integer.parseInt(s, u);
    //JOptionPane.showMessageDialog(frame, "Correct", "Error", JOptionPane.ERROR_MESSAGE);
  }
  catch (NumberFormatException e) {
    JOptionPane.showMessageDialog(frame, "This number system is not in the correct form\nOr\nInput too long", "Error", JOptionPane.ERROR_MESSAGE);
    return;
  }
  Calculate();
}

public void Calculate() {  //trigger conversion
  if (Intype != 1 && Intype <= 20) {
    Output.setText(BaseBaseM(Inputted, Outtype, Intype));
  }
}