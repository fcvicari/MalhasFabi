unit uFramework.Registro.Filtros;

interface

uses
  uFramework.TipoCampoEnumerador,
  uFramework.Registro.FiltrosInterface;

type
  TFrameworkRegistroFiltros = class(TInterfacedObject, IFrameworkRegistroFiltrosInterface)
  private
    FNome: String;
    FTipoCampo: TTipoCampo;
    FValor: Variant;
  public
    function Nome: String;

    function TipoCampo: TTipoCampo;

    function Valor: Variant;

    constructor Create(const ANome: String; const ATipoCampo: TTipoCampo; const AValor: Variant);
  end;

implementation

{ TFrameworkRegistroFiltros }

constructor TFrameworkRegistroFiltros.Create(const ANome: String;
  const ATipoCampo: TTipoCampo; const AValor: Variant);
begin
  FNome := ANome;
  FTipoCampo := ATipoCampo;
  FValor := AValor;
end;

function TFrameworkRegistroFiltros.Nome: String;
begin
  Result := FNome;
end;

function TFrameworkRegistroFiltros.TipoCampo: TTipoCampo;
begin
  Result := FTipoCampo;
end;

function TFrameworkRegistroFiltros.Valor: Variant;
begin
  Result := FValor;
end;

end.
