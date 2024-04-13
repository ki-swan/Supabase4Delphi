unit Supabase;

interface

uses
  Supabase.Interfaces;

type

TSupabase = class(TInterfacedObject, iSupabase)
strict private
  FConfig : iSupabaseConfig;
public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iSupabase;

  function From(aTable : String) : iSupabaseTable;
  function Config : iSupabaseConfig;
end;

implementation

uses
  Supabase.Factory;

{ TSupabase }

constructor TSupabase.Create;
begin
   FConfig := TSupabaseFactory.New.config;
end;

destructor TSupabase.Destroy;
begin

  inherited;
end;

class function TSupabase.New: iSupabase;
begin
  Result := TSupabase.Create;
end;

function TSupabase.From(aTable: String): iSupabaseTable;
begin
  Result := TSupabaseFactory.New.table(Self, aTable);
end;

function TSupabase.Config: iSupabaseConfig;
begin
  Result := FConfig;
end;

end.
