unit uDAOInterface;

interface

uses
  uDTOInterface;

type
  IDAOInterface = interface
    function Localizar(ADTO: IDTOInterface): Boolean;

    function Inserir(ADTO: IDTOInterface): Boolean;

    function Alterar(ADTO: IDTOInterface): Boolean;

    function Excluir(ADTO: IDTOInterface): Boolean;
  end;

implementation

end.
