unit uDTO;

interface

uses
  Generics.Collections,
  uDTOTypes,
  uDTOCamposInterface,
  uDTOCampos,
  uDtoCamposEnumerador,
  uDTOInterface;

type
  TDTO = class(TInterfacedObject, IDTOInterface)
  private
    FTabela: String;
    FListaCampos: TDicionarioDTO;
  public
    function Tabela: String;

    function ListaCampos: TDicionarioDTO;

    function BuscarCampo(ACampo: String): IDTOCamposInterface;

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
  oCampo: TDTOCampos;
begin
  oCampo := TDTOCampos.Create(ANome, ATipoCampo, AChave, ADefault);
  FListaCampos.Add(ANome, oCampo);
end;

function TDTO.BuscarCampo(ACampo: String): IDTOCamposInterface;
begin
  Result := FListaCampos[ACampo];
end;

constructor TDTO.Create(ATabela: String);
begin
  FTabela := ATabela;
  FListaCampos := TDicionarioDTO.Create([doOwnsValues]);
end;

destructor TDTO.Destroy;
begin
  FListaCampos.Free;
  inherited;
end;

function TDTO.ListaCampos: TDicionarioDTO;
begin
  Result := FListaCampos;
end;

function TDTO.Tabela: String;
begin
  Result := FTabela;
end;

end.
