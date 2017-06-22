unit uFramework.RegistroInterface;

interface

uses
  uFramework.DTOInterface,
  uBancoDados.AcessoRgn;

type
  IFrameworkRegistroInterface = interface
    function Execute(const AConexao: TBancoDadosAcessoRgn; const ADto: IFrameworkDTOInterface): Boolean;
  end;

implementation

end.
