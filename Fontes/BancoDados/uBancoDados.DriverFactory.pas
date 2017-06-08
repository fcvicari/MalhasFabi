unit uBancoDados.DriverFactory;

interface

uses
  FireDAC.Phys, FireDAC.Phys.PG,
  uBancoDados.Enumerador;

type
  TBancoDadosDriverFactory = class
  public
    class function Get(ADriverName: TBancoDadosEnumerador): TFDPhysDriverLink;
  end;

implementation

{ TBancoDadosDriverFactory }

class function TBancoDadosDriverFactory.Get(ADriverName: TBancoDadosEnumerador): TFDPhysDriverLink;
begin
  Result := nil;
  if ADriverName = bdePG then
    Result := TFDPhysPgDriverLink.Create(nil);
end;

end.
