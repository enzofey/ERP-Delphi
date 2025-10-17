object CadCSTCOFINSDataModule: TCadCSTCOFINSDataModule
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
    Left = 192
    Top = 96
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 104
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 168
  end
  object GridQuery: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      'select * from CADCSTCOFINS')
    Left = 112
    Top = 312
  end
  object dsCSTCOFINS: TDataSource
    DataSet = GridQuery
    Left = 32
    Top = 312
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
end
