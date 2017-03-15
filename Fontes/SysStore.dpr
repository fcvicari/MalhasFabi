program SysStore;

uses
  Vcl.Forms,
  uFrmAcesso in 'uFrmAcesso.pas' {Form1},
  uBancoDadosAcessoSingleton in 'BancoDados\uBancoDadosAcessoSingleton.pas',
  uBancoDadosAcessoRgn in 'BancoDados\uBancoDadosAcessoRgn.pas',
  uBancoDadosDriverFactory in 'BancoDados\uBancoDadosDriverFactory.pas',
  uBancoDadosAcessoEnumerador in 'BancoDados\uBancoDadosAcessoEnumerador.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
