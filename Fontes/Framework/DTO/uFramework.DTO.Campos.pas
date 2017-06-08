unit uFramework.DTO.Campos;

interface

uses
  System.Variants,
  uFramework.TipoCampoEnumerador,
  uFramework.DTO.CamposInterface;

type
  TFrameworkDTOCampos = class(TInterfacedObject, IFrameworkDTOCamposInterface)
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

    constructor Create(const ANome: String; const ATipoCampo: TTipoCampo;
      const AChave: Boolean; const ADefault: Variant);
  end;

implementation

{ TDTOCampos }

function TFrameworkDTOCampos.Chave: Boolean;
begin
  Result := FChave;
end;

constructor TFrameworkDTOCampos.Create(const ANome: String; const ATipoCampo: TTipoCampo;
  const AChave: Boolean; const ADefault: Variant);
begin
  FNome := ANome;
  FTipoCampo := ATipoCampo;
  FChave := AChave;
  FValorDefault := ADefault;

  Limpar;
end;

function TFrameworkDTOCampos.GetValorAnterior: Variant;
begin
  Result := FValorAnterior;
end;

function TFrameworkDTOCampos.GetValorAtual: Variant;
begin
  Result := FValorAtual;
end;

procedure TFrameworkDTOCampos.Limpar;
begin
  FValorAnterior := null;
  FValorAtual := null;
end;

function TFrameworkDTOCampos.Modificado: Boolean;
begin
  Result := (FValorAtual <> FValorAnterior);
end;

function TFrameworkDTOCampos.Nome: String;
begin
  Result := FNome;
end;

procedure TFrameworkDTOCampos.SetValorAnterior(AValor: Variant);
begin
  FValorAnterior := AValor;
end;

procedure TFrameworkDTOCampos.SetValorAtual(AValor: Variant);
begin
  FValorAtual := AValor;
end;

function TFrameworkDTOCampos.TipoCampo: TTipoCampo;
begin
  Result := FTipoCampo;
end;

function TFrameworkDTOCampos.ValorDefault: Variant;
begin
  Result := FValorDefault;
end;

end.
