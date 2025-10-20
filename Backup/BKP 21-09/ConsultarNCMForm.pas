unit ConsultarNCMForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  NCMDM;

type
  TConsultarNCM = class(TForm)
    Panel1: TPanel;
    btnSelecionarNCM: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarNCMClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    NCMCodigo: String;
    NCMNCM: String;
    NCMDescricao: String;
  public
    function SelecionarNCM: string;
    function Codigo: string;
    function NCM: String;
    function Descricao: String;
  end;

var
  ConsultarNCM: TConsultarNCM;

implementation

{$R *.dfm}

procedure TConsultarNCM.btnSelecionarNCMClick(Sender: TObject);
begin
  NCMCodigo := CadNCMDM.ConsultarNCM.FieldByName('Codigo').AsString;
  NCMNCM := CadNCMDM.ConsultarNCM.FieldByName('NCM').AsString;
  Close;
end;

function TConsultarNCM.SelecionarNCM: string;
begin
 NCMCodigo := '';
 ShowModal;
 Result := NCMCodigo;
end;

function TConsultarNCM.Codigo: string;
begin
  Result := NCMCodigo;
end;

function TConsultarNCM.NCM: string;
begin
  Result := NCMNCM;
end;

function TConsultarNCM.Descricao: string;
begin
  Result := NCMDescricao;
end;

procedure TConsultarNCM.FormShow(Sender: TObject);
var i: integer;
begin
   for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
 end;
end.
