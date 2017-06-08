unit uFramework.RegistroInterface;

interface

uses
  uFramework.DTOInterface,
  uBancoDados.AcessoRgn;

type
  IFrameworkRegistroInterface = interface
    function Execute(AConexao: TBancoDadosAcessoRgn; ADto: IFrameworkDTOInterface): Boolean;
  end;

implementation

end.
