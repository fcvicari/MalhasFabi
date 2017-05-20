unit uDTOCamposInterface;

interface

uses
  uDTOCamposEnumerador;

type
  IDTOCamposInterface = interface
    function Nome: String;

    function Modificado: Boolean;

    function TipoCampo: TTipoCampo;

    function Chave: Boolean;

    function ValorDefault: Variant;

    function GetValorAtual: Variant;
    procedure SetValorAtual(AValor: Variant);

    function GetValorAnterior: Variant;
    procedure SetValorAnterior(AValor: Variant);

    property ValorAtual: Variant read GetValorAtual write SetValorAtual;
    property ValorAnterior: Variant read GetValorAnterior write SetValorAnterior;
  end;

implementation

end.
