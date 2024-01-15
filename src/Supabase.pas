unit Supabase;

interface

uses
  Supabase.Interfaces;

type

TSupabase = class(TInterfacedObject, iSupabase)
private
  FConfig : iSupabaseConfig;
public
  constructor Create(aConfig : iSupabaseConfig); reintroduce;
  destructor Destroy; override;
  class function New(aConfig : iSupabaseConfig) : iSupabase;

  function From(aTable : String) : iSupabaseTable;
  function Config : iSupabaseConfig;
end;

implementation

uses
  Supabase.Table;

{ TSupabase }

constructor TSupabase.Create(aConfig : iSupabaseConfig);
begin
   FConfig := aConfig;
end;

destructor TSupabase.Destroy;
begin

  inherited;
end;

class function TSupabase.New(aConfig : iSupabaseConfig): iSupabase;
begin
  Result := TSupabase.Create(aConfig);
end;

function TSupabase.From(aTable: String): iSupabaseTable;
begin
  Result := TSupabaseTable.New(Self, aTable);
end;

function TSupabase.Config: iSupabaseConfig;
begin
  Result := FConfig;
end;

end.
