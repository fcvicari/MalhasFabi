unit uFramework.DAOInterface;

interface

uses
  uFramework.DTOInterface,
  uFramework.DTOTypes,
  uFramework.Registro.FiltrosTypes;

type
  IFrameworkDAOInterface = interface
    function Localizar(const AFiltro: TFrameworkFiltroDicionario; var ADTO: IFrameworkDTOInterface): Boolean;

    function Inserir(const ADTO: IFrameworkDTOInterface): Boolean;

    function Alterar(const ADTO: IFrameworkDTOInterface): Boolean;

    function Excluir(const ADTO: IFrameworkDTOInterface): Boolean;
  end;

implementation

end.
