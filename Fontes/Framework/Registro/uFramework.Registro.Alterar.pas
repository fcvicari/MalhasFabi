unit uFramework.Registro.Alterar;

interface

uses
  System.SysUtils,
  uBancoDados.AcessoRgn,
  uFramework.DTOInterface,
  uFramework.DTO.CamposInterface,
  uFramework.RegistroInterface,
  uFramework.Conversao;

type
  TFrameworkRegistroAlterar = class(TInterfacedObject, IFrameworkRegistroInterface)
  public
    function Execute(AConexao: TBancoDadosAcessoRgn; ADto: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TFrameworkRegistroAlterar }

function TFrameworkRegistroAlterar.Execute(AConexao: TBancoDadosAcessoRgn;
  ADto: IFrameworkDTOInterface): Boolean;
var
  sSql, sSqlCampos, sChave: String;
  oCampos: IFrameworkDTOCamposInterface;
begin
  Result := False;
  sSqlCampos := EmptyStr;
  sChave := EmptyStr;

  for oCampos in ADto.ListaCampos.Values do
  begin
    if (oCampos.Chave) then
    begin
      if (sChave.Trim <> '') then
        sChave := sChave + ' and';

      sChave := sChave + ' ' + oCampos.Nome + ' = ' +TFrameworkConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior);
    end
    else
    begin
      if (sSqlCampos.Trim <> '') then
        sSqlCampos := sSqlCampos + ',';

      sSqlCampos := sSqlCampos + ' ' + oCampos.Nome + ' = ' +TFrameworkConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior);
    end;
  end;

  if (not(sSqlCampos.IsEmpty)) and (not(sChave.IsEmpty)) then
  begin
    sSql := 'update ' + ADto.Tabela + ' set ' + sSqlCampos + ' where ' + sChave;

    Result := (AConexao.ExecSQL(sSql) > 0);
  end;
end;

end.
