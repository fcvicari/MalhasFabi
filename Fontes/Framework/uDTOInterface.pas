unit uDTOInterface;

interface

uses
  uDTOCamposInterface,
  uDtoCamposEnumerador;

type
  IDTOInterface = interface
    function Tabela: String;

    function BuscarCampo(ACampo: String): IDTOCamposInterface;

    procedure AdicionarCampo(const ANome: String; const ATipoCampo: TTipoCampo;
      const AChave: Boolean; const ADefault: Variant);
  end;

implementation

end.
