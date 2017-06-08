unit uFramework.Registro.Inserir;

interface

uses
  System.SysUtils,
  uBancoDados.AcessoRgn,
  uFramework.DTOInterface,
  uFramework.DTO.CamposInterface,
  uFramework.RegistroInterface,
  uFramework.Conversao;

type
  TFrameworkRegistroInserir = class (TInterfacedObject, IFrameworkRegistroInterface)
  public
    function Execute(AConexao: TBancoDadosAcessoRgn; ADto: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TFrameworkRegistroInserir }

function TFrameworkRegistroInserir.Execute(AConexao: TBancoDadosAcessoRgn;
  ADto: IFrameworkDTOInterface): Boolean;
var
  sSqlCampos, sSqlValores, sSql: String;
  oCampos: IFrameworkDTOCamposInterface;
begin
  Result := False;
  sSqlCampos := EmptyStr;
  sSqlValores:= EmptyStr;

  for oCampos in ADto.ListaCampos.Values do
  begin
    if (sSqlCampos.Trim <> '') then
      sSqlCampos := sSqlCampos + ', ';

    sSqlCampos := sSqlCampos + oCampos.Nome;

    if (sSqlValores.Trim <> '') then
      sSqlValores := sSqlValores + ', ';

    sSqlValores := sSqlValores + TFrameworkConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior)
  end;

  if (not(sSqlValores.IsEmpty)) then
  begin
    sSql := 'insert into ' + ADto.Tabela + ' (' + sSqlCampos + ') values (' + sSqlValores + ')';

    Result := (AConexao.ExecSQL(sSql) > 0);
  end;
end;

end.
