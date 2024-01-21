unit GoTrue.SignWithPasswordCredentials;

interface

uses
  Gotrue.Interfaces, System.JSON;

type

TSignWithPasswordCredentials = class(TInterfacedObject, iSignWithPasswordCredentials)
private
  Femail : String;
  Fphone : String;
  Fpassword : String;
//  Foptions : iSignOptions;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iSignWithPasswordCredentials;

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

implementation

uses
  System.SysUtils;

{ TSignWithPasswordCredentials }

constructor TSignWithPasswordCredentials.Create;
begin
  Femail := '';
  Fphone := '';
  Fpassword := '';
end;

destructor TSignWithPasswordCredentials.Destroy;
begin

  inherited;
end;

class function TSignWithPasswordCredentials.New: iSignWithPasswordCredentials;
begin
  Result := TSignWithPasswordCredentials.Create;
end;

function TSignWithPasswordCredentials.email(aValue: String): iSignWithPasswordCredentials;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('email foi preenchido vazio');
  Femail := aValue;
end;

function TSignWithPasswordCredentials.email: String;
begin
  Result := Femail;
end;

function TSignWithPasswordCredentials.password(aValue: String): iSignWithPasswordCredentials;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('password foi preenchido vazio');
  Fpassword := aValue;
end;

function TSignWithPasswordCredentials.password: String;
begin
  Result := Fpassword;
end;

function TSignWithPasswordCredentials.phone(aValue: String): iSignWithPasswordCredentials;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('phone foi preenchido vazio');
  Fphone := aValue;
end;

function TSignWithPasswordCredentials.phone: String;
begin
  Result := Fphone;
end;

function TSignWithPasswordCredentials.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  if (Femail = EmptyStr) and (Fphone = EmptyStr) then raise Exception.Create('Telefone ou Email não informado');
  if Fpassword = EmptyStr then raise Exception.Create('Senha não informada');

  Result.AddPair('password', Fpassword);
  if not(Femail = EmptyStr) then
    Result.AddPair('email', Femail);
  if not(Fphone = EmptyStr) then
    Result.AddPair('phone', Fphone);
end;

end.
