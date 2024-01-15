unit Supabase.Config;

interface

uses
  Supabase.Interfaces, System.JSON;

type

TSupabaseConfig = class(TInterfacedObject, iSupabaseConfig)
private
  Furl : String;
  Fapikey : String;
  Fauth : String;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iSupabaseConfig;

  function url(aValue : String) : iSupabaseConfig; overload;
  function url : String; overload;
  function apikey(aValue : String) : iSupabaseConfig; overload;
  function apikey : String; overload;
  function auth(aValue : String) : iSupabaseConfig; overload;
  function auth : String; overload;

  function SaveFile(aFileName : String) : iSupabaseConfig;
  function LoadFile(aFileName : String) : iSupabaseConfig;
  function FromJSON(aValue : TJSONObject) : iSupabaseConfig;
  function ToJSON : TJSONObject;
end;

var
  FConfig : iSupabaseConfig;

implementation

uses
  System.SysUtils,
  System.Classes;

{ TSupabaseConfig }

constructor TSupabaseConfig.Create;
begin
  Furl := '';
  Fapikey := '';
  Fauth := '';

end;

destructor TSupabaseConfig.Destroy;
begin

  inherited;
end;

class function TSupabaseConfig.New: iSupabaseConfig;
begin
  Result := TSupabaseConfig.Create;
end;

function TSupabaseConfig.apikey(aValue: String): iSupabaseConfig;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('apikey não foi preenchido');
  Fapikey := aValue;
end;

function TSupabaseConfig.apikey: String;
begin
  Result := Fapikey;
end;

function TSupabaseConfig.auth(aValue: String): iSupabaseConfig;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('auth não foi preenchido');
  Fauth := 'Bearer '+aValue;
end;

function TSupabaseConfig.auth: String;
begin
  Result := Fauth;
end;

function TSupabaseConfig.url(aValue: String): iSupabaseConfig;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('url não foi preenchido');
  Furl := aValue;
end;

function TSupabaseConfig.url: String;
begin
  Result := Furl;
end;

function TSupabaseConfig.LoadFile(aFileName: String): iSupabaseConfig;
var
  lFile : TStringList;
  lJSON : TJSONObject;
begin
  Result := Self;
  lFile := TStringList.Create;
  try
    lFile.LoadFromFile(GetCurrentDir()+'/'+aFileName+'.json');
    lJSON := TJSONObject.ParseJSONValue(lFile.Text) as TJSONObject;
    FromJSON(lJSON);
  finally
    if Assigned(lJSON) then
      FreeAndNil(lJSON);
    if Assigned(lFile) then
      FreeAndNil(lFile);
  end;
end;

function TSupabaseConfig.SaveFile(aFileName: String): iSupabaseConfig;
var
  lFile : TStringList;
  lJSON : TJSONObject;
begin
  Result := Self;
  lFile := TStringList.Create;
  lJSON := ToJSON;
  try
    lFile.Text := lJSON.ToString;
    lFile.SaveToFile(GetCurrentDir()+'/'+aFileName+'.json');
  finally
    FreeAndNil(lFile);
    FreeAndNil(lJSON);
  end;
end;

function TSupabaseConfig.FromJSON(aValue: TJSONObject): iSupabaseConfig;
begin
  Result := Self;
  aValue.TryGetValue<String>('url', Furl);
  aValue.TryGetValue<String>('apikey', Fapikey);
  aValue.TryGetValue<String>('auth', Fauth);
end;

function TSupabaseConfig.ToJSON: TJSONObject;
begin
  Result := TJSONObject.Create;
  Result.AddPair('url', Furl)
        .AddPair('apikey',Fapikey)
        .AddPair('auth', Fauth);
end;

end.
