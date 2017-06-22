unit uFramework.Registro.FiltrosInterface;

interface

uses
  uFramework.TipoCampoEnumerador;

type
  IFrameworkRegistroFiltrosInterface = interface(IInterface)
    function Nome: String;

    function TipoCampo: TTipoCampo;

    function Valor: Variant;
  end;

implementation

end.
