unit Gotrue.Interfaces;

interface

uses
  System.JSON;

type

iSignOptions = interface
['{4558D956-192E-4334-B495-531DD10BD8EF}']

end;

iSignWithPasswordCredentials = interface
['{2B4781E9-EA8A-499C-A5C6-CC9A696DC353}']
  function email(aValue : String) : iSignWithPasswordCredentials; overload;
  function email : String; overload;
  function phone(aValue : String) : iSignWithPasswordCredentials; overload;
  function phone : String; overload;
  function password(aValue : String) : iSignWithPasswordCredentials; overload;
  function password : String; overload;
//  function options : iSignOptions; { TODO -oYuki -cAuth :  }

  function ToJSON : TJSONObject;
//  function FromJSON(aValue : TJSONObject) : iSignWithPasswordCredentials;
end;

iSupabaseAuthUser = interface; { TODO -oYuki -cAuth :  }

iSupabaseAuthToken = interface; { TODO -oYuki -cAuth :  }

iSupabaseAuth = interface
['{B9CCAED2-453E-448D-8759-5075EDED7C14}']
  function SignInWithPasswordCredentials(credentials : iSignWithPasswordCredentials) : TJSONObject;
  function SignUp(credentials: iSignWithPasswordCredentials) : TJSONObject; overload;
end;

implementation

end.
