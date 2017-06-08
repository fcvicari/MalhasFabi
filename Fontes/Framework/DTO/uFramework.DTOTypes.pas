unit uFramework.DTOTypes;

interface

uses
  Generics.Collections,
  uFramework.DTO.CamposInterface;

type
  TFrameworkDTODicionario = TObjectDictionary<String, IFrameworkDTOCamposInterface>;

implementation

end.
