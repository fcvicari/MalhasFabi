unit uFramework.Registro.LocalizarInterface;

interface

uses
  uFramework.DTOInterface,
  uFramework.Registro.FiltrosTypes,
  uBancoDados.AcessoRgn;

type
  IFrameworkRegistroLocalizarInterface = interface
    function Execute(const AConexao: TBancoDadosAcessoRgn; const AFiltro: TFrameworkFiltroDicionario;
      var ADTO: IFrameworkDTOInterface): Boolean;
  end;

implementation

end.
