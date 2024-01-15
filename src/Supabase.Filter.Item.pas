unit Supabase.Filter.Item;

interface

uses
  Supabase.Interfaces;

type
TSupabaseFilterItem = class(TInterfacedObject, iSupabaseFilterItem)
private
  FKey : String;
  FValue : String;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iSupabaseFilterItem;

  function Key(aValue : String) : iSupabaseFilterItem; overload;
  function Key : String; overload;
  function Value(aValue : String) : iSupabaseFilterItem; overload;
  function Value : String; overload;
end;

implementation

uses
  System.SysUtils;

{ TSupabaseFilterItem }

constructor TSupabaseFilterItem.Create;
begin

end;

destructor TSupabaseFilterItem.Destroy;
begin

  inherited;
end;

class function TSupabaseFilterItem.New: iSupabaseFilterItem;
begin
  Result := TSupabaseFilterItem.Create;
end;

function TSupabaseFilterItem.Key(aValue: String): iSupabaseFilterItem;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Key valor preenchido vazio');
  FKey := aValue;
end;

function TSupabaseFilterItem.Key: String;
begin
  Result := FKey;
end;

function TSupabaseFilterItem.Value(aValue: String): iSupabaseFilterItem;
begin
  Result := Self;
  if aValue = EmptyStr then raise Exception.Create('Value valor preenchido vazio');
  FValue := aValue;
end;

function TSupabaseFilterItem.Value: String;
begin
  Result := FValue;
end;

end.
