unit Supabase.Table;

interface

uses
  Supabase.Interfaces, System.JSON, System.Generics.Collections;

type

TSupabaseTable = class(TInterfacedObject, iSupabaseTable)
private
  [Weak]
  FParent : iSupabase;
  FTabela : String;
  FFilter : iSupabaseFilter;
public
  constructor Create(aParent : iSupabase; aTabela : String); reintroduce;
  destructor Destroy; override;
  class function New(aParent : iSupabase; aTabela : String) : iSupabaseTable;

  function AddFilter : iSupabaseFilter;

  function Select(aColumns : String) : TJSONArray;
  function Insert(aItem : TJSONObject) : iSupabaseTable; overload;
  function Insert(aItems : TJSONArray) : iSupabaseTable; overload;
  function Update(aItem : TJSONObject) : iSupabaseTable;
  function Delete : iSupabaseTable;
end;

implementation

uses
  Supabase.Filter,
  System.SysUtils, RESTRequest4D;

{ TSupabaseTable }

constructor TSupabaseTable.Create(aParent : iSupabase; aTabela : String);
begin
  FTabela := aTabela;
  FFilter := TSupabaseFilter.New(Self);
  FParent := aParent;
end;

destructor TSupabaseTable.Destroy;
begin

  inherited;
end;

class function TSupabaseTable.New(aParent : iSupabase; aTabela : String): iSupabaseTable;
begin
  Result := TSupabaseTable.Create(aParent, aTabela);
end;

function TSupabaseTable.Insert(aItems: TJSONArray): iSupabaseTable;
var
  LResponse: IResponse;
begin
  Result := Self;
  LResponse := TRequest.New.BaseURL(FParent.Config.url)
                           .Resource(FTabela)
                           .AddHeader('apikey', FParent.Config.apikey)
//                           .AddHeader('Authorization', FParent.Config.auth)
                           .ContentType('application/json')
                           .AddBody(aItems)
                           .Post;
  Writeln(LResponse.Content);
end;

function TSupabaseTable.Insert(aItem: TJSONObject): iSupabaseTable;
var
  LResponse: IResponse;
begin
  Result := Self;
  LResponse := TRequest.New.BaseURL(FParent.Config.url)
                           .Resource(FTabela)
                           .AddHeader('apikey', FParent.Config.apikey)
//                           .AddHeader('Authorization', FParent.Config.auth)
                           .ContentType('application/json')
                           .AddBody(aItem)
                           .Post;
  if not ((LResponse.StatusCode = 200) or (LResponse.StatusCode = 201)) then raise Exception.Create(LResponse.Content);
end;

function TSupabaseTable.Delete: iSupabaseTable;
var
  lRequest : IRequest;
  LResponse: IResponse;
  I: Integer;
begin
  Result := Self;
  lRequest := TRequest.New.BaseURL(FParent.Config.url)
                           .Resource(FTabela)
                           .AddHeader('apikey', FParent.Config.apikey);
//                           .AddHeader('Authorization', FParent.Config.auth)


  for I := 0 to Pred(FFilter.Count) do
    lRequest.AddParam(FFilter.itens[i].Key, FFilter.itens[i].Value);

  LResponse := lRequest.Delete;

  if not (LResponse.StatusCode = 200) then raise Exception.Create(LResponse.Content);
end;

function TSupabaseTable.Select(aColumns: String): TJSONArray;
var
  lRequest : IRequest;
  lResponse: IResponse;
  I: Integer;
begin
  lRequest := TRequest.New
                      .BaseURL(FParent.Config.url+'/rest/v1')
                      .Resource(FTabela)
                      .AddHeader('apikey', FParent.Config.apikey)
//                      .AddHeader('Authorization', FParent.Config.auth)
                      .Accept('application/json');
                                  ;
  for I := 0 to Pred(FFilter.Count) do
    lRequest.AddParam(FFilter.itens[i].Key, FFilter.itens[i].Value);
  lRequest.AddParam('select', aColumns);

  LResponse := lRequest.Get;

  if LResponse.StatusCode = 200 then
    Result := TJSONObject.ParseJSONValue(LResponse.Content) as TJSONArray
  else
  begin
    Result := TJSONArray.Create;
    raise Exception.Create(LResponse.Content);
  end;
end;

function TSupabaseTable.Update(aItem: TJSONObject): iSupabaseTable;
var                         
  lRequest : IRequest;
  lResponse: IResponse; 
  I: Integer;
begin
  Result := Self;
  lRequest := TRequest.New.BaseURL(FParent.Config.url)
                           .Resource(FTabela)
                           .AddHeader('apikey', FParent.Config.apikey)
//                           .AddHeader('Authorization', FParent.Config.auth)
                           .ContentType('application/json')
                           .AddBody(aItem);

  for I := 0 to Pred(FFilter.Count) do
    lRequest.AddParam(FFilter.itens[i].Key, FFilter.itens[i].Value);
                           
  lResponse := lRequest.Patch;
  if not ((LResponse.StatusCode = 200) or (LResponse.StatusCode = 204)) then raise Exception.Create(LResponse.Content);
end;

function TSupabaseTable.AddFilter: iSupabaseFilter;
begin
  Result := FFilter;
end;

end.
