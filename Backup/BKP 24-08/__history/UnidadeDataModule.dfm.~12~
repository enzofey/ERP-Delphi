object CadUnidadeDataModule: TCadUnidadeDataModule
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
      'Database=00001P'
      'User_Name=postgres'
      'Password=evf'
      'DriverID=PG')
    Connected = True
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 48
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 104
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 160
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 216
  end
  object ConsultarUnidade: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 104
    Top = 272
  end
  object dsGridQuery: TDataSource
    DataSet = ConsultarUnidade
    Left = 200
    Top = 272
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 32
    Top = 88
  end
end
