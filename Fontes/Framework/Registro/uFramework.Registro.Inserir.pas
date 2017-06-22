unit uFramework.Registro.Inserir;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.DApt,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet,
  uBancoDados.AcessoRgn,
  uFramework.DTOInterface,
  uFramework.DTO.CamposInterface,
  uFramework.RegistroInterface,
  uFramework.Conversao;

type
  TFrameworkRegistroInserir = class (TInterfacedObject, IFrameworkRegistroInterface)
  private
    function BuscarID(const AConexao: TBancoDadosAcessoRgn; const ATabela: String): Integer;
  public
    function Execute(const AConexao: TBancoDadosAcessoRgn; const ADto: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TFrameworkRegistroInserir }

function TFrameworkRegistroInserir.BuscarID(const AConexao: TBancoDadosAcessoRgn; const ATabela: String): Integer;
var
  oQuery: TFDQuery;
begin
  Result := 1;
  oQuery := TFDQuery.Create(nil);
  try
    oQuery.Connection := AConexao;
    oQuery.Open('select nextval(' + QuotedStr(ATabela+'_Sequence') + ') as ID');
    if (not(oQuery.IsEmpty)) then
      Result := oQuery.FieldByName('ID').AsInteger;
  finally
    if Assigned(oQuery) then
      FreeAndNil(oQuery);
  end;
end;



function TFrameworkRegistroInserir.Execute(const AConexao: TBancoDadosAcessoRgn;
  const ADto: IFrameworkDTOInterface): Boolean;
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

    if (oCampos.Chave) and (TFrameworkConversao.VarToInteger(oCampos.ValorAtual) <= 0) then
      sSqlValores := sSqlValores + IntToStr(BuscarID(AConexao, ADto.Tabela))
    else
      sSqlValores := sSqlValores + TFrameworkConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior)
  end;

  if (not(sSqlValores.IsEmpty)) then
  begin
    sSql := 'insert into ' + ADto.Tabela + ' (' + sSqlCampos + ') values (' + sSqlValores + ')';

    Result := (AConexao.ExecSQL(sSql) > 0);
  end;
end;

end.
