program SysStore;

uses
  Vcl.Forms,
  uFrmAcesso in 'uFrmAcesso.pas' {Form1},
  uBancoDados.AcessoSingleton in 'BancoDados\uBancoDados.AcessoSingleton.pas',
  uBancoDados.AcessoRgn in 'BancoDados\uBancoDados.AcessoRgn.pas',
  uBancoDados.DriverFactory in 'BancoDados\uBancoDados.DriverFactory.pas',
  uBancoDados.Enumerador in 'BancoDados\uBancoDados.Enumerador.pas',
  uFramework.DTO.CamposInterface in 'Framework\DTO\uFramework.DTO.CamposInterface.pas',
  uFramework.TipoCampoEnumerador in 'Framework\uFramework.TipoCampoEnumerador.pas',
  uFramework.DTO.Campos in 'Framework\DTO\uFramework.DTO.Campos.pas',
  uFramework.DTOInterface in 'Framework\DTO\uFramework.DTOInterface.pas',
  uFramework.DTO in 'Framework\DTO\uFramework.DTO.pas',
  uFramework.DAOInterface in 'Framework\DAO\uFramework.DAOInterface.pas',
  uFramework.DTOTypes in 'Framework\DTO\uFramework.DTOTypes.pas',
  uFramework.DAO in 'Framework\DAO\uFramework.DAO.pas',
  uFramework.RegistroInterface in 'Framework\Registro\uFramework.RegistroInterface.pas',
  uFramework.Registro.Excluir in 'Framework\Registro\uFramework.Registro.Excluir.pas',
  uFramework.Conversao in 'Framework\uFramework.Conversao.pas',
  uFramework.Registro.Inserir in 'Framework\Registro\uFramework.Registro.Inserir.pas',
  uFramework.Registro.Alterar in 'Framework\Registro\uFramework.Registro.Alterar.pas',
  uFramework.Registro.Localizar in 'Framework\Registro\uFramework.Registro.Localizar.pas',
  uFramework.Registro.FiltrosInterface in 'Framework\Registro\uFramework.Registro.FiltrosInterface.pas',
  uFramework.Registro.Filtros in 'Framework\Registro\uFramework.Registro.Filtros.pas',
  uFramework.Registro.FiltrosTypes in 'Framework\Registro\uFramework.Registro.FiltrosTypes.pas',
  uFramework.Registro.LocalizarInterface in 'Framework\Registro\uFramework.Registro.LocalizarInterface.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
