///*************************************Driver SignUp Validations******************************************************
bool validateDriverEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-z\-0-9]+\.)+[a-z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}
String validateDriverAddress(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter your Address';
  }

}
String validateDriverName(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter your name';
  }

  Pattern pattern =
      r'^[a-z A-Z]+$';
  RegExp regex = new RegExp(pattern);

  if(!regex.hasMatch(value) == false){}

  else{
    return 'Please enter a valid Name';
  }
  // return (!regex.hasMatch(value)) ? false : true;
}

List<int> index = [0,1,2,4,5,6,7,8,9];

// String string = "0";
// final oldChar = '0';
// final newChar = '3';
String validateDriverMobile(String value) {

  if (value.length <= 0)
  {
    return 'Please Enter your phone number';
  }
  // else if(value.startsWith(oldChar))
  // {
  //   value.replaceFirst(oldChar, newChar);
  //   value = newChar.toString();
  //   return 'Must be valid';
  //
  //   // return 'Must be Valid';
  // }
  else if(value.length <= 10)
  {
    return 'Must be minimum of 11 digit';
  }
  else if(value.length > 11)
  {
    return 'Must be maximum of 11 digits';
  }
  return null;
}

String validateDriverCNIC(String value) {

  if (value.length <= 0)
  {
    return 'Please Enter your CNIC Number';
  }
  // else if(value.startsWith(oldChar))
  // {
  //   value.replaceFirst(oldChar, newChar);
  //   value = newChar.toString();
  //   return 'Must be valid';
  //
  //   // return 'Must be Valid';
  // }
  else if(value.length <= 12)
  {
    return 'Must be minimum of 13 digit';
  }
  else if(value.length > 13)
  {
    return 'Must be maximum of 13 digits';
  }
  return null;
}

///*******************************************Doctor SignUp Validations********************************************************
String validateDoctorName(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter Your Name';
  }

  Pattern pattern =
      r'^[a-z A-Z]+$';
  RegExp regex = new RegExp(pattern);

  if(!regex.hasMatch(value) == false){}

  else{
    return 'Please enter a valid Name';
  }
  // return (!regex.hasMatch(value)) ? false : true;
}
String validateHospital(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter Your Hospital Name';
  }

  Pattern pattern =
      r'^[a-z A-Z]+$';
  RegExp regex = new RegExp(pattern);

  if(!regex.hasMatch(value) == false){}

  else{
    return 'Please enter a Valid Hospital Name';
  }
  // return (!regex.hasMatch(value)) ? false : true;
}
String validateQualification(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter Your Qualification';
  }

  Pattern pattern =
      r'^[a-z A-Z]+$';
  RegExp regex = new RegExp(pattern);

  if(!regex.hasMatch(value) == false){}

  else{
    return 'Please enter a Valid Qualification';
  }
  // return (!regex.hasMatch(value)) ? false : true;
}
String validateSpeciality(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter Your Speciality';
  }

  Pattern pattern =
      r'^[a-z A-Z]+$';
  RegExp regex = new RegExp(pattern);

  if(!regex.hasMatch(value) == false){}

  else{
    return 'Please enter a Valid Speciality';
  }
  // return (!regex.hasMatch(value)) ? false : true;
}
String validateExperience(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter Your Experience';
  }

  Pattern pattern =
      r'^[a-z A-Z 1-9]+$';
  RegExp regex = new RegExp(pattern);

  if(!regex.hasMatch(value) == false){}

  else{
    return 'Please enter a Valid Experience';
  }
  // return (!regex.hasMatch(value)) ? false : true;
}
bool validateDoctorEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-z\-0-9]+\.)+[a-z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}
String validateDoctorAddress(String value) {

  if(value.length <= 0)
  {
    return 'Please Enter Your Address';
  }

}

List<int> index1 = [0,1,2,4,5,6,7,8,9];

String validateDoctorMobile(String value) {

  if (value.length <= 0)
  {
    return 'Please Enter Your Phone Number';
  }
  // else if(value.startsWith(oldChar))
  // {
  //   value.replaceFirst(oldChar, newChar);
  //   value = newChar.toString();
  //   return 'Must be valid';
  //
  //   // return 'Must be Valid';
  // }
  else if(value.length <= 10)
  {
    return 'Must be minimum of 11 digit';
  }
  else if(value.length > 11)
  {
    return 'Must be maximum of 11 digits';
  }
  return null;
}

String validateDoctorCNIC(String value) {

  if (value.length <= 0)
  {
    return 'Please Enter your CNIC Number';
  }
  // else if(value.startsWith(oldChar))
  // {
  //   value.replaceFirst(oldChar, newChar);
  //   value = newChar.toString();
  //   return 'Must be valid';
  //
  //   // return 'Must be Valid';
  // }
  else if(value.length <= 12)
  {
    return 'Must be minimum of 13 digit';
  }
  else if(value.length > 13)
  {
    return 'Must be maximum of 13 digits';
  }
  return null;
}

///*******************************************Login Validations********************************************************
bool validateLoginEmail(String value) {
  Pattern pattern =
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-z\-0-9]+\.)+[a-z]{2,}))$';
  RegExp regex = new RegExp(pattern);
  return (!regex.hasMatch(value)) ? false : true;
}


