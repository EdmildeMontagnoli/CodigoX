program api_busca_cep;

uses
  Forms,
  api_buscacep in 'api_buscacep.pas' {frmApiBuscaCEP},
  bll_buscacep in 'api\Bll\bll_buscacep.pas',
  mdl_buscacep in 'api\Mdl\mdl_buscacep.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.CreateForm(TfrmApiBuscaCEP, frmApiBuscaCEP);
  Application.Run;
end.
