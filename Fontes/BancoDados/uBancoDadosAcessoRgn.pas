unit uBancoDadosAcessoRgn;

interface

uses
  System.Classes, System.IniFiles, System.SysUtils, Vcl.Forms, System.TypInfo,
  FireDAC.Comp.Client, FireDAC.Stan.Def, FireDAC.Phys, uBancoDadosDriverFactory,
  FireDAC.Comp.UI, uBancoDadosAcessoEnumerador;

type
  TBancoDadosAcessoRgn = class(TFDConnection)
  private
    oDriverLink: TFDPhysDriverLink;
    oWaitCursor: TFDGUIxWaitCursor;

    procedure LerCofiguracao;
  public
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

implementation

{ TBancoDadosAcessoRgn }


constructor TBancoDadosAcessoRgn.Create(AOwner: TComponent);
begin
  inherited;
  LerCofiguracao;
  oDriverLink := TBancoDadosDriverFactory.Get(TTipoBancoDados(GetEnumValue(TypeInfo(TTipoBancoDados), Params.DriverID)));
  oWaitCursor := TFDGUIxWaitCursor.Create(nil);
end;

destructor TBancoDadosAcessoRgn.Destroy;
begin
  if (Assigned(oDriverLink)) then
    FreeAndNil(oDriverLink);

  if (Assigned(oWaitCursor)) then
    FreeAndNil(oWaitCursor);

  inherited;
end;

procedure TBancoDadosAcessoRgn.LerCofiguracao;
var
  ArqIni: TIniFile;
begin
  ArqIni := TIniFile.Create(ExtractFilePath(Application.ExeName)+'config.ini');
  try
    LoginPrompt := False;
    Params.DriverID := ArqIni.ReadString('CONFIGURACAO', 'Driver', '');
    Params.Values['Server'] := ArqIni.ReadString('CONFIGURACAO', 'IPServidor', '');
    Params.Values['Port'] := ArqIni.ReadString('CONFIGURACAO', 'Porta', '');
    Params.Values['Database'] := ArqIni.ReadString('CONFIGURACAO', 'BancoDados', '');
    Params.Values['User_Name'] := ArqIni.ReadString('CONFIGURACAO', 'Usuario', '');
    Params.Values['Password'] := ArqIni.ReadString('CONFIGURACAO', 'Senha', '');
    Connected := True;
  finally
    ArqIni.Free;
  end;
end;

end.

