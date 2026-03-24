unit ConsultarCSOSNForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSOSNDM;

type
  TConsultarCSOSN = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSOSN: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSOSNClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CSOSNCSOSN: string;
    CSOSNModo: string;
    CSOSNDescricao: string;
  public
    function SelecionarCSOSN: String;
    function Descricao: String;
    function Modo: String;
  end;

var
  ConsultarCSOSN: TConsultarCSOSN;

implementation

{$R *.dfm}

function TConsultarCSOSN.SelecionarCSOSN: string;
begin
  CSOSNCSOSN := '';
  ShowModal;
  Result := CSOSNCSOSN;
end;

function TConsultarCSOSN.Descricao: string;
begin
  Result := CSOSNDescricao;
end;

procedure TConsultarCSOSN.FormShow(Sender: TObject);
var i: integer;
begin
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

function TConsultarCSOSN.Modo: string;
begin
  Result := CSOSNModo;
end;

procedure TConsultarCSOSN.btnSelecionarCSOSNClick(Sender: TObject);
begin
 CSOSNCSOSN := CadCSOSNDM.qryConsultarCSOSN.FieldByName('CSOSN').AsString;
 CSOSNDescricao := CadCSOSNDM.qryConsultarCSOSN.FieldByName('Descricao').AsString;
 close;
end;
end.
