unit uFramework.Conversao;

interface

uses
  System.SysUtils,
  uFramework.TipoCampoEnumerador;

type
  TFrameworkConversao = class
    class function VarToDateTime(Value: Variant): TDateTime;

    class function VarToInteger(Value: Variant): Integer;

    class function VarToDouble(Value: Variant): Double;

    class function VarToSql(ATipo: TTipoCampo; AValue: Variant): String;
  end;

implementation

{ TConversao }

class function TFrameworkConversao.VarToDateTime(Value: Variant): TDateTime;
begin
  try
    Result := StrToDate(Value);
  except
    Result := 0;
  end;
end;

class function TFrameworkConversao.VarToDouble(Value: Variant): Double;
begin
  try
    Result := StrToFloat(Value);
  except
    Result := 0;
  end;
end;

class function TFrameworkConversao.VarToInteger(Value: Variant): Integer;
begin
  try
    Result := StrToInt64(Value);
  except
    Result := 0;
  end;
end;

class function TFrameworkConversao.VarToSql(ATipo: TTipoCampo; AValue: Variant): String;
begin
  case ATipo of
    tcInteiro, tcNumerico: Result := AValue;
    tcData: Result := QuotedStr(FormatDateTime('dd.mm.yyyy', AValue));
  else
    Result := QuotedStr(AValue)
  end;
end;

end.
