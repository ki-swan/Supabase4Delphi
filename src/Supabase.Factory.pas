unit Supabase.Factory;

interface

uses
  Supabase.Interfaces, Supabase.Config;

type

TSupabaseFactory = class(TInterfacedObject, iSupabaseFactory)
private

public
  constructor Create; reintroduce;
  destructor Destroy; override;
  class function New : iSupabaseFactory;

  function config : iSupabaseConfig;
  function supabase : iSupabase;
  function table(aParent : iSupabase; aTabela : String) : iSupabaseTable;
  function filter(aParent: iSupabaseTable) : iSupabaseFilter;
end;

implementation

uses
  Supabase, Supabase.Table, Supabase.Filter;

{ TSupabaseFactory }

constructor TSupabaseFactory.Create;
begin

end;

destructor TSupabaseFactory.Destroy;
begin

  inherited;
end;

class function TSupabaseFactory.New: iSupabaseFactory;
begin
  Result := TSupabaseFactory.Create;
end;

function TSupabaseFactory.config: iSupabaseConfig;
begin
  Result := TSupabaseConfig.New;
end;

function TSupabaseFactory.filter(aParent: iSupabaseTable): iSupabaseFilter;
begin
  Result := TSupabaseFilter.New(aParent);
end;

function TSupabaseFactory.supabase: iSupabase;
begin
  Result := TSupabase.New;
end;

function TSupabaseFactory.table(aParent : iSupabase; aTabela : String): iSupabaseTable;
begin
  Result := TSupabaseTable.New(aParent, aTabela);
end;

end.
