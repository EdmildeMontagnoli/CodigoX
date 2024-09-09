unit api_buscacep;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, bll_buscacep, Buttons, IdBaseComponent, IdComponent,
  IdTCPServer, IdCustomHTTPServer, IdHTTPServer;

type
  TfrmApiBuscaCEP = class(TForm)
    EditCEP: TEdit;
    ButtonConsultar: TBitBtn;
    MemoEndereco: TMemo;
    Label1: TLabel;
    lblResultado: TLabel;
    IdHTTPServer1: TIdHTTPServer;
    procedure FormShow(Sender: TObject);
    procedure ButtonConsultarClick(Sender: TObject);
  private
    { Private declarations }
    FController: TCEPController;
  public
    { Public declarations }
    constructor Create(AOwner: TComponent); override;
    destructor Destroy; override;
  end;

var
  frmApiBuscaCEP: TfrmApiBuscaCEP;

implementation

{$R *.dfm}

constructor TfrmApiBuscaCEP.Create(AOwner: TComponent);
begin
  inherited;
  FController := TCEPController.Create;
end;

destructor TfrmApiBuscaCEP.Destroy;
begin
  FController.Free;
  inherited;
end;

procedure TfrmApiBuscaCEP.ButtonConsultarClick(Sender: TObject);
var
  Endereco: string;
begin
  try
    Endereco := FController.BuscarEndereco(EditCEP.Text);
    if Length(Trim(Endereco)) > 0 then
    begin
      MemoEndereco.Lines.Text := Endereco;
    end
    else
    begin
      EditCEP.Text := '';
      EditCEP.setfocus();
      lblResultado.Caption := 'CEP não encontrado...'
    end;
  except
    on E: Exception do
      ShowMessage(E.Message);
  end;
end;

procedure TfrmApiBuscaCEP.FormShow(Sender: TObject);
begin
  lblResultado.Caption := 'Digite um CEP para iniciar a procura...'
end;

end.
