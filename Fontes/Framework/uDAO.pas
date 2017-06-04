unit uDAO;

interface

uses
  uDAOInterface,
  uDTOInterface;

type
  TDao = class(TInterfacedObject, IDAOInterface)
    function Localizar(ADTO: IDTOInterface): Boolean;

    function Inserir(ADTO: IDTOInterface): Boolean;

    function Alterar(ADTO: IDTOInterface): Boolean;

    function Excluir(ADTO: IDTOInterface): Boolean;
  end;

implementation

{ TDao }

function TDao.Alterar(ADTO: IDTOInterface): Boolean;
begin

end;

function TDao.Excluir(ADTO: IDTOInterface): Boolean;
begin

end;

function TDao.Inserir(ADTO: IDTOInterface): Boolean;
begin

end;

function TDao.Localizar(ADTO: IDTOInterface): Boolean;
begin

end;

end.
