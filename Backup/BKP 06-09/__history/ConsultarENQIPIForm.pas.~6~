unit ConsultarENQIPIForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  ENQIPIDataModule;

type
  TConsultarENQIPI = class(TForm)
    Panel1: TPanel;
    btnSelecionarENQIPI: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarENQIPIClick(Sender: TObject);
  private
    EnqIPI: String;
  public
    function SelecionarEnqIPI: string;
  end;

var
  ConsultarENQIPI: TConsultarENQIPI;

implementation

{$R *.dfm}

function TConsultarENQIPI.SelecionarEnqIPI: string;
begin
 EnqIPI := '';
 ShowModal;
 Result := EnqIPI;
end;

procedure TConsultarENQIPI.btnSelecionarENQIPIClick(Sender: TObject);
begin
 EnqIPI := CadEnqIPIDataModule.GridQuery.FieldByName('CST').AsString;
 Close;
end;
end.
