unit uFramework.Registro.Excluir;

interface

uses
  System.SysUtils,
  System.Variants,
  uFramework.DTOInterface,
  uBancoDados.AcessoRgn,
  uFramework.DTO.CamposInterface,
  uFramework.Conversao,
  uFramework.RegistroInterface;

type
  TFrameworkRegistroExcluir = class(TInterfacedObject, IFrameworkRegistroInterface)
  public
    function Execute(const AConexao: TBancoDadosAcessoRgn; const ADto: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TExcluirRegistro }

function TFrameworkRegistroExcluir.Execute(const AConexao: TBancoDadosAcessoRgn;
  const ADto: IFrameworkDTOInterface): Boolean;
var
  sSql: String;
  oCampos: IFrameworkDTOCamposInterface;
begin
  Result := False;
  sSql := EmptyStr;

  for oCampos in ADto.ListaCampos.Values do
  begin
    if (oCampos.Chave) then
    begin
      if (not(sSql.IsEmpty)) then
        sSql := sSql + ' and ';

      sSql := sSql + oCampos.Nome + ' = ' + TFrameworkConversao.VarToSql(oCampos.TipoCampo, oCampos.ValorAnterior)
    end;
  end;

  if (not(sSql.IsEmpty)) then
  begin
    sSql := 'delete from ' + ADto.Tabela + ' ' + sSql;
    Result := (AConexao.ExecSQL(sSql) > 0);
  end;
end;

end.
