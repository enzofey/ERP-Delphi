unit Log;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Vcl.ComCtrls,
  Data.DB, Vcl.Grids, Vcl.DBGrids,
  LogDM, GlobalUnit;

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

 with LogsDM.ConsultarLogs do
 begin
  SQL.Clear;
  SQL.Add('select * from logs where data between :datainicio and :datafinal');
  ParamByName('datainicio').AsDatetime := datainicio;
  ParamByName('datafinal').AsDatetime := datafinal;

  if descricao <> '' then begin
   SQL.Add(' and descricao like :descricao');
   ParamByName('descricao').AsString := '%' + descricao + '%';
  end;

  if tela <> '' then begin
   SQL.Add(' and tela like :tela');
   ParamByName('tela').AsString := '%' + tela + '%';
  end;

  if usuario <> '' then begin
   SQL.Add(' and usuario like :usuario');
   ParamByName('usuario').AsString := '%' + usuario + '%';
  end;

  if EMP_ID <> '' then begin
   SQL.Add(' and emp_id like :emp_id');
   ParamByName('emp_id').AsString := '%' + emp_id + '%';
  end;
  SQL.Add('order by data');

  for i := 0 to Grid.Columns.Count - 1 do
   Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '                     ');
 end;
end;

procedure TLogsForm.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
