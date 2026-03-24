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
    procedure FormShow(Sender: TObject);
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

procedure TEditorSQLForm.FormShow(Sender: TObject);
begin
 EditorSQLDM.TablesBanco.Close;
 EditorSQLDM.TablesBanco.Open;
end;

procedure TEditorSQLForm.btnConsultarClick(Sender: TObject);
var i: Integer;
begin
 if EdtSQL.Text = '' then begin
  ShowMessage('Nenhum comando informado!');
  Abort;
 end;

 with EditorSQLDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Text := EdtSQL.Text;
  Open;
 end;

 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 with LogsDM.InserirLog do
 begin
  SQL.Clear;
  SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
  SQL.Add('values');
  SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
  ParamByName('descricao').AsString :=
  'Fez o select ' + EdtSQL.Text;
  ParamByName('tela').AsString := 'EditorSQL';
  ParamByName('data').AsDatetime := Now;
  ParamByName('usuario').AsString := UsuarioLogado;
  ParamByName('emp_id').AsString := EmpresaLogada;
  ExecSQL;
 end;

 EditorSQLDM.TablesBanco.Close;
 EditorSQLDM.TablesBanco.Open;
end;

procedure TEditorSQLForm.btnExecutarClick(Sender: TObject);
var i: Integer;
begin

 if EdtSQL.Text = '' then begin
  ShowMessage('Nenhum comando informado!');
  Abort;
 end;

 with EditorSQLDM.qryExec do
 begin
  SQL.Clear;
  SQL.Add(EdtSQL.Text);
  ExecSQL;
 end;

 EditorSQLDM.Conexão.StartTransaction;
 try
  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, emp_id, usuario)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :emp_id, :usuario)');
   ParamByName('descricao').AsString :=
   'Rodou o comando ' + EdtSQL.Text;
   ParamByName('tela').AsString := 'EditorSQL';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  EditorSQLDM.Conexão.Commit;
  ShowMessage('Executado com sucesso!');
 except
  EditorSQLDM.Conexão.Rollback;
  ShowMessage('Erro no SQL, verifique!');
 end;

 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EditorSQLDM.TablesBanco.Close;
 EditorSQLDM.TablesBanco.Open;
end;

procedure TEditorSQLForm.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
