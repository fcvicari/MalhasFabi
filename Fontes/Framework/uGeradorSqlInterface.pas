unit uGeradorSqlInterface;

interface

uses
  uDTOInterface,
  uBancoDadosAcessoRgn;

type
  IGeradorSql = interface
    function Execute(AConexao: TBancoDadosAcessoRgn; ADto: IDTOInterface): Boolean;
  end;

implementation

end.
