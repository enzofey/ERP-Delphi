unit Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids,
  LogDataModule;

type
  TLogsForm = class(TForm)
    Panel1: TPanel;
    DTPInicio: TDateTimePicker;
    DTPFinal: TDateTimePicker;
    lblInicio: TLabel;
    lblFinal: TLabel;
    btnConsultar: TButton;
    Grid: TDBGrid;
    btnFechar: TButton;
    lblDescricao: TLabel;
    EdtDescricao: TEdit;
    lblTela: TLabel;
    EdtTela: TEdit;
    lblEMP_ID: TLabel;
    lblUsuario: TLabel;
    EdtUsuario: TEdit;
    EdtEMP_ID: TEdit;
    procedure btnFecharClick(Sender: TObject);
    procedure btnConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  LogsForm: TLogsForm;

implementation

{$R *.dfm}

Uses MenuPrincipal;

procedure TLogsForm.btnConsultarClick(Sender: TObject);
var I: integer;
    descricao, tela, emp_id, usuario: string;
    datainicio: tdatetime;
    datafinal: tdatetime;
begin

 descricao := edtDescricao.Text;
 datainicio := DTPInicio.Datetime;
 datafinal := DTPFinal.Datetime;
 tela := EdtTela.Text;
 usuario := EdtUsuario.Text;
 emp_id := EdtEMP_ID.Text;

 LogModule.FDQuery1.SQL.Clear;
 LogModule.FDQuery1.Close;
 LogModule.FDQuery1.SQL.Text :=
 'select * from logs where data between :datainicio and :datafinal';
 LogModule.FDQuery1.ParamByName('datainicio').AsDatetime := datainicio;
 LogModule.FDQuery1.ParamByName('datafinal').AsDatetime := datafinal;

 if EdtDescricao.Text <> '' then begin
 LogModule.FDQuery1.SQL.Add(' and descricao like :descricao');
 LogModule.FDQuery1.ParamByName('descricao').AsString := '%' + descricao + '%';
 LogModule.FDQuery1.Open;
 end
 else begin
 LogModule.FDQuery1.Open;
 end;

 if EdtTela.Text <> '' then begin
 LogModule.FDQuery1.SQL.Add(' and tela like :tela');
 LogModule.FDQuery1.ParamByName('tela').AsString := '%' + tela + '%';
 LogModule.FDQuery1.Open;
 end
 else begin
 LogModule.FDQuery1.Open;
 end;

 if EdtUsuario.Text <> '' then begin
 LogModule.FDQuery1.SQL.Add(' and usuario like :usuario');
 LogModule.FDQuery1.ParamByName('usuario').AsString := '%' + usuario + '%';
 LogModule.FDQuery1.Open;
 end
 else begin
 LogModule.FDQuery1.Open;
 end;

 if EdtEMP_ID.Text <> '' then begin
 LogModule.FDQuery1.SQL.Add(' and emp_id like :emp_id');
 LogModule.FDQuery1.ParamByName('emp_id').AsString := '%' + emp_id + '%';
 LogModule.FDQuery1.Open;
 end
 else begin
 LogModule.FDQuery1.Open;
 end;

 for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '                     ');
end;

procedure TLogsForm.btnFecharClick(Sender: TObject);
begin
    (Parent as TTabSheet).PageControl := nil;
    Parent.Free;
end;
end.
