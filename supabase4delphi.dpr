program supabase4delphi;

{$APPTYPE CONSOLE}

{$R *.res}

uses
  System.SysUtils,
  Supabase.Factory in 'src\Supabase.Factory.pas',
  Supabase.Filter.Item in 'src\Supabase.Filter.Item.pas',
  Supabase.Filter in 'src\Supabase.Filter.pas',
  Supabase.Interfaces in 'src\Supabase.Interfaces.pas',
  Supabase in 'src\Supabase.pas',
  Supabase.Table in 'src\Supabase.Table.pas',
  Supabase.Config.Interfaces in 'src\Config\Supabase.Config.Interfaces.pas',
  Supabase.Config in 'src\Config\Supabase.Config.pas';

var
  lConfig : iSupabaseConfig;
begin
  lConfig := TSupabaseConfig.New
                            .url('https://rfbqvyzybpmsaysknnis.supabase.co')
                            .apikey('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InJmYnF2eXp5YnBtc2F5c2tubmlzIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDkxMzg5MzYsImV4cCI6MjAyNDcxNDkzNn0.5lTqB7q7TLV0EzB33l79znvCEBZi0nVRZQ67xfIqBb0');
  try
    Writeln(TSupabase.New(lConfig)
                     .From('empresas')
                     .Select('nome_fantasia, documento, funcionarios(nome)')
                     .ToString);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.
