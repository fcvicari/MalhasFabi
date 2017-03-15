unit uBancoDadosDriverFactory;

interface

uses
  uBancoDadosAcessoEnumerador, FireDAC.Phys, FireDAC.Phys.PG;

type
  TBancoDadosDriverFactory = class
  public
    class function Get(ADriverName: TTipoBancoDados): TFDPhysDriverLink;
  end;

implementation

{ TBancoDadosDriverFactory }

class function TBancoDadosDriverFactory.Get(ADriverName: TTipoBancoDados): TFDPhysDriverLink;
begin
  Result := nil;
  if ADriverName = bdPG then
    Result := TFDPhysPgDriverLink.Create(nil);
end;

end.
