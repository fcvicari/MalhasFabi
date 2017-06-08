unit uFramework.DTOInterface;

interface

uses
  uFramework.DTOTypes,
  uFramework.DTO.CamposInterface,
  uFramework.TipoCampoEnumerador;

type
  IFrameworkDTOInterface = interface
    function ListaCampos: TFrameworkDTODicionario;

    function Tabela: String;

    function BuscarCampo(ACampo: String): IFrameworkDTOCamposInterface;

    procedure AdicionarCampo(const ANome: String; const ATipoCampo: TTipoCampo;
      const AChave: Boolean; const ADefault: Variant);
  end;

implementation

end.
