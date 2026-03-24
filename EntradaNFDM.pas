unit EntradaNFDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.PG,
  FireDAC.Phys.PGDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, GlobalUnit;

type
  TEntradaNFeDM = class(TDataModule)
    Conexão: TFDConnection;
    ConsultarNotaEntrada: TDataSource;
    qryConsultarNotaEntrada: TFDQuery;
    qrySelect: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    qryInsert: TFDQuery;
    qryUpdate: TFDQuery;
    qryDelete: TFDQuery;
    qryAcesso: TFDQuery;
    dsAcessoGrid: TDataSource;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  EntradaNFeDM: TEntradaNFeDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TEntradaNFeDM.DataModuleCreate(Sender: TObject);
begin
 ConfigurarConexao(Conexão);
end;

end.
