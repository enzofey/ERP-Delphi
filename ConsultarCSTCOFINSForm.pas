unit ConsultarCSTCOFINSForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTCOFINSDM;

type
  TConsultarCSTCOFINS = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTCOFINS: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTCOFINSClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    CofinsCST: string;
    CofinsCSTDescricao: string;
  public
    function SelecionarCofinsCST: string;
    function descricao: string;
  end;

var
  ConsultarCSTCOFINS: TConsultarCSTCOFINS;

implementation

{$R *.dfm}

function TConsultarCSTCOFINS.SelecionarCofinsCST: string;
begin
 CofinsCST := '';
 ShowModal;
 Result := CofinsCST;
end;

function TConsultarCSTCOFINS.Descricao: string;
begin
 Result := CofinsCSTDescricao;
end;

procedure TConsultarCSTCOFINS.FormShow(Sender: TObject);
var i: integer;
begin
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TConsultarCSTCOFINS.btnSelecionarCSTCOFINSClick(Sender: TObject);
begin
  CofinsCST := CadCSTCOFINSDM.ConsultarCSTCOFINS.FieldByName('CST').AsString;
  CofinsCSTDescricao := CadCSTCOFINSDM.ConsultarCSTCOFINS.FieldByName('descricao').AsString;
  Close;
end;
end.
