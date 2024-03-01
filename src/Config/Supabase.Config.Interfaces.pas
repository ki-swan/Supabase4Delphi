unit Supabase.Config.Interfaces;

interface

uses
  System.JSON;

type

iSupabaseConfig = interface
['{39E1AF43-0EDD-41F5-A088-821B2964E3A1}']
  function url(aValue : String) : iSupabaseConfig; overload;
  function url : String; overload;
  function apikey(aValue : String) : iSupabaseConfig; overload;
  function apikey : String; overload;

  function SaveFile(aFileName : String) : iSupabaseConfig;
  function LoadFile(aFileName : String) : iSupabaseConfig;
  function FromJSON(aValue : TJSONObject) : iSupabaseConfig;
  function ToJSON : TJSONObject;
end;

implementation

end.
