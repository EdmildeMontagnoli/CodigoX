unit mdl_buscacep;

interface

uses
  SysUtils, IdHTTP, Classes, IdSSLOpenSSL;

type
  TCEPModel = class
  private
    FIdHTTP: TIdHTTP;
    FSSLHandler: TIdSSLIOHandlerSocketOpenSSL;
    function ConsultaViaCEP(CEP: string): string;
    function ConsultaApiCEP(CEP: string): string;
    function ConsultaAwesomeAPI(CEP: string): string;
  public
    constructor Create;
    destructor Destroy; override;
    function ConsultarCEP(CEP: string): string;
  end;

implementation

constructor TCEPModel.Create;
begin
  FIdHTTP := TIdHTTP.Create(nil);
  FSSLHandler := TIdSSLIOHandlerSocketOpenSSL.Create(nil);
  FIdHTTP.IOHandler := FSSLHandler;
  FIdHTTP.Request.ContentType := 'application/json';
end;

destructor TCEPModel.Destroy;
begin
  FIdHTTP.Free;
  FSSLHandler.Free;
  inherited;
end;

function TCEPModel.ConsultaViaCEP(CEP: string): string;
begin
  try
    Result := FIdHTTP.Get('https://viacep.com.br/ws/' + CEP + '/json/');
  except
    Result := '';
  end;
end;

function TCEPModel.ConsultaApiCEP(CEP: string): string;
begin
  try
    Result := FIdHTTP.Get('https://ws.apicep.com/cep/' + CEP + '.json');
  except
    Result := '';
  end;
end;

function TCEPModel.ConsultaAwesomeAPI(CEP: string): string;
begin
  try
    Result := FIdHTTP.Get('https://cep.awesomeapi.com.br/json/' + CEP);
  except
    Result := '';
  end;
end;

function TCEPModel.ConsultarCEP(CEP: string): string;
begin
  Result := ConsultaViaCEP(CEP);
  if Result = '' then
    Result := ConsultaApiCEP(CEP);
  if Result = '' then
    Result := ConsultaAwesomeAPI(CEP);
end;

end.

