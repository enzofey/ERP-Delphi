unit NaturezaDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef, GlobalUnit;

type
  TCadNaturezaDM = class(TDataModule)
    Conexão: TFDConnection;
    qrySelect: TFDQuery;
    qryInsert: TFDQuery;
    qryUpdate: TFDQuery;
    qryConsultarNatureza: TFDQuery;
    ConsultarNatureza: TDataSource;
    PGLink: TFDPhysPgDriverLink;
    qryDelete: TFDQuery;
    dsAcesso: TDataSource;
    qryAcesso: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadNaturezaDM: TCadNaturezaDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TCadNaturezaDM.DataModuleCreate(Sender: TObject);
begin
 ConfigurarConexao(Conexão);
end;

end.
