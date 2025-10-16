unit ConsultarMoedaForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.StdCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.ExtCtrls,
  MoedaDM;

type
  TConsultarMoeda = class(TForm)
    Panel1: TPanel;
    Grid: TDBGrid;
    BtnSelecionarMoeda: TButton;
    procedure BtnSelecionarMoedaClick(Sender: TObject);
  private
    MoedaCodigo: string;
  public
    function SelecionarMoeda: string;
    function codigo: string;
  end;

var
  ConsultarMoeda: TConsultarMoeda;

implementation

{$R *.dfm}

function TConsultarMoeda.SelecionarMoeda: string;
begin
  MoedaCodigo := '';
  ShowModal;
  Result := MoedaCodigo;
end;

function TConsultarMoeda.codigo: string;
begin
  Result := MoedaCodigo;
end;

procedure TConsultarMoeda.BtnSelecionarMoedaClick(Sender: TObject);
begin
  MoedaCodigo := CadMoedaDM.ConsultarMoeda.FieldByName('codigo').AsString;
  Close;
end;
end.
