unit uBancoDadosAcessoSingleton;

interface

uses
  uBancoDadosAcessoRgn, System.SysUtils;

type
  TBancoDadosAcessoSingleton = class
  private
    class var oConexao: TBancoDadosAcessoRgn;
  public
    class function GetInstance: TBancoDadosAcessoRgn;
  end;

implementation

{ TBancoDadosAcessoSingleton }

class function TBancoDadosAcessoSingleton.GetInstance: TBancoDadosAcessoRgn;
begin
  if (not(Assigned(oConexao))) then
    oConexao := TBancoDadosAcessoRgn.Create(nil);

  Result := oConexao;
end;

initialization

finalization
  if (Assigned(TBancoDadosAcessoSingleton.oConexao)) then
    FreeAndNil(TBancoDadosAcessoSingleton.oConexao);

end.

