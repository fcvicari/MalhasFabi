unit uExcluirRegistro;

interface

uses
  System.SysUtils,
  System.Variants,
  uDTOInterface,
  uBancoDadosAcessoRgn,
  uDTOCamposInterface,
  uConversao,
  uGeradorSqlInterface;

type
  TExcluirRegistro = class (TInterfacedObject, IGeradorSql)
  public
    function Execute(AConexao: TBancoDadosAcessoRgn; ADto: IDTOInterface): Boolean;
  end;

implementation

{ TExcluirRegistro }

function TExcluirRegistro.Execute(AConexao: TBancoDadosAcessoRgn;
  ADto: IDTOInterface): Boolean;
var
  sSql: String;
  oCampos: IDTOCamposInterface;
begin
  Result := False;
  sSql := EmptyStr;

  for oCampos in ADto.ListaCampos.Values do
  begin
    if (oCampos.Chave) then
    begin
      if (sSql.Trim <> '') then
        sSql := sSql + ' and ';

      sSql := sSql + oCampos.Nome + ' = ' + TConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior)
    end;
  end;

  if (not(sSql.IsEmpty)) then
  begin
    sSql := 'delete from ' + ADto.Tabela + ' ' + sSql;
    Result := (AConexao.ExecSQL(sSql) > 0);
  end;
end;

end.
