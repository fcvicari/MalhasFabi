unit uFramework.DAO;

interface

uses
  uBancoDados.AcessoSingleton,
  uFramework.RegistroInterface,
  uFramework.Registro.Excluir,
  uFramework.Registro.Inserir,
  uFramework.Registro.Alterar,
  uFramework.DTOInterface,
  uFramework.DAOInterface;

type
  TFrameworkDAO = class(TInterfacedObject, IFrameworkDAOInterface)
    function Localizar(ADTO: IFrameworkDTOInterface): Boolean;

    function Inserir(ADTO: IFrameworkDTOInterface): Boolean;

    function Alterar(ADTO: IFrameworkDTOInterface): Boolean;

    function Excluir(ADTO: IFrameworkDTOInterface): Boolean;
  end;

implementation

{ TFrameworkDAO }

function TFrameworkDAO.Alterar(ADTO: IFrameworkDTOInterface): Boolean;
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



function TFrameworkDAO.Excluir(ADTO: IFrameworkDTOInterface): Boolean;
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



function TFrameworkDAO.Inserir(ADTO: IFrameworkDTOInterface): Boolean;
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



function TFrameworkDAO.Localizar(ADTO: IFrameworkDTOInterface): Boolean;
begin

end;

end.
