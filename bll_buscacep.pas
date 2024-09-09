unit bll_buscacep;

interface

uses
  mdl_buscacep, SysUtils;

type
  TCEPController = class
  private
    FModel: TCEPModel;
  public
    constructor Create;
    destructor Destroy; override;
    function BuscarEndereco(CEP: string): string;
  end;

implementation

constructor TCEPController.Create;
begin
  FModel := TCEPModel.Create;
end;

destructor TCEPController.Destroy;
begin
  FModel.Free;
  inherited;
end;

function TCEPController.BuscarEndereco(CEP: string): string;
begin
  if Length(CEP) <> 8 then
    raise Exception.Create('CEP inv�lido');
    
  Result := FModel.ConsultarCEP(CEP);
  
  if Result = '' then
    raise Exception.Create('N�o foi poss�vel encontrar o endere�o.');
end;

end.

