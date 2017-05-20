unit uDTOCampos;

interface

uses
  System.Variants,
  uDTOCamposEnumerador,
  uDTOCamposInterface;

type
  TDTOCampos = class(TInterfacedObject, IDTOCamposInterface)
  private
    FNome: String;
    FTipoCampo : TTipoCampo;
    FValorAnterior: Variant;
    FValorAtual: Variant;
    FChave: Boolean;
    FValorDefault: Variant;

    function GetValorAtual: Variant;
    procedure SetValorAtual(AValor: Variant);

    function GetValorAnterior: Variant;
    procedure SetValorAnterior(AValor: Variant);
  public
    function Nome: String;

    function Modificado: Boolean;

    function TipoCampo: TTipoCampo;

    function Chave: Boolean;

    function ValorDefault: Variant;

    procedure Limpar;

    Constructor Create(const ANome: String; const ATipoCampo: TTipoCampo;
      const AChave: Boolean; const ADefault: Variant);
  end;

implementation

{ TDTOCampos }

function TDTOCampos.Chave: Boolean;
begin
  Result := FChave;
end;

constructor TDTOCampos.Create(const ANome: String; const ATipoCampo: TTipoCampo;
  const AChave: Boolean; const ADefault: Variant);
begin
  FNome := ANome;
  FTipoCampo := ATipoCampo;
  FChave := AChave;
  FValorDefault := ADefault;

  Limpar;
end;

function TDTOCampos.GetValorAnterior: Variant;
begin
  Result := FValorAnterior;
end;

function TDTOCampos.GetValorAtual: Variant;
begin
  Result := FValorAtual;
end;

procedure TDTOCampos.Limpar;
begin
  FValorAnterior := null;
  FValorAtual := null;
end;

function TDTOCampos.Modificado: Boolean;
begin
  Result := (FValorAtual <> FValorAnterior);
end;

function TDTOCampos.Nome: String;
begin
  Result := FNome;
end;

procedure TDTOCampos.SetValorAnterior(AValor: Variant);
begin
  FValorAnterior := AValor;
end;

procedure TDTOCampos.SetValorAtual(AValor: Variant);
begin
  FValorAtual := AValor;
end;

function TDTOCampos.TipoCampo: TTipoCampo;
begin
  Result := FTipoCampo;
end;

function TDTOCampos.ValorDefault: Variant;
begin
  Result := FValorDefault;
end;

end.
