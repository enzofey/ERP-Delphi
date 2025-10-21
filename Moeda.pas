unit Moeda;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids,
  MoedaDM,
  GlobalUnit,
  LogDM, Vcl.ComCtrls;

type
  TCadMoeda = class(TForm)
    Pages: TPageControl;
    CadastroPage: TTabSheet;
    btnAlterar: TButton;
    btnDesistir: TButton;
    btnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    CBAtivo: TCheckBox;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    Grid: TDBGrid;
    lblAtivo: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblCondPagto: TLabel;
    CBCondPagto: TComboBox;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadMoeda: TCadMoeda;

implementation

{$R *.dfm}

procedure TCadMoeda.FormShow(Sender: TObject);
var I: integer;
begin
 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadMoeda.GridCellClick(Column: TColumn);
begin
 with CadMoedaDM.qryConsultarMoeda do
 begin
  if FieldByName('CondPagto').AsString = '01' then CBCondPagto.ItemIndex := 0;
  if FieldByName('CondPagto').AsString = '02' then CBCondPagto.ItemIndex := 1;
  if FieldByName('CondPagto').AsString = '03' then CBCondPagto.ItemIndex := 2;
  if FieldByName('CondPagto').AsString = '04' then CBCondPagto.ItemIndex := 3;
  if FieldByName('CondPagto').AsString = '05' then CBCondPagto.ItemIndex := 4;
  if FieldByName('CondPagto').AsString = '10' then CBCondPagto.ItemIndex := 5;
  if FieldByName('CondPagto').AsString = '11' then CBCondPagto.ItemIndex := 6;
  if FieldByName('CondPagto').AsString = '12' then CBCondPagto.ItemIndex := 7;
  if FieldByName('CondPagto').AsString = '13' then CBCondPagto.ItemIndex := 8;
  if FieldByName('CondPagto').AsString = '14' then CBCondPagto.ItemIndex := 9;
  if FieldByName('CondPagto').AsString = '15' then CBCondPagto.ItemIndex := 10;
  if FieldByName('CondPagto').AsString = '16' then CBCondPagto.ItemIndex := 11;
  if FieldByName('CondPagto').AsString = '17' then CBCondPagto.ItemIndex := 12;
  if FieldByName('CondPagto').AsString = '18' then CBCondPagto.ItemIndex := 13;
  if FieldByName('CondPagto').AsString = '19' then CBCondPagto.ItemIndex := 14;
  if FieldByName('CondPagto').AsString = '90' then CBCondPagto.ItemIndex := 15;
  if FieldByName('CondPagto').AsString = '99' then CBCondPagto.ItemIndex := 16;

  EdtCodigo.Text := FieldByName('codigo').AsString;
  EdtDescricao.Text := FieldByName('descricao').AsString;
  CBAtivo.Checked := FieldByName('ativo').AsString = 'S';
 end;
end;

procedure TCadMoeda.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCodigo.Enabled := True;
 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;
 CBCondPagto.Enabled := True;

 EdtCodigo.Clear;
 EdtDescricao.Clear;

 btnIncluir.Visible := False;
 btnFechar.Visible := False;
 btnExcluir.Visible := False;
 btnAlterar.Visible := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadMoeda.btnGravarIncluirClick(Sender: TObject);
var codigo, descricao, ativo, CondPagto: string;
    I: Integer;
begin
 codigo := EdtCodigo.Text;
 Descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CBCondPagto.ItemIndex = 0 then CondPagto := '01';
 if CBCondPagto.ItemIndex = 1 then CondPagto := '02';
 if CBCondPagto.ItemIndex = 2 then CondPagto := '03';
 if CBCondPagto.ItemIndex = 3 then CondPagto := '04';
 if CBCondPagto.ItemIndex = 4 then CondPagto := '05';
 if CBCondPagto.ItemIndex = 5 then CondPagto := '10';
 if CBCondPagto.ItemIndex = 6 then CondPagto := '11';
 if CBCondPagto.ItemIndex = 7 then CondPagto := '12';
 if CBCondPagto.ItemIndex = 8 then CondPagto := '13';
 if CBCondPagto.ItemIndex = 9 then CondPagto := '14';
 if CBCondPagto.ItemIndex = 10 then CondPagto := '15';
 if CBCondPagto.ItemIndex = 11 then CondPagto := '16';
 if CBCondPagto.ItemIndex = 12 then CondPagto := '17';
 if CBCondPagto.ItemIndex = 13 then CondPagto := '18';
 if CBCondPagto.ItemIndex = 14 then CondPagto := '19';
 if CBCondPagto.ItemIndex = 15 then CondPagto := '90';
 if CBCondPagto.ItemIndex = 16 then CondPagto := '99';

 with CadMoedaDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda where codigo = :codigo');
  ParamByName('codigo').AsString := codigo;
  Open;

  if not IsEmpty then begin
   ShowMessage('Moeda já cadastrada!');
   Abort;
  end;
 end;

 CadMoedaDM.Conexão.StartTransaction;
 try
  with CadMoedaDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadmoeda (codigo, descricao, ativo, condpagto)');
   SQL.Add('values');
   SQL.Add('(:codigo, :descricao, :ativo, :condpagto)');
   ParamByName('codigo').AsString := codigo;
   ParamByName('descricao').AsString := Descricao;
   ParamByName('ativo').AsString := ativo;
   ParamByName('condpagto').AsString := condpagto;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Inseriu a moeda ' + codigo + ' - ' + descricao + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadMoeda';
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('data').AsDateTime := Now;
   ExecSQL;
  end;

  CadMoedaDM.Conexão.Commit;
  ShowMessage('Cadastrado com sucesso!');
  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;
  CBCondPagto.Enabled := False;

  btnIncluir.Visible := True;
  btnFechar.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;

  btnGravarIncluir.Visible := False;
  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  with CadMoedaDM.qryConsultarMoeda do
  begin
   SQL.Clear;
   SQL.Add('select * from cadmoeda');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
 except
 CadMoedaDM.Conexão.Rollback;
 ShowMessage('Erro na gravação!');
 end;
end;

procedure TCadMoeda.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCodigo.Text = '' then begin
  ShowMessage('Nenhuma moeda selecionada!');
  Abort;
 end;

 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;
 CBCondPagto.Enabled := True;

 btnIncluir.Visible := False;
 btnFechar.Visible := False;
 btnExcluir.Visible := False;
 btnAlterar.Visible := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;

 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadMoeda.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo, condpagto: string;
    I: integer;
begin
 codigo := EdtCodigo.Text;
 Descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CBCondPagto.ItemIndex = 0 then CondPagto := '01';
 if CBCondPagto.ItemIndex = 1 then CondPagto := '02';
 if CBCondPagto.ItemIndex = 2 then CondPagto := '03';
 if CBCondPagto.ItemIndex = 3 then CondPagto := '04';
 if CBCondPagto.ItemIndex = 4 then CondPagto := '05';
 if CBCondPagto.ItemIndex = 5 then CondPagto := '10';
 if CBCondPagto.ItemIndex = 6 then CondPagto := '11';
 if CBCondPagto.ItemIndex = 7 then CondPagto := '12';
 if CBCondPagto.ItemIndex = 8 then CondPagto := '13';
 if CBCondPagto.ItemIndex = 9 then CondPagto := '14';
 if CBCondPagto.ItemIndex = 10 then CondPagto := '15';
 if CBCondPagto.ItemIndex = 11 then CondPagto := '16';
 if CBCondPagto.ItemIndex = 12 then CondPagto := '17';
 if CBCondPagto.ItemIndex = 13 then CondPagto := '18';
 if CBCondPagto.ItemIndex = 14 then CondPagto := '19';
 if CBCondPagto.ItemIndex = 15 then CondPagto := '90';
 if CBCondPagto.ItemIndex = 16 then CondPagto := '99';

 CadMoedaDM.Conexão.StartTransaction;
 try
  with CadMoedaDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadmoeda set descricao = :descricao, condpagto = :condpagto, ativo = :ativo where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ParamByName('descricao').AsString := Descricao;
   ParamByName('ativo').AsString := ativo;
   ParamByName('condpagto').AsString := condpagto;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Alterou a moeda ' + codigo + ' - ' + descricao + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadMoeda';
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('data').AsDateTime := Now;
   ExecSQL;
  end;

  CadMoedaDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');
  EdtCodigo.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;
  CBCondPagto.Enabled := False;

  btnIncluir.Visible := True;
  btnFechar.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;

  btnGravarIncluir.Visible := False;
  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  with CadMoedaDM.qryConsultarMoeda do
  begin
   SQL.Clear;
   SQL.Add('select * from cadmoeda');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  CadMoedaDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
 end;
end;

procedure TCadMoeda.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 EdtCodigo.Enabled := False;
 EdtDescricao.Enabled := False;
 CBAtivo.Enabled := False;
 CBCondPagto.Enabled := False;

 EdtCodigo.Clear;
 EdtDescricao.Clear;

 btnIncluir.Visible := True;
 btnFechar.Visible := True;
 btnExcluir.Visible := True;
 btnAlterar.Visible := True;

 btnGravarIncluir.Visible := False;
 btnGravarAlterar.Visible := False;
 btnDesistir.Visible := False;

 with CadMoedaDM.qryConsultarMoeda do
 begin
  SQL.Clear;
  SQL.Add('select * from cadmoeda');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadMoeda.btnExcluirClick(Sender: TObject);
var codigo, descricao, ativo: string;
    I: integer;
begin
 codigo := EdtCodigo.Text;
 Descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if codigo = '' then begin
  ShowMessage('Nenhuma moeda selecionada!');
  Abort;
 end;

 CadMoedaDM.Conexão.StartTransaction;
 try
  with CadMoedaDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadmoeda where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Excluiu a moeda ' + codigo + ' - ' + descricao + ' e ativo ' + ativo;
   ParamByName('tela').AsString := 'CadMoeda';
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('data').AsDateTime := Now;
   ExecSQL;
  end;

  CadMoedaDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');

  EdtCodigo.Clear;
  EdtDescricao.Clear;

  with CadMoedaDM.qryConsultarMoeda do
  begin
   SQL.Clear;
   SQL.Add('select * from cadmoeda');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  CadMoedaDM.Conexão.Rollback;
  ShowMessage('Erro na exclusão!');
 end;
end;

procedure TCadMoeda.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
