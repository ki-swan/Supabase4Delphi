unit Supabase.Filter;

interface

uses
  Supabase.Interfaces, System.Generics.Collections, System.JSON;

type

TSupabaseFilter = class(TInterfacedObject, iSupabaseFilter)
private
  [Weak]
  FParent : iSupabaseTable;
  FList : TList<iSupabaseFilterItem>;
public
  constructor Create(aParent : iSupabaseTable); reintroduce;
  destructor Destroy; override;
  class function New(aParent : iSupabaseTable) : iSupabaseFilter;

  function Count : Integer;
  function isEmpty : Boolean;
  function itens : TList<iSupabaseFilterItem>;
  function Clear : iSupabaseTable;

  function eq(aColumn : String; aValue : Variant) : iSupabaseTable;
  function neq(aColumn : String; aValue : Variant) : iSupabaseTable;
  function gt(aColumn : String; aValue : Variant) : iSupabaseTable;
  function lt(aColumn : String; aValue : Variant) : iSupabaseTable;
  function gte(aColumn : String; aValue : Variant) : iSupabaseTable;
  function lte(aColumn : String; aValue : Variant) : iSupabaseTable;
  function like(aColumn : String; aValue : Variant) : iSupabaseTable;
  function ilike(aColumn : String; aValue : Variant) : iSupabaseTable;
  function isNull(aColumn : String) : iSupabaseTable;
end;

implementation

{ TSupabaseFilter }

uses
  System.Variants, Supabase.Filter.Item, System.SysUtils;

constructor TSupabaseFilter.Create(aParent: iSupabaseTable);
begin
  FParent := aParent;
  FList := TList<iSupabaseFilterItem>.Create;
end;

destructor TSupabaseFilter.Destroy;
begin
  FreeAndNil(FList);
  inherited;
end;

class function TSupabaseFilter.New(aParent: iSupabaseTable): iSupabaseFilter;
begin
  Result := TSupabaseFilter.Create(aParent);
end;

function TSupabaseFilter.Count: Integer;
begin
  Result := FList.Count;
end;

function TSupabaseFilter.isEmpty: Boolean;
begin
  Result := FList.Count = 0;
end;

function TSupabaseFilter.itens: TList<iSupabaseFilterItem>;
begin
  Result := FList;
end;

function TSupabaseFilter.Clear: iSupabaseTable;
begin
  Result := FParent;
  FList.Clear;
end;

function TSupabaseFilter.eq(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('eq.'+VarToStr(aValue)));
end;

function TSupabaseFilter.neq(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('neq.'+VarToStr(aValue)));
end;

function TSupabaseFilter.isNull(aColumn: String): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('is.'+'null'));
end;

function TSupabaseFilter.gt(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('gt.'+VarToStr(aValue)));
end;

function TSupabaseFilter.gte(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('gte.'+VarToStr(aValue)));
end;

function TSupabaseFilter.ilike(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  { TODO 2 -oYuki -cFilter :  }
  raise Exception.Create('não implementado');
end;

function TSupabaseFilter.like(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  { TODO 2 -oYuki -cFilter :  }
  raise Exception.Create('não implementado');
end;

function TSupabaseFilter.lt(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('lt.'+VarToStr(aValue)));
end;

function TSupabaseFilter.lte(aColumn: String; aValue: Variant): iSupabaseTable;
begin
  Result := FParent;
  FList.Add(TSupabaseFilterItem.New.Key(aColumn).Value('lte.'+VarToStr(aValue)));
end;

end.
