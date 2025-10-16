unit ConsultarCSTPISForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTPISDataModule;

type
  TConsultarCSTPIS = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTPIS: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTPISClick(Sender: TObject);
  private
    PisCST: string;
  public
    function SelecionarPisCST: string;
  end;

var
  ConsultarCSTPIS: TConsultarCSTPIS;

implementation

{$R *.dfm}

function TConsultarCSTPIS.SelecionarPisCST: string;
begin
  PisCST := '';
  ShowModal;
  Result := PisCST;
end;

procedure TConsultarCSTPIS.btnSelecionarCSTPISClick(Sender: TObject);
begin
 PisCST := CadCSTPISDataModule.ConsultarCSTPIS.FieldByName('CST').AsString;
 Close;
end;
end.
