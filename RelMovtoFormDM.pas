unit RelMovtoFormDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MySQL, FireDAC.Phys.MySQLDef,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, FireDAC.DApt,
  FireDAC.Comp.DataSet, FireDAC.Phys.PG, FireDAC.Phys.PGDef, GlobalUnit;

type
  TRelMovtoDM = class(TDataModule)
    Conexão: TFDConnection;
    dsProdMov: TDataSource;
    ConsultarProdMov: TFDQuery;
    EstornarQuery: TFDQuery;
    IDQuery: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  RelMovtoDM: TRelMovtoDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TRelMovtoDM.DataModuleCreate(Sender: TObject);
begin
 ConfigurarConexao(Conexão);
end;

end.
