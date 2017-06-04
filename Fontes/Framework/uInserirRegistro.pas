unit uInserirRegistro;

interface

uses
  System.SysUtils,
  uBancoDadosAcessoRgn,
  uDTOInterface,
  uDTOCamposInterface,
  uGeradorSqlInterface,
  uConversao;

type
  TInserirRegistro = class (TInterfacedObject, IGeradorSql)
  public
    function Execute(AConexao: TBancoDadosAcessoRgn; ADto: IDTOInterface): Boolean;
  end;

implementation

{ TInserirRegistro }

function TInserirRegistro.Execute(AConexao: TBancoDadosAcessoRgn;
  ADto: IDTOInterface): Boolean;
var
  sSqlCampos, sSqlValores, sSql: String;
  oCampos: IDTOCamposInterface;
begin
  Result := False;
  sSqlCampos := EmptyStr;
  sSqlValores:= EmptyStr;

  for oCampos in ADto.ListaCampos.Values do
  begin
    if (oCampos.Chave) then
    begin
      if (sSqlCampos.Trim <> '') then
        sSqlCampos := sSqlCampos + ', ';

      sSqlCampos := sSqlCampos + oCampos.Nome;

      if (sSqlValores.Trim <> '') then
        sSqlValores := sSqlValores + ', ';

      sSqlValores := sSqlValores + TConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior)
    end;
  end;

  if (not(sSqlValores.IsEmpty)) then
  begin
    sSql := 'insert into ' + ADto.Tabela + ' (' + sSqlCampos + ') values (' + sSqlValores + ')';

    Result := (AConexao.ExecSQL(sSql) > 0);
  end;end;

end.
