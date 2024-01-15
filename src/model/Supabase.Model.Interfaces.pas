unit Supabase.Model.Interfaces;

interface

uses
  System.Generics.Collections, System.JSON;

type

iSupabaseQuery = interface
['{1ACFE822-9AB2-4795-B041-0EBF439B6A62}']
  function SQL(aValue : String) : iSupabaseQuery; overload;
  function SQL : String; overload;
  function Param(aValue : String) : iSupabaseQuery; overload;
  function Open(aValue : String) : iSupabaseQuery; overload;
  function Open : iSupabaseQuery; overload;
  function ExecSQL(aValue : String) : iSupabaseQuery; overload;
  function ExecSQL : iSupabaseQuery; overload;
end;

iSupabaseModel = interface
['{2BC761FD-9BD6-4536-AF60-8E3D85DF201C}']
  function Select(aColumns : String) : TJSONArray; overload;
  function Insert(aItems : TList<TJSONObject>) : iSupabaseModel;
  function Update(aItems : TList<TJSONObject>) : iSupabaseModel;
  function Delete : iSupabaseModel;
end;

implementation

end.
