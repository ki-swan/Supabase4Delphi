unit Supabase.Interfaces;

interface

uses
  System.JSON, System.Generics.Collections;

type

iSupabaseTable = interface;

iSupabaseConfig = interface
['{EE783659-C74E-4926-B062-1E99609BCB99}']
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

iSupabaseFilterItem = interface
['{0A471853-E85B-4A8C-97EB-893D2B611DFC}']
  function Key(aValue : String) : iSupabaseFilterItem; overload;
  function Key : String; overload;
  function Value(aValue : String) : iSupabaseFilterItem; overload;
  function Value : String; overload;
end;

iSupabaseFilter = interface // Filters
['{4B99A6FD-1EC7-4473-B71B-9F4AA8E6524E}']
  function Count : Integer;
  function isEmpty : Boolean;
  function itens : TList<iSupabaseFilterItem>;
  function Clear : iSupabaseTable;

  function eq(aColumn : String; aValue : Variant) : iSupabaseTable;
  function gt(aColumn : String; aValue : Variant) : iSupabaseTable;
  function lt(aColumn : String; aValue : Variant) : iSupabaseTable;
  function gte(aColumn : String; aValue : Variant) : iSupabaseTable;

  function lte(aColumn : String; aValue : Variant) : iSupabaseTable;
  function like(aColumn : String; aValue : Variant) : iSupabaseTable;
  function ilike(aColumn : String; aValue : Variant) : iSupabaseTable;
  function isNull(aColumn : String) : iSupabaseTable;
//  function inList(aColumn : String; aValue : TList<Variant>) : iSupabaseTable;
  function neq(aColumn : String; aValue : Variant) : iSupabaseTable;

//  function cs(aArrayColumn : String; aValue : TList<Variant>) : iSupabaseTable;
//  function cd(aArrayColumn : String; aValue : TList<Variant>) : iSupabaseTable;
end;

iSupabaseTable = interface
['{239B1CF5-2729-4EDB-B5D5-A19747F97DEB}']
  function AddFilter : iSupabaseFilter;

  function Select(aColumns : String) : TJSONArray;
  function Insert(aItem : TJSONObject) : iSupabaseTable; overload;
  function Insert(aItems : TJSONArray) : iSupabaseTable; overload;
  function Update(aItem : TJSONObject) : iSupabaseTable;
  function Delete : iSupabaseTable;
end;
iSupabaseAuth = interface
['{997698FB-2E38-4557-BA69-6E08CDD682DE}']

end;

iSupabase = interface
['{92BE383F-5910-4D63-9B1A-3B6269EA1224}']
  function From(aTable : String) : iSupabaseTable;
//  function Auth : iSupabaseAuth;

  function Config : iSupabaseConfig;
end;

iSupabaseFactory = interface
['{3EDB7D77-3CC7-4781-99C5-352AFF287D45}']
  function config : iSupabaseConfig;
  function supabase(aConfig : iSupabaseConfig) : iSupabase;
  function table(aParent : iSupabase; aTabela : String) : iSupabaseTable;
  function filter(aParent: iSupabaseTable) : iSupabaseFilter;
end;

implementation

end.