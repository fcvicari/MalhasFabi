unit uFramework.DTO.CamposInterface;

interface

uses
  uFramework.TipoCampoEnumerador;

type
  IFrameworkDTOCamposInterface = interface(IInterface)

    function GetValorAtual: Variant;
    procedure SetValorAtual(AValor: Variant);

    function GetValorAnterior: Variant;
    procedure SetValorAnterior(AValor: Variant);

    function Nome: String;

    function Modificado: Boolean;

    function TipoCampo: TTipoCampo;

    function Chave: Boolean;

    function ValorDefault: Variant;

    property ValorAtual: Variant read GetValorAtual write SetValorAtual;

    property ValorAnterior: Variant read GetValorAnterior write SetValorAnterior;
  end;

implementation

end.
