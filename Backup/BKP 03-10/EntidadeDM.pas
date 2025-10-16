unit EntidadeDM;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.MySQL,
  FireDAC.Phys.MySQLDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, FireDAC.Phys.PG, FireDAC.Phys.PGDef;

type
  TCadEntidadeDM = class(TDataModule)
    Conex�o: TFDConnection;
    ConsultarEntidade: TDataSource;
    qrySelect: TFDQuery;
    qryConsultarEntidade: TFDQuery;
    PGLink: TFDPhysPgDriverLink;
    qryInsert: TFDQuery;
    qryUpdate: TFDQuery;
    qryDelete: TFDQuery;
    qryAcesso: TFDQuery;
    dsAcesso: TDataSource;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  CadEntidadeDM: TCadEntidadeDM;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
