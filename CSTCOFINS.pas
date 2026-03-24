unit CSTCOFINS;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics, Vcl.ComCtrls,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.StdCtrls, Data.DB,
  Vcl.Grids, Vcl.DBGrids,
  CSTCOFINSDM,
  Log, LogDM,
  GlobalUnit;

type
  TCadCSTCOFINS = class(TForm)
    Panel1: TPanel;
    lblCST: TLabel;
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
    lblDescricao: TLabel;
    RBBase: TRadioButton;
    RBIsento: TRadioButton;
    RBOutros: TRadioButton;
    RGModo: TRadioGroup;
    lblAtivo: TLabel;
    CBAtivo: TCheckBox;
    procedure btnIncluirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure BtnExcluirClick(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadCSTCOFINS: TCadCSTCOFINS;

implementation

{$R *.dfm}

uses ConsultarCSTCOFINSForm;

procedure TCadCSTCOFINS.FormShow(Sender: TObject);
var I: integer;
begin
 with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstcofins');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadCSTCOFINS.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstcofins');
  Open;
 end;
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

procedure TCadCSTCOFINS.btnGravarIncluirClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CST = '' then begin
  ShowMessage('CST COFINS não pode ser vazio!');
  Abort;
 End;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 End;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 End;

 with CadCSTCOFINSDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadCSTCOFINS where CST = :CST');
  ParamByName('CST').AsString := CST;
  Open;

  if not IsEmpty then begin
   ShowMessage('CST COFINS já cadastrado!');
   Abort;
  end;
 end;

 CadCSTCOFINSDM.Conexão.StartTransaction;
 try
  with CadCSTCOFINSDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadcstcofins (CST, Descricao, Modo, ativo)');
   SQL.Add('values');
   SQL.Add('(:CST, :Descricao, :Modo, :ativo)');
   ParamByName('CST').AsString := CST;
   ParamByName('Descricao').AsString := Descricao;
   ParamByName('Modo').AsString := Modo;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

 with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Inseriu o CST COFINS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSTCOFINS';
   ExecSQL;
  end;

  CadCSTCOFINSDM.Conexão.Commit;
  ShowMessage('Gravado com sucesso!');

  with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcstcofins');
   Open;
  end;
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
  CadCSTCOFINSDM.Conexão.Rollback;
  ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadCSTCOFINS.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCST.Text = '' then begin
  ShowMessage('Nenhum CST COFINS selecionado!');
  Abort;
 End;

 with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstcofins');
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

procedure TCadCSTCOFINS.btnGravarAlterarClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CST = '' then begin
  ShowMessage('CST COFINS não pode ser vazio!');
  Abort;
 End;

 if Descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 End;

 if not RBBase.Checked and not RBIsento.Checked and not RBOutros.Checked then begin
  ShowMessage('Selecione um modo de cálculo!');
  Abort;
 End;

 CadCSTCOFINSDM.Conexão.StartTransaction;
 try
  with CadCSTCOFINSDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadCSTCOFINS set descricao = :descricao, modo = :modo, ativo = :ativo where CST = :CST');
   ParamByName('CST').AsString := CST;
   ParamByName('Descricao').AsString := Descricao;
   ParamByName('Modo').AsString := Modo;
   ParamByName('ativo').AsString := ativo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Alterou o CST COFINS ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSTCOFINS';
   ExecSQL;
  end;

  CadCSTCOFINSDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');

  with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcstcofins');
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
  CadCSTCOFINSDM.Conexão.Rollback;
  ShowMessage('Erro na alteração!');
  end;
end;

procedure TCadCSTCOFINS.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
 begin
  SQL.Clear;
  SQL.Add('select * from cadcstcofins');
  Open;
 end;
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

procedure TCadCSTCOFINS.BtnExcluirClick(Sender: TObject);
var CST, Descricao, Modo, ativo: string;
    I: integer;
begin
 CST := EdtCST.Text;
 Descricao := EdtDescricao.Text;
 if RBBase.Checked then Modo := 'B'
 else if RBIsento.Checked then modo := 'I'
 else if RBOutros.Checked then modo := 'O';
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';

 if CST = '' then begin
  ShowMessage('Nenhum CST COFINS selecionado!');
  Abort;
 End;

 CadCSTCOFINSDM.Conexão.StartTransaction;
 try
  with CadCSTCOFINSDM.qryDelete do
  begin
   SQL.CLear;
   SQL.Add('delete from cadCSTCOFINS where CST = :CST');
   ParamByName('CST').AsString := CST;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (Descricao, data, emp_id, usuario, tela)');
   SQL.Add('values');
   SQL.Add('(:Descricao, :data, :emp_id, :usuario, :tela)');
   ParamByName('Descricao').AsString :=
   'Deletou o CST ' + CST + ' ' + Descricao + ' para o modo de cálculo ' + Modo;
   ParamByName('data').AsDateTime := Now;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('tela').AsString := 'CadCSTCOFINS';
   ExecSQL;
  end;

  CadCSTCOFINSDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');

  with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
  begin
   SQL.Clear;
   SQL.Add('select * from cadcstcofins');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCST.Clear;
  EdtDescricao.Clear;

  RBBase.Checked := False;
  RBIsento.Checked := False;
  RBOutros.Checked := False;
  except
  CadCSTCOFINSDM.Conexão.Rollback;
  ShowMessage('Erro na exclusão!');
 end;
end;

procedure TCadCSTCOFINS.GridCellClick(Column: TColumn);
var CST, Descricao, Modo, ativo: String;
begin
 with CadCSTCOFINSDM.qryConsultarCSTCOFINS do
 begin
  EdtCST.Text := FieldByName('CST').AsString;
  EdtDescricao.Text := FieldByName('Descricao').AsString;
  Modo := FieldByName('Modo').AsString;
  ativo := FieldByName('ativo').AsString;
 end;

 if Modo = 'B' then
 RBBase.Checked := True
 else if Modo = 'I' then
 RBIsento.Checked := True
 else if Modo = 'O' then
 RBOutros.Checked := True;

 if ativo = 'S' then CBAtivo.Checked;
end;

procedure TCadCSTCOFINS.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;
end.
