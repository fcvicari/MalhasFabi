unit uFramework.DAO;

interface

uses
  uBancoDados.AcessoSingleton,
  uFramework.RegistroInterface,
  uFramework.Registro.Excluir,
  uFramework.Registro.Inserir,
  uFramework.Registro.Alterar,
  uFramework.Registro.LocalizarInterface,
  uFramework.Registro.Localizar,
  uFramework.DTOInterface,
  uFramework.DTOTypes,
  uFramework.DAOInterface,
  uFramework.Registro.FiltrosTypes;

type
  TFrameworkDAO = class(TInterfacedObject, IFrameworkDAOInterface)
    function Localizar(const AFiltro: TFrameworkFiltroDicionario; var ADTO: IFrameworkDTOInterface): Boolean;

    function Inserir(const ADTO: IFrameworkDTOInterface): Boolean;

    function Alterar(const ADTO: IFrameworkDTOInterface): Boolean;

    function Excluir(const ADTO: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TFrameworkDAO }

function TFrameworkDAO.Alterar(const ADTO: IFrameworkDTOInterface): Boolean;
var
  oAlterar: IFrameworkRegistroInterface;
begin
  oAlterar := TFrameworkRegistroAlterar.Create;
  try
    Result := oAlterar.Execute(TBancoDadosAcessoSingleton.GetInstance, ADTO);
  except
    Result := False;
  end;
end;



function TFrameworkDAO.Excluir(const ADTO: IFrameworkDTOInterface): Boolean;
var
  oExcluir: IFrameworkRegistroInterface;
begin
  oExcluir := TFrameworkRegistroExcluir.Create;
  try
    Result := oExcluir.Execute(TBancoDadosAcessoSingleton.GetInstance, ADTO);
  except
    Result := False;
  end;
end;



function TFrameworkDAO.Inserir(const ADTO: IFrameworkDTOInterface): Boolean;
var
  oInserir: IFrameworkRegistroInterface;
begin
  oInserir := TFrameworkRegistroInserir.Create;
  try
    Result := oInserir.Execute(TBancoDadosAcessoSingleton.GetInstance, ADTO);
  except
    Result := False;
  end;
end;



function TFrameworkDAO.Localizar(const AFiltro: TFrameworkFiltroDicionario; var ADTO: IFrameworkDTOInterface): Boolean;
var
  oLocalizar: IFrameworkRegistroLocalizarInterface;
begin
  oLocalizar := TFrameworkRegistroLocalizar.Create;
  try
    Result := oLocalizar.Execute(TBancoDadosAcessoSingleton.GetInstance, AFiltro, ADTO);
  except
    Result := False;
  end;
end;

end.
