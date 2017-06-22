unit uFramework.Registro.Localizar;

interface

uses
  System.SysUtils,
  FireDAC.Comp.Client,
  Data.DB,
  FireDAC.DApt,
  FireDAC.Comp.UI,
  FireDAC.Comp.DataSet,
  uFramework.Registro.LocalizarInterface,
  uFramework.DTOInterface,
  uFramework.Registro.FiltrosTypes,
  uBancoDados.AcessoRgn,
  uFramework.DTO.CamposInterface,
  uFramework.Registro.FiltrosInterface,
  uFramework.Conversao;

type
  TFrameworkRegistroLocalizar = class (TInterfacedObject, IFrameworkRegistroLocalizarInterface)
  private
    function MontarSelect(const ADTO: IFrameworkDTOInterface): String;
    function MontarWhere(const AFiltro: TFrameworkFiltroDicionario): String;
  public
    function Execute(const AConexao: TBancoDadosAcessoRgn; const AFiltro: TFrameworkFiltroDicionario;
      var ADTO: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TFrameworkRegistroInserir }

function TFrameworkRegistroLocalizar.Execute(const AConexao: TBancoDadosAcessoRgn;
  const AFiltro: TFrameworkFiltroDicionario;
  var ADTO: IFrameworkDTOInterface): Boolean;
var
  oQuery: TFDQuery;
  iIndice: integer;
  sInstrucao: String;
begin
  Result := False;

  sInstrucao := MontarSelect(ADTO);
  if (not(sInstrucao.IsEmpty)) then
    sInstrucao := sInstrucao + ' ' + MontarWhere(AFiltro);

  if (not(sInstrucao.IsEmpty)) then
  begin
    oQuery := TFDQuery.Create(nil);
    try
      oQuery.Connection := AConexao;
      oQuery.Open(sInstrucao);
      if (not(oQuery.IsEmpty)) then
      begin
        for iIndice := 0 to (oQuery.FieldCount - 1) do
        begin
          ADTO.ListaCampos[oQuery.Fields[iIndice].FieldName].ValorAtual    := oQuery.Fields[iIndice].Value;
          ADTO.ListaCampos[oQuery.Fields[iIndice].FieldName].ValorAnterior := oQuery.Fields[iIndice].Value;
        end;

        Result := True;
      end;
    finally
      if Assigned(oQuery) then
        FreeAndNil(oQuery);
    end;
  end;
end;

function TFrameworkRegistroLocalizar.MontarSelect(
  const ADTO: IFrameworkDTOInterface): String;
var
  oCampos: IFrameworkDTOCamposInterface;
begin
  Result := EmptyStr;
  for oCampos in ADto.ListaCampos.Values do
  begin
    if (not(Result.IsEmpty)) then
      Result := Result + ',';

    Result := Result + ' ' + oCampos.Nome;
  end;

  if (not(Result.IsEmpty)) then
    Result := 'select ' + Result + ' from ' + ADTO.Tabela;
end;

function TFrameworkRegistroLocalizar.MontarWhere(
  const AFiltro: TFrameworkFiltroDicionario): String;
var
  oCampos: IFrameworkRegistroFiltrosInterface;
begin
  Result := EmptyStr;
  for oCampos in AFiltro.Values do
  begin
    if (not(Result.IsEmpty)) then
      Result := Result + ',';

    Result := Result + ' ' + oCampos.Nome + ' = ' + TFrameworkConversao.VarToSql(oCampos.TipoCampo, oCampos.Valor);
  end;

  if (not(Result.IsEmpty)) then
    Result := 'where ' + Result;
end;

end.
