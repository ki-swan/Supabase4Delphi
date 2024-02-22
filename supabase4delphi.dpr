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
  Gotrue.Interfaces in 'src\GoTrue\Gotrue.Interfaces.pas',
  GoTrue.SignWithPasswordCredentials in 'src\GoTrue\GoTrue.SignWithPasswordCredentials.pas',
  Supabase.Config.Interfaces in 'src\Config\Supabase.Config.Interfaces.pas',
  Supabase.Config in 'src\Config\Supabase.Config.pas';
var
  lConfig : iSupabaseConfig;
begin
  lConfig := TSupabaseConfig.New
                            .url('https://bdpwggbizeeapdsfjzse.supabase.co')
                            .apikey('eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6ImJkcHdnZ2JpemVlYXBkc2ZqenNlIiwicm9sZSI6ImFub24iLCJpYXQiOjE3MDc3NTg2NTEsImV4cCI6MjAyMzMzNDY1MX0.Injr0lgDZavMKBOB_FUZzgUdDMUoxdMpQ--XRMvkoPQ');
  try
    Writeln(TSupabase.New(lConfig)
                     .From('chat')
                     .Select('*')
                     .ToString);
  except
    on E: Exception do
      Writeln(E.ClassName, ': ', E.Message);
  end;
  readln;
end.
