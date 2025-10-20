unit CSTICMS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  CSTICMSDataModule,
  Log, LogDataModule,
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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCSTICMS: TCadCSTICMS;

implementation

{$R *.dfm}

procedure TCadCSTICMS.btnIncluirClick(Sender: TObject);
begin
 CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDataModule.ConsultarCSTICMS.Open;

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
begin
  CST := EdtCST.Text;
  Descricao := EdtDescricao.Text;
  if RBBase.Checked then Modo := 'B'
  else if RBIsento.Checked then modo := 'I'
  else if RBOutros.Checked then modo := 'O';
  if CBAtivo.Checked then ativo := 'S' else ativo := 'N';


  if EdtCST.Text = '' then begin
  ShowMessage('CST ICMS não pode ser vazio!')
  end
  else begin

  if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ser vazio!')
  end
  else begin

  if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  end
  else begin

  CadCSTICMSDataModule.SelectQuery.Close;
  CadCSTICMSDataModule.SelectQuery.SQL.Clear;
  CadCSTICMSDataModule.SelectQuery.SQL.Text :=
  'select * from cadCSTICMS where CST = :CST';
  CadCSTICMSDataModule.SelectQuery.ParamByName('CST').AsString := CST;
  CadCSTICMSDataModule.SelectQuery.Open;

  if not CadCSTICMSDataModule.SelectQuery.IsEmpty then begin
  ShowMessage('CST ICMS já cadastrado!');
  end
  else begin

  CadCSTICMSDataModule.InsertQuery.SQL.CLear;
  CadCSTICMSDataModule.InsertQuery.SQL.Text :=
  'insert into cadCSTICMS (CST, Descricao, Modo, ativo) values (:CST, :Descricao, :Modo, :ativo)';
  CadCSTICMSDataModule.InsertQuery.ParamByName('CST').AsString := CST;
  CadCSTICMSDataModule.InsertQuery.ParamByName('Descricao').AsString := Descricao;
  CadCSTICMSDataModule.InsertQuery.ParamByName('Modo').AsString := Modo;
  CadCSTICMSDataModule.InsertQuery.Parambyname('ativo').AsString := ativo;

  LogModule.InserirLog.SQL.Clear;
  LogModule.InserirLog.SQL.Text :=
  'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
  LogModule.InserirLog.ParamByName('Descricao').AsString :=
  'Inseriu o CST ICMS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
  LogModule.InserirLog.ParamByName('data').AsDateTime := Now;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('tela').AsString := 'CadCSTICMS';
  try
  LogModule.InserirLog.ExecSQL;
  CadCSTICMSDataModule.InsertQuery.ExecSQL;
  ShowMessage('Incluído com sucesso!');

  CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms';
  CadCSTICMSDataModule.ConsultarCSTICMS.Open;

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
end;
end;
end;
end;

procedure TCadCSTICMS.btnAlterarClick(Sender: TObject);
begin
 if EdtCST.Text = '' then begin
 ShowMessage('Nenhum CST ICMS selecionado!');
 end
 else begin

 CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDataModule.ConsultarCSTICMS.Open;

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
end;

procedure TCadCSTICMS.btnGravarAlterarClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
begin
  CST := EdtCST.Text;
  Descricao := EdtDescricao.Text;
  if RBBase.Checked then Modo := 'B'
  else if RBIsento.Checked then modo := 'I'
  else if RBOutros.Checked then modo := 'O';
  if CBAtivo.Checked then ativo := 'S' else ativo := 'N';


  if EdtCST.Text = '' then begin
  ShowMessage('CST ICMS não pode ser vazio!')
  end
  else begin

  if EdtDescricao.Text = '' then begin
  ShowMessage('Descrição não pode ser vazio!')
  end
  else begin

  if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  end
  else begin

  CadCSTICMSDataModule.UpdateQuery.SQL.CLear;
  CadCSTICMSDataModule.UpdateQuery.SQL.Text :=
  'update cadCSTICMS set descricao = :descricao, modo = :modo, Ativo = :Ativo where CST = :CST';
  CadCSTICMSDataModule.UpdateQuery.ParamByName('CST').AsString := CST;
  CadCSTICMSDataModule.UpdateQuery.ParamByName('Descricao').AsString := Descricao;
  CadCSTICMSDataModule.UpdateQuery.ParamByName('Modo').AsString := Modo;
  CadCSTICMSDataModule.UpdateQuery.ParamByName('Ativo').AsString := Ativo;

  LogModule.InserirLog.SQL.Clear;
  LogModule.InserirLog.SQL.Text :=
  'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
  LogModule.InserirLog.ParamByName('Descricao').AsString :=
  'Alterou o CST ICMS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
  LogModule.InserirLog.ParamByName('data').AsDateTime := Now;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('tela').AsString := 'CadCSTICMS';
  try
  LogModule.InserirLog.ExecSQL;
  CadCSTICMSDataModule.UpdateQuery.ExecSQL;
  ShowMessage('Alterado com sucesso!');

  CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms';
  CadCSTICMSDataModule.ConsultarCSTICMS.Open;

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
end;
end;
end;

procedure TCadCSTICMS.btnDesistirClick(Sender: TObject);
begin
 CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Clear;
 CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Text :=
 'select * from cadcsticms';
 CadCSTICMSDataModule.ConsultarCSTICMS.Open;

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
begin
  CST := EdtCST.Text;
  Descricao := EdtDescricao.Text;
  if RBBase.Checked then Modo := 'B'
  else if RBIsento.Checked then modo := 'I'
  else if RBOutros.Checked then modo := 'O';
  if CBAtivo.Checked then ativo := 'S' else ativo := 'N';


  if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST ICMS selecionado!');
  end
  else begin

  CadCSTICMSDataModule.DeleteQuery.SQL.CLear;
  CadCSTICMSDataModule.DeleteQuery.SQL.Text :=
  'delete from cadCSTICMS where CST = :CST';
  CadCSTICMSDataModule.DeleteQuery.ParamByName('CST').AsString := CST;

  LogModule.InserirLog.SQL.Clear;
  LogModule.InserirLog.SQL.Text :=
  'insert into logs (Descricao, data, emp_id, usuario, tela) values (:Descricao, :data, :emp_id, :usuario, :tela)';
  LogModule.InserirLog.ParamByName('Descricao').AsString :=
  'Deletou o CST ICMS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
  LogModule.InserirLog.ParamByName('data').AsDateTime := Now;
  LogModule.InserirLog.ParamByName('emp_id').AsString := EmpresaLogada;
  LogModule.InserirLog.ParamByName('usuario').AsString := UsuarioLogado;
  LogModule.InserirLog.ParamByName('tela').AsString := 'CadCSTICMS';
  try
  LogModule.InserirLog.ExecSQL;
  CadCSTICMSDataModule.DeleteQuery.ExecSQL;
  ShowMessage('Excluído com sucesso!');

  CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Clear;
  CadCSTICMSDataModule.ConsultarCSTICMS.SQL.Text :=
  'select * from cadcsticms';
  CadCSTICMSDataModule.ConsultarCSTICMS.Open;

  EdtCST.Clear;
  EdtDescricao.Clear;

  RBBase.Checked := False;
  RBIsento.Checked := False;
  RBOutros.Checked := False;
  except
  ShowMessage('Erro na exclusão!');
  end;
end;
end;

procedure TCadCSTICMS.GridCellClick(Column: TColumn);
var CST, Descricao, Modo, ativo: String;
begin
 EdtCST.Text := CadCSTICMSDataModule.ConsultarCSTICMS.FieldByName('CST').AsString;
 EdtDescricao.Text := CadCSTICMSDataModule.ConsultarCSTICMS.FieldByName('Descricao').AsString;
 Modo := CadCSTICMSDataModule.ConsultarCSTICMS.FieldByName('Modo').AsString;
 Ativo := CadCSTICMSDataModule.ConsultarCSTICMS.FieldByName('Ativo').AsString;
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
 Fechartela(sender);
end;
end.
