unit NCM;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Data.DB, Vcl.StdCtrls,
  Vcl.Grids, Vcl.DBGrids,
  GlobalUnit,
  NCMDM, ConsultarNCMForm,
  Log, LogDM, Vcl.ComCtrls, Vcl.Buttons;

type
  TCadNCM = class(TForm)
    Panel1: TPanel;
    Pages: TPageControl;
    AcessoPage: TTabSheet;
    CadastroPage: TTabSheet;
    CBAtivo: TCheckBox;
    EdtCodigo: TEdit;
    EdtDescricao: TEdit;
    EdtNCM: TEdit;
    Grid: TDBGrid;
    lblAtivo: TLabel;
    lblCodigo: TLabel;
    lblDescricao: TLabel;
    lblNCM: TLabel;
    BtnExcluir: TButton;
    BtnGravarAlterar: TButton;
    btnAlterar: TButton;
    btnIncluir: TButton;
    BtnDesistir: TButton;
    BtnGravarIncluir: TButton;
    btnFechar: TButton;
    RGAcessoAtivo: TRadioGroup;
    lblAcessoNCM: TLabel;
    EdtAcessoNCM: TEdit;
    EdtAcessoDescricao: TEdit;
    SBConsNCM: TSpeedButton;
    btnAcessoFechar: TButton;
    btnAcessoConsultar: TButton;
    AcessoGrid: TDBGrid;
    procedure btnFecharClick(Sender: TObject);
    procedure btnIncluirClick(Sender: TObject);
    procedure btnDesistirClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnGravarIncluirClick(Sender: TObject);
    procedure btnGravarAlterarClick(Sender: TObject);
    procedure btnExcluirClick(Sender: TObject);
    procedure GridCellClick(Column: TColumn);
    procedure FormShow(Sender: TObject);
    procedure SBConsNCMClick(Sender: TObject);
    procedure EdtAcessoNCMChange(Sender: TObject);
    procedure btnAcessoConsultarClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadNCM: TCadNCM;

implementation

{$R *.dfm}

procedure TCadNCM.FormShow(Sender: TObject);
var I: integer;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
end;

procedure TCadNCM.btnIncluirClick(Sender: TObject);
var I: integer;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 btnIncluir.Visible := False;
 btnExcluir.Visible := False;
 btnAlterar.Visible := False;

 btnGravarIncluir.Visible := True;
 btnDesistir.Visible := True;

 EdtCodigo.Enabled := True;
 EdtNCM.Enabled := True;
 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;

 EdtCodigo.Clear;
 EdtNCM.Clear;
 EdtDescricao.Clear;
end;

procedure TCadNCM.GridCellClick(Column: TColumn);
var codigo, NCM, Ativo, Descricao: String;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  EdtCodigo.Text := FieldByName('codigo').AsString;
  EdtNCM.Text := FieldByName('NCM').AsString;
  EdtDescricao.Text := FieldByName('Descricao').AsString;
  if FieldByName('Ativo').AsString = 'S' then CBAtivo.Checked;
 end;
end;

procedure TCadNCM.SBConsNCMClick(Sender: TObject);
var codigo, NCM: String;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  Open;
 end;

 Application.CreateForm(TConsultarNCM, ConsultarNCM);
 codigo := ConsultarNCM.SelecionarNCM;

 if codigo <> '' then begin
  EdtAcessoNCM.Text := codigo;
  NCM := ConsultarNCM.NCM;
  EdtAcessoDescricao.Text := NCM;
 end;
end;

procedure TCadNCM.EdtAcessoNCMChange(Sender: TObject);
var codigo, NCM: String;
begin
 codigo := EdtAcessoNCM.text;

 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm where codigo = :codigo');
  ParamByName('codigo').AsString := Codigo;
  Open;

  EdtAcessoDescricao.Text := FieldByName('NCM').AsString;
 end;
end;

procedure TCadNCM.btnGravarIncluirClick(Sender: TObject);
var codigo, descricao, ativo, NCM: String;
    I: integer;
begin
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 NCM := EdtNCM.Text;
 codigo := EdtCodigo.Text;

 if codigo = '' then begin
  ShowMessage('Código não pode ser vazio!');
  Abort;
 end;

 if descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 end;

 if NCM = '' then begin
  ShowMessage('NCM não pode ser vazio!');
  Abort;
 end;

 with CadNCMDM.qrySelect do
 begin
  SQL.Clear;
  SQL.Add('select * from cadNCM where NCM = :NCM');
  ParamByName('NCM').AsString := NCM;
  Open;

  if not IsEmpty then begin
   ShowMessage('NCM já cadastrado!');
   Abort;
  end;
 end;

 CadNCMDM.Conexão.StartTransaction;
 try
  with CadNCMDM.qryInsert do
  begin
   SQL.Clear;
   SQL.Add('insert into cadncm (codigo, NCM, descricao, ativo)');
   SQL.Add('values');
   SQL.Add('(:codigo, :NCM, :descricao, :ativo)');
   ParamByName('NCM').AsString := NCM;
   ParamByName('descricao').AsString := descricao;
   ParamByName('ativo').AsString := ativo;
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
   'Inseriu o NCM ' + NCM + ' no código ' + codigo + ' na descrição ' + descricao + ' ativo = ' + Ativo;
   ParamByName('tela').AsString := 'CadNCM';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadNCMDM.Conexão.Commit;
  ShowMessage('Incluído com sucesso!');
  btnIncluir.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;

  btnGravarIncluir.Visible := False;
  btnDesistir.Visible := False;

  EdtCodigo.Enabled := False;
  EdtNCM.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;

  with CadNCMDM.qryConsultarNCM do
  begin
   SQL.Clear;
   SQL.Add('select * from cadncm');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');
  except
  CadNCMDM.Conexão.Rollback;
  ShowMessage('Erro na inclusão!');
 end;
end;

procedure TCadNCM.btnAlterarClick(Sender: TObject);
var I: integer;
begin
 if EdtCodigo.Text = '' then begin
  ShowMessage('NCM não selecionado!');
  Abort;
 end;

 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 btnIncluir.Visible := False;
 btnExcluir.Visible := False;
 btnAlterar.Visible := False;

 btnGravarAlterar.Visible := True;
 btnDesistir.Visible := True;

 EdtNCM.Enabled := True;
 EdtDescricao.Enabled := True;
 CBAtivo.Enabled := True;
end;

procedure TCadNCM.btnGravarAlterarClick(Sender: TObject);
var codigo, descricao, ativo, NCM: String;
    I: integer;
begin
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 NCM := EdtNCM.Text;
 codigo := EdtCodigo.Text;

 if descricao = '' then begin
  ShowMessage('Descrição não pode ser vazio!');
  Abort;
 end;

 if NCM = '' then begin
  ShowMessage('NCM não pode ser vazio!');
  Abort;
 end;

 CadNCMDM.Conexão.StartTransaction;
 try
  with CadNCMDM.qryUpdate do
  begin
   SQL.Clear;
   SQL.Add('update cadncm set Descricao = :descricao, ativo = :ativo, NCM = :NCM where codigo = :codigo');
   ParamByName('codigo').AsString := codigo;
   ParamByName('descricao').AsString := descricao;
   ParambyName('ativo').AsString := ativo;
   Parambyname('NCM').AsString := NCM;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Alterou o NCM ' + NCM + ' no código ' + codigo + ' na descrição ' + descricao + ' ativo = ' + Ativo;
   ParamByName('tela').AsString := 'CadNCM';
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadNCMDM.Conexão.Commit;
  ShowMessage('Alterado com sucesso!');

  with CadNCMDM.qryConsultarNCM do
  begin
   SQL.Clear;
   SQL.Add('select * from cadncm');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  btnIncluir.Visible := True;
  btnExcluir.Visible := True;
  btnAlterar.Visible := True;

  btnGravarAlterar.Visible := False;
  btnDesistir.Visible := False;

  EdtNCM.Enabled := False;
  EdtDescricao.Enabled := False;
  CBAtivo.Enabled := False;
  except
  CadNCMDM.Conexão.Rollback;
  ShowMessage('Erro na alteração');
 end;
end;

procedure TCadNCM.btnDesistirClick(Sender: TObject);
var I: integer;
begin
 with CadNCMDM.qryConsultarNCM do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  Open;
 end;
 for i := 0 to Grid.Columns.Count - 1 do
 Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

 btnIncluir.Visible := True;
 btnExcluir.Visible := True;
 btnAlterar.Visible := True;

 btnGravarIncluir.Visible := False;
 btnDesistir.Visible := False;

 EdtCodigo.Enabled := False;
 EdtNCM.Enabled := False;
 EdtDescricao.Enabled := False;
 CBAtivo.Enabled := False;

 EdtCodigo.Clear;
 EdtNCM.Clear;
 EdtDescricao.Clear;
end;

procedure TCadNCM.btnExcluirClick(Sender: TObject);
var codigo, descricao, ativo, NCM: String;
    I: integer;
begin
 descricao := EdtDescricao.Text;
 if CBAtivo.Checked then ativo := 'S' else ativo := 'N';
 NCM := EdtNCM.Text;
 codigo := EdtCodigo.Text;

 if codigo = '' then begin
  ShowMessage('NCM não selecionado!');
  Abort;
 end;

 CadNCMDM.Conexão.StartTransaction;
 try
  with CadNCMDM.qryDelete do
  begin
   SQL.Clear;
   SQL.Add('delete from cadncm where codigo = :codigo');
   Parambyname('codigo').AsString := codigo;
   ExecSQL;
  end;

  with LogsDM.InserirLog do
  begin
   SQL.Clear;
   SQL.Add('insert into logs (descricao, tela, data, usuario, emp_id)');
   SQL.Add('values');
   SQL.Add('(:descricao, :tela, :data, :usuario, :emp_id)');
   ParamByName('descricao').AsString :=
   'Excluiu o NCM ' + NCM + ' no código ' + codigo + ' na descrição ' + descricao + ' ativo = ' + Ativo;
   ParamByName('tela').AsString := 'CadNCM';;
   ParamByName('data').AsDatetime := Now;
   ParamByName('usuario').AsString := UsuarioLogado;
   ParamByName('emp_id').AsString := EmpresaLogada;
   ExecSQL;
  end;

  CadNCMDM.Conexão.Commit;
  ShowMessage('Excluído com sucesso!');

  with CadNCMDM.qryConsultarNCM do
  begin
   SQL.Clear;
   SQL.Add('select * from cadncm');
   Open;
  end;
  for i := 0 to Grid.Columns.Count - 1 do
  Grid.Columns[i].Width := Grid.Canvas.TextWidth(Grid.Columns[i].Title.Caption + '     ');

  EdtCodigo.Clear;
  EdtNCM.Clear;
  EdtDescricao.Clear;
  except
  CadNCMDM.Conexão.Rollback;
  ShowMessage('Erro na alteração');
 end;
end;

procedure TCadNCM.btnFecharClick(Sender: TObject);
begin
 if Parent is TTabSheet then
 Parent.Free;
end;

procedure TCadNCM.btnAcessoConsultarClick(Sender: TObject);
var NCM: string;
    I: integer;
    temwhere: boolean;
begin
 NCM := EdtAcessoNCM.text;

 with CadNCMDM.qryAcesso do
 begin
  SQL.Clear;
  SQL.Add('select * from cadncm');
  temwhere := false;

  if NCM <> '' then begin
   if temwhere then begin
    SQL.Add('and codigo = :codigo');
   end
   else begin
    SQL.Add('where codigo = :codigo');
   end;
   Parambyname('codigo').AsString := NCM;
  end;

  if RGAcessoAtivo.ItemIndex = 0 then begin
   if temwhere then begin
    SQL.Add('and ativo = :ativo');
   end
   else begin
    SQL.Add('where ativo = :ativo');
    temwhere := true;
   end;
  ParamByName('ativo').AsString := 'S';
  end;

  if RGAcessoAtivo.ItemIndex = 1 then begin
   if temwhere then begin
    SQL.Add('and ativo = :ativo');
   end
   else begin
    SQL.Add('where ativo = :ativo');
    temwhere := true;
   end;
  ParamByName('ativo').AsString := 'N';
  end;
  Open;
 end;
 for i := 0 to AcessoGrid.Columns.Count - 1 do
 AcessoGrid.Columns[i].Width := AcessoGrid.Canvas.TextWidth(AcessoGrid.Columns[i].Title.Caption + '     ');
end;
end.
