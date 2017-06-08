unit uFramework.DAOInterface;

interface

uses
  uFramework.DTOInterface;

type
  IFrameworkDAOInterface = interface
    function Localizar(ADTO: IFrameworkDTOInterface): Boolean;

    function Inserir(ADTO: IFrameworkDTOInterface): Boolean;

    function Alterar(ADTO: IFrameworkDTOInterface): Boolean;

    function Excluir(ADTO: IFrameworkDTOInterface): Boolean;
  end;

implementation

end.
