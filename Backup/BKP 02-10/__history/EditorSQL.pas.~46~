unit EditorSQL;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB, Vcl.Grids, Vcl.DBGrids, Vcl.ComCtrls,
  EditorSQLFormDM,
  Log, LogDM,
  GlobalUnit;

type
  TEditorSQLForm = class(TForm)
    Panel1: TPanel;
    EdtSQL: TEdit;
    btnExecutar: TButton;
    btnConsultar: TButton;
    Grid: TDBGrid;
    GridTables: TDBGrid;
    btnFechar: TButton;
    procedure btnConsultarClick(Sender: TObject);
    procedure btnExecutarClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EditorSQLForm: TEditorSQLForm;

implementation

{$R *.dfm}

uses MenuPrincipal;

procedure TEditorSQLForm.btnConsultarClick(Sender: TObject);
var SQL: string;
    i: Integer;
begin
 SQL := EdtSQL.Text;

 if EdtSQL.Text = '' then begin
 ShowMessage('Nenhum comando informado!');
 end
 else begin

 EditorSQLDM.SelectQuery.SQL.Clear;
 EditorSQLDM.SelectQuery.Close;
 EditorSQLDM.SelectQuery.SQL.Text := EdtSQL.Text;
 EditorSQLDM.SelectQuery.Open;

 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
 LogsDM.InserirLog.ParamByName('descricao').AsString :=
 'Fez o select ' + SQL;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'EditorSQL';
 LogsDM.InserirLog.ParamByName('data').AsDatetime := Now;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ExecSQL;

 EditorSQLDM.TablesBanco.Close;
 EditorSQLDM.TablesBanco.Open;
end;
end;

procedure TEditorSQLForm.btnExecutarClick(Sender: TObject);
var SQL: string;
    i: Integer;
begin
 SQL := EdtSQL.Text;

 if EdtSQL.Text = '' then begin
 ShowMessage('Nenhum comando informado!');
 end
 else begin

 EditorSQLDM.SelectQuery.SQL.Clear;
 EditorSQLDM.SelectQuery.SQL.Text := EdtSQL.Text;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (descricao, tela, data, emp_id, usuario) values (:descricao, :tela, :data, :emp_id, :usuario)';
 LogsDM.InserirLog.ParamByName('descricao').AsString :=
 'Rodou o comando ' + SQL;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'EditorSQL';
 LogsDM.InserirLog.ParamByName('data').AsDatetime := Now;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 try
 EditorSQLDM.SelectQuery.ExecSQL;
 LogsDM.InserirLog.ExecSQL;
 showmessage('Executado com sucesso!');
 except
 showmessage('Erro no SQL, verifique!');
 end;

  for i := 0 to Grid.Columns.Count - 1 do
    Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

    EditorSQLDM.TablesBanco.Close;
    EditorSQLDM.TablesBanco.Open;
end;
end;

procedure TEditorSQLForm.btnFecharClick(Sender: TObject);
begin
 Fechartela(sender);
end;
end.
