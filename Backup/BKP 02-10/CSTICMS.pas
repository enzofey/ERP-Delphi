unit CSTICMS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  CSTICMSDM,
  Log, LogDM,
  GlobalUnit;

type
  TCadCSTICMS = class(TForm)
    Panel1: TPanel;
    lblCST: TLabel;
    lblDescricao: TLabel;
    btnAlterar: TButton;
    btnDesistir: TButton;
    BtnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    EdtCST: TEdit;
    EdtDescricao: TEdit;
    Grid: TDBGrid;
    RGModo: TRadioGroup;
    RBBase: TRadioButton;
    RBIsento: TRadioButton;
    RBOutros: TRadioButton;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCSTICMS: TCadCSTICMS;

implementation

{$R *.dfm}

procedure TCadCSTICMS.FormShow(Sender: TObject);
var I: integer;
begin
CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDM.ConsultarCSTICMS.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCSTICMS.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDM.ConsultarCSTICMS.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCST.Clear;
 EdtDescricao.Clear;

 EdtCST.Enabled := True;
 EdtDescricao.Enabled := True;

 RBBase.Checked := False;
 RBIsento.Checked := False;
 RBOutros.Checked := False;

 RBBase.Enabled := True;
 RBIsento.Enabled := True;
 RBOutros.Enabled := True;

 CBAtivo.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
 Grid.Enabled := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadCSTICMS.btnGravarIncluirClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if EdtCST.Text = '' then begin
  ShowMessage('CST ICMS não pode ser vazio!');
  Abort;
 End;

 if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 End;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 End;

 CadCSTICMSDM.SelectQuery.SQL.Clear;
 CadCSTICMSDM.SelectQuery.SQL.Text :=
 'select * from cadCSTICMS where CST = :CST';
 CadCSTICMSDM.SelectQuery.ParamByName('CST').AsString := CST;
 CadCSTICMSDM.SelectQuery.Open;

 if not CadCSTICMSDM.SelectQuery.IsEmpty then begin
  ShowMessage('CST ICMS já cadastrado!');
  Abort;
 End;

 CadCSTICMSDM.InsertQuery.SQL.CLear;
 CadCSTICMSDM.InsertQuery.SQL.Text :=
 'insert into cadCSTICMS (CST, Descricao, Modo, ativo) values (:CST, :Descricao, :Modo, :ativo)';
 CadCSTICMSDM.InsertQuery.ParamByName('CST').AsString := CST;
 CadCSTICMSDM.InsertQuery.ParamByName('Descricao').AsString := Descricao;
 CadCSTICMSDM.InsertQuery.ParamByName('Modo').AsString := Modo;
 CadCSTICMSDM.InsertQuery.Parambyname('ativo').AsString := ativo;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
 LogsDM.InserirLog.ParamByName('Descricao').AsString :=
 'Inseriu o CST ICMS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'CadCSTICMS';
 try
  LogsDM.InserirLog.ExecSQL;
  CadCSTICMSDM.InsertQuery.ExecSQL;
  ShowMessage('Incluído com sucesso!');

  CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms';
  CadCSTICMSDM.ConsultarCSTICMS.Open;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCST.Enabled := False;
  EdtDescricao.Enabled := False;

  RBBase.Enabled := False;
  RBIsento.Enabled := False;
  RBOutros.Enabled := False;

  CBAtivo.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  Grid.Enabled := True;

  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;
  except
  ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadCSTICMS.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST ICMS selecionado!');
  Abort;
 End;

 CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDM.ConsultarCSTICMS.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtDescricao.Enabled := True;

 RBBase.Enabled := True;
 RBIsento.Enabled := True;
 RBOutros.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
 Grid.Enabled := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadCSTICMS.btnGravarAlterarClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if EdtCST.Text = '' then begin
  ShowMessage('CST ICMS não pode ser vazio!');
  Abort;
 End;

 if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 End;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 End;

 CadCSTICMSDM.UpdateQuery.SQL.CLear;
 CadCSTICMSDM.UpdateQuery.SQL.Text :=
 'update cadCSTICMS set descricao = :descricao, modo = :modo, Ativo = :Ativo where CST = :CST';
 CadCSTICMSDM.UpdateQuery.ParamByName('CST').AsString := CST;
 CadCSTICMSDM.UpdateQuery.ParamByName('Descricao').AsString := Descricao;
 CadCSTICMSDM.UpdateQuery.ParamByName('Modo').AsString := Modo;
 CadCSTICMSDM.UpdateQuery.ParamByName('Ativo').AsString := Ativo;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
 LogsDM.InserirLog.ParamByName('Descricao').AsString :=
 'Alterou o CST ICMS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'CadCSTICMS';
 try
  LogsDM.InserirLog.ExecSQL;
  CadCSTICMSDM.UpdateQuery.ExecSQL;
  ShowMessage('Alterado com sucesso!');

  CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms';
  CadCSTICMSDM.ConsultarCSTICMS.Open;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtDescricao.Enabled := False;

  RBBase.Enabled := False;
  RBIsento.Enabled := False;
  RBOutros.Enabled := False;

  CBAtivo.Enabled := False;

  btnIncluir.Visible := True;
  btnAlterar.Visible := True;
  btnExcluir.Visible := True;
  btnFechar.Visible := True;
  Grid.Enabled := True;

  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;
  except
  ShowMessage('Erro na alteração!');
  end;
end;

procedure TCadCSTICMS.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDM.ConsultarCSTICMS.Open;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCST.Clear;
 EdtDescricao.Clear;

 EdtCST.Enabled := False;
 EdtDescricao.Enabled := False;

 RBBase.Checked := False;
 RBIsento.Checked := False;
 RBOutros.Checked := False;

 CBAtivo.Enabled := False;

 RBBase.Enabled := False;
 RBIsento.Enabled := False;
 RBOutros.Enabled := False;

 btnIncluir.Visible := True;
 btnAlterar.Visible := True;
 btnExcluir.Visible := True;
 btnFechar.Visible := True;
 Grid.Enabled := True;

 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;
end;

procedure TCadCSTICMS.BtnExcluirClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST ICMS selecionado!');
  Abort;
 End;

 CadCSTICMSDM.DeleteQuery.SQL.CLear;
 CadCSTICMSDM.DeleteQuery.SQL.Text :=
 'delete from cadCSTICMS where CST = :CST';
 CadCSTICMSDM.DeleteQuery.ParamByName('CST').AsString := CST;

 LogsDM.InserirLog.SQL.Clear;
 LogsDM.InserirLog.SQL.Text :=
 'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
 LogsDM.InserirLog.ParamByName('Descricao').AsString :=
 'Deletou o CST ICMS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
 LogsDM.InserirLog.ParamByName('data').AsDateTime := Now;
 LogsDM.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
 LogsDM.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
 LogsDM.InserirLog.ParamByName('tela').AsString := 'CadCSTICMS';
 try
  LogsDM.InserirLog.ExecSQL;
  CadCSTICMSDM.DeleteQuery.ExecSQL;
  ShowMessage('Excluído com sucesso!');

  CadCSTICMSDM.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDM.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms';
  CadCSTICMSDM.ConsultarCSTICMS.Open;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCST.Clear;
  EdtDescricao.Clear;

  RBBase.Checked := False;
  RBIsento.Checked := False;
  RBOutros.Checked := False;
  except
  ShowMessage('Erro na exclusão!');
  end;
end;

procedure TCadCSTICMS.GridCellClick(Column: TColumn);
var CST, Descricao, Modo, ativo: String;
begin
 EdtCST.Text := CadCSTICMSDM.ConsultarCSTICMS.FieldByName('CST').AsString;
 EdtDescricao.Text := CadCSTICMSDM.ConsultarCSTICMS.FieldByName('Descricao').AsString;
 Modo := CadCSTICMSDM.ConsultarCSTICMS.FieldByName('Modo').AsString;
 Ativo := CadCSTICMSDM.ConsultarCSTICMS.FieldByName('Ativo').AsString;
 if Modo = 'B' then
 RBBase.Checked := True
 else if Modo = 'I' then
 RBIsento.Checked := True
 else if Modo = 'O' then
 RBOutros.Checked := True;

 if Ativo = 'S' then CBAtivo.Checked := True;
end;

procedure TCadCSTICMS.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
