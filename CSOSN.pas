unit CSOSN;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  CSOSNDM,
  GlobalUnit,
  Log, LogDM;

type
  TCadCSOSN = class(TForm)
    Panel1: TPanel;
    lblCSOSN: TLabel;
    lblDescricao: TLabel;
    btnAlterar: TButton;
    btnDesistir: TButton;
    BtnExcluir: TButton;
    btnFechar: TButton;
    btnGravarAlterar: TButton;
    btnGravarIncluir: TButton;
    btnIncluir: TButton;
    EdtCSOSN: TEdit;
    EdtDescricao: TEdit;
    Grid: TDBGrid;
    RGModo: TRadioGroup;
    RBBase: TRadioButton;
    RBIsento: TRadioButton;
    RBOutros: TRadioButton;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure btnFecharClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCSOSN: TCadCSOSN;

implementation

{$R *.dfm}

uses ConsultarCSOSNForm;

procedure TCadCSOSN.FormShow(Sender: TObject);
var I: integer;
begin
 with CadCSOSNDM.qryConsultarCSOSN do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcsosn');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCSOSN.btnIncluirClick(Sender: TObject);
var i: integer;
begin
 with CadCSOSNDM.qryConsultarCSOSN do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcsosn');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCSOSN.Clear;
 EdtDescricao.Clear;

 EdtCSOSN.Enabled := True;
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

procedure TCadCSOSN.btnGravarIncluirClick(Sender: TObject);
var CSOSN, Descricao, Modo, ativo: string;
    I: integer;
begin
 CSOSN := EdtCSOSN.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
  
 if CSOSN = '' then begin
  ShowMessage('CSOSN não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 end;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 end;

 with CadCSOSNDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcsosn where csosn = :csosn');
  ParamByName('csosn').AsString := csosn;
  Open;

  if not IsEmpty then begin
   ShowMessage('CSOSN já cadastrado!');
   Abort;
  end;
 end;

 CadCSOSNDM.Conexão.StartTransaction;
 try
  with CadCSOSNDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadcsosn (CSOSN, Descricao, Modo, ativo)');
   SQL.Add('values');
   SQL.Add('(:CSOSN, :Descricao, :Modo, :ativo)');
   ParamByName('CSOSN').AsString := CSOSN;
   ParamByName('Descricao').AsString := Descricao;
   ParamByName('Modo').AsString := Modo;
   ParamByName('Ativo').AsString := Ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Inseriu o CSOSN ' + CSOSN + '' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSOSN';
   ExecSQL;
  end;

  CadCSOSNDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso!');

  with CadCSOSNDM.qryConsultarCSOSN do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcsosn');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCSOSN.Enabled := False;
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
  CadCSOSNDM.Conexão.Rollback;
  ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadCSOSN.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCSOSN.Text = '' then begin
  ShowMessage('Nenhum CSOSN selecionado!');
  Abort;
 end;

 with CadCSOSNDM.qryConsultarCSOSN do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcsosn');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtDescricao.Enabled := True;

 RBBase.Enabled := True;
 RBIsento.Enabled := True;
 RBOutros.Enabled := True;

 CBAtivo.Enabled := True;

 btnIncluir.Visible := False;
 btnAlterar.Visible := False;
 btnExcluir.Visible := False;
 btnFechar.Visible := False;
 Grid.Enabled := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;
end;

procedure TCadCSOSN.btnGravarAlterarClick(Sender: TObject);
var CSOSN, Descricao, Modo, ativo: string;
    I: integer;
begin
 CSOSN := EdtCSOSN.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CSOSN = '' then begin
  ShowMessage('CSOSN não pode ser vazio!');
  Abort;
 end;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 end;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 end;

 CadCSOSNDM.Conexão.StartTransaction;
 try
  with CadCSOSNDM.qryUpdate do
  begin
   SQL.CLear;
   SQL.Add('update cadCSOSN set descricao = :descricao, modo = :modo, ativo = :ativo where CSOSN = :CSOSN');
   ParamByName('CSOSN').AsString := CSOSN;
   ParamByName('Descricao').AsString := Descricao;
   ParamByName('Modo').AsString := Modo;
   ParamByName('Ativo').AsString := Ativo;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Alterou o CSOSN ' + CSOSN + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSOSN';
   ExecSQL;
  end;

  CadCSOSNDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');

  with CadCSOSNDM.qryConsultarCSOSN do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcsosn');
   Open;
  end;
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
  CadCSOSNDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
 end;
end;

procedure TCadCSOSN.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 with CadCSOSNDM.qryConsultarCSOSN do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcsosn');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 EdtCSOSN.Clear;
 EdtDescricao.Clear;

 EdtCSOSN.Enabled := False;
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

procedure TCadCSOSN.BtnExcluirClick(Sender: TObject);
var CSOSN, Descricao, Modo, ativo: string;
    I: integer;
begin
 CSOSN := EdtCSOSN.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CSOSN = '' then begin
  ShowMessage('Nenhum CSOSN selecionado!');
  Abort;
 end;

 CadCSOSNDM.Conexão.StartTransaction;
 try
  with CadCSOSNDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadCSOSN where CSOSN = :CSOSN');
   ParamByName('CSOSN').AsString := CSOSN;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Deletou o CSOSN ' + CSOSN + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSOSN';
   ExecSQL;
  end;

  CadCSOSNDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');

  with CadCSOSNDM.qryConsultarCSOSN do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcsosn');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCSOSN.Clear;
  EdtDescricao.Clear;

  RBBase.Checked := False;
  RBIsento.Checked := False;
  RBOutros.Checked := False;

  CBAtivo.Checked := True;
  except
  ShowMessage('Erro na exclusão!');
 end;
end;

procedure TCadCSOSN.GridCellClick(Column: TColumn);
var CSOSN, Descricao, Modo, ativo: String;
begin
 with CadCSOSNDM.qryConsultarCSOSN do
 begin
  EdtCSOSN.Text := FieldByName('CSOSN').AsString;
  EdtDescricao.Text := FieldByName('Descricao').AsString;
  Modo := FieldByName('Modo').AsString;
  Ativo := FieldByName('Ativo').AsString;
 end;

 if Modo = 'B' then
 RBBase.Checked := True
 else if Modo = 'I' then
 RBIsento.Checked := True
 else if Modo = 'O' then
 RBOutros.Checked := True;

 if Ativo = 'S' then CBAtivo.Checked;
end;

procedure TCadCSOSN.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
