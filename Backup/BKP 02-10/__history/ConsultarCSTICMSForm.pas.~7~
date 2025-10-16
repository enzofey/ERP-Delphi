unit ConsultarCSTICMSForm;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.Grids, Vcl.DBGrids,
  Vcl.StdCtrls, Vcl.ExtCtrls,
  CSTICMSDataModule;

type
  TConsultarCSTICMS = class(TForm)
    Panel1: TPanel;
    btnSelecionarCSTICMS: TButton;
    Grid: TDBGrid;
    procedure btnSelecionarCSTICMSClick(Sender: TObject);
  private
    IcmsCST: string;
  public
    function SelecionarIcmsCST: string;
  end;

var
  ConsultarCSTICMS: TConsultarCSTICMS;

implementation

{$R *.dfm}

function TConsultarCSTICMS.SelecionarIcmsCST: string;
begin
  IcmsCST := '';
  ShowModal;
  Result := IcmsCST;
end;

procedure TConsultarCSTICMS.btnSelecionarCSTICMSClick(Sender: TObject);
begin
 IcmsCST := CadCSTICMSDataModule.GridQuery.FieldByName('CST').AsString;
 close;
end;
end.
