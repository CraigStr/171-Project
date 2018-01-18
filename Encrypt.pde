boolean Encrypt; //<>//
String Input;
String Key;
String Encrypted;
String Decrypted;

Table  table;
TableRow newRow;

void EncryptSetup() {
  table = loadTable("data/names1.csv", "header"); //load the .csv file
}


void EncryptDraw() {

  Input = EncInput.getText(); //extract input and key from GUI
  Key = EncKey.getText();
}

void EncryptText() {
  if (Key.equals("")) {
    JOptionPane.showMessageDialog(frame, "Key is Empty", "Error", JOptionPane.ERROR_MESSAGE);    //find null input/key
    return;
  }
  if (Input.equals("")) {
    JOptionPane.showMessageDialog(frame, "Input is Empty", "Error", JOptionPane.ERROR_MESSAGE);
    return;
  }
  BasicTextEncryptor textEncryptor = new BasicTextEncryptor(); //create encryptor object
  textEncryptor.setPassword(Key);                              //setting key to encrypt
  if (EncryptBtn.isSelected()) {
    Encrypted = textEncryptor.encrypt(Input);                  //encrypt input
    EncOutput.setText(Encrypted);                              //output ecrypted string to GUI
  } else {
    Decrypted = textEncryptor.decrypt(Input);                  //Decrypt input
    EncOutput.setText(Decrypted);                              //output to GUI
  }
}

void ReadCSV() {
  ChangeConfirm.setText("");
  String UName = UserName.getText();      //extract name and password from GUI
  String PWord = Password.getText();

  try {
    for (TableRow row : table.rows()) {
      if (row.getString("U").equals(UName)) {                              //check inputted name = name in .csv
        println("Username Accepted");
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();       //create encryptor object
        textEncryptor.setPassword(PWord);                                  //set password
        if (PWord.equals(textEncryptor.decrypt(row.getString("P")))) {     //check inputted password = decrypted password in .csv
          println("Password Accepted");
          ReadCSVText.setText(textEncryptor.decrypt(row.getString("D")));  //output decrypted data for that user
        }
        return;
      }
    }
    JOptionPane.showMessageDialog(frame, "Incorrect Username", "Error", JOptionPane.ERROR_MESSAGE);  //error if username not found
  }
  catch(EncryptionOperationNotPossibleException e) {
    JOptionPane.showMessageDialog(frame, "Incorrect Password\nor\nCorrupt Encryption, please fix manually", "Error", JOptionPane.ERROR_MESSAGE);  //error if password wrong
  }
  catch(NullPointerException e) {
    JOptionPane.showMessageDialog(frame, "Incorrect Password", "Error", JOptionPane.ERROR_MESSAGE);  //error if password wrong
  }
}
///////////////////////////////////////////////
void SetCSV() {
  ChangeConfirm.setText("");
  String UName = UserName.getText();
  String PWord = Password.getText();
  String SetData = SetCSVText.getText();

  try {
    for (TableRow row : table.rows()) {
      if (row.getString("U").equals(UName)) {                          //check username - password like in above method
        println("Username Accepted");
        BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
        textEncryptor.setPassword(PWord);
        if (PWord.equals(textEncryptor.decrypt(row.getString("P")))) {
          println("Password Accepted");
          row.setString("D", textEncryptor.encrypt(SetData));                                        //set user data to inputted data and encrypt it
          saveTable(table, "data/names1.csv");                                                            //save .csv
          ChangeConfirm.setText("Data changed to: \"" + SetData + "\" for user: \"" + UName + "\""); //print confirmation
        }
        return;
      }
    }
    JOptionPane.showMessageDialog(frame, "Incorrect Username", "Error", JOptionPane.ERROR_MESSAGE);
  }
  catch(EncryptionOperationNotPossibleException e) {
    JOptionPane.showMessageDialog(frame, "Incorrect Password", "Error", JOptionPane.ERROR_MESSAGE);
  }
}
////////////////////////////////////////////////////
void newAccount() {
  String NewUN = NewAccUN.getText();
  String NewPW = NewAccPassword.getText();
  String NewData = NewAccData.getText();
  newRow = table.addRow();

  if (NewPW.trim().equals("") || NewUN.trim().equals("")) { //prevent empth account being made
    JOptionPane.showMessageDialog(frame, "New username/password is empty", "Error", JOptionPane.ERROR_MESSAGE);
    return;
  }
  try {
    BasicTextEncryptor textEncryptor = new BasicTextEncryptor();
    textEncryptor.setPassword(NewPW);  //set accoutn password
    ChangeConfirm.setText("");
    newRow.setString("U", NewUN);                           //add new row to .csv based on user input                         
    newRow.setString("P", textEncryptor.encrypt(NewPW));    //
    newRow.setString("D", textEncryptor.encrypt(NewData));  //
    saveTable(table, "data/names1.csv");                    //save .csv
    ChangeConfirm.setText("Account \"" + NewUN + "\" Added");
  }
  catch(EncryptionOperationNotPossibleException e) {        // if encryption of user password/data fails, accoutn info is deleted to user to input again
    JOptionPane.showMessageDialog(frame, "Error", "Error", JOptionPane.ERROR_MESSAGE);
    for (TableRow row : table.rows()) {
      if (row.getString("U").equals(NewUN)) {
        row.setString("U", "");
        row.setString("P", "");
        row.setString("D", "");
      }
    }
    saveTable(table, "data/names1.csv");
    ChangeConfirm.setText("Encryption operation not possible: Encryption Failed. Please create account again.");
  }
  catch(NullPointerException e) {        // if encryption of user password/data fails, accoutn info is deleted to user to input again
    JOptionPane.showMessageDialog(frame, "Error", "Error", JOptionPane.ERROR_MESSAGE);
    for (TableRow row : table.rows()) {
      if (row.getString("U").equals(NewUN)) {
        row.setString("U", "");
        row.setString("P", "");
        row.setString("D", "");
      }
    }
    saveTable(table, "data/names1.csv");
    ChangeConfirm.setText("Null pointer: Encryption Failed. Please create account again.");
  }
}