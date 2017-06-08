unit uFramework.DTO;

interface

uses
  Generics.Collections,
  uFramework.DTOTypes,
  uFramework.DTO.CamposInterface,
  uFramework.DTO.Campos,
  uFramework.TipoCampoEnumerador,
  uFramework.DTOInterface;

type
  TDTO = class(TInterfacedObject, IFrameworkDTOInterface)
  private
    FTabela: String;
    FListaCampos: TFrameworkDTODicionario;
  public
    function Tabela: String;

    function ListaCampos: TFrameworkDTODicionario;

    function BuscarCampo(ACampo: String): IFrameworkDTOCamposInterface;

    procedure AdicionarCampo(const ANome: String; const ATipoCampo: TTipoCampo;
      const AChave: Boolean; const ADefault: Variant);

    constructor Create(ATabela: String);
    destructor Destroy; override;
  end;

implementation

{ TDTO }

procedure TDTO.AdicionarCampo(const ANome: String; const ATipoCampo: TTipoCampo;
  const AChave: Boolean; const ADefault: Variant);
var
  oCampo: TFrameworkDTOCampos;
begin
  oCampo := TFrameworkDTOCampos.Create(ANome, ATipoCampo, AChave, ADefault);
  FListaCampos.Add(ANome, oCampo);
end;

function TDTO.BuscarCampo(ACampo: String): IFrameworkDTOCamposInterface;
begin
  Result := FListaCampos[ACampo];
end;

constructor TDTO.Create(ATabela: String);
begin
  FTabela := ATabela;
  FListaCampos := TFrameworkDTODicionario.Create([doOwnsValues]);
end;

destructor TDTO.Destroy;
begin
  FListaCampos.Free;
  inherited;
end;

function TDTO.ListaCampos: TFrameworkDTODicionario;
begin
  Result := FListaCampos;
end;

function TDTO.Tabela: String;
begin
  Result := FTabela;
end;

end.
