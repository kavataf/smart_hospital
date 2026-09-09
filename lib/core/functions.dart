//email validation

String? validateEmail(String? value){
  if(value == null || value.trim().isEmpty){
    return "Please enter your email";
  }
  final emailRegex = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$',);
  if(!emailRegex.hasMatch(value.trim())){
    return "Please enter a valid email address";
  }
  return null;
}

//password validation

String? validatePassword(String? value){
  if(value == null || value.trim().isEmpty){
    return "Please enter your password";
  }
  if(value.length < 8){
    return "Password must be at least 8 characters";
  }
  return null;
}

//name validation

String? validateName(String? value){
  if(value == null || value.trim().isEmpty){
    return "Please enter your name";
  }
  final nameRegex = RegExp(r'^[a-zA-Z\s]+$');
  if(!nameRegex.hasMatch(value.trim())){
    return "Please enter valid characters(letters only)";
  }
  return null;
}