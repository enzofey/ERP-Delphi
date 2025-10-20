object CadEnqIPIDM: TCadEnqIPIDM
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
    Left = 32
    Top = 80
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 176
    Top = 80
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object ConsultarENQIPI: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 32
    Top = 136
  end
  object dsENQIPI: TDataSource
    DataSet = ConsultarENQIPI
    Left = 120
    Top = 136
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 256
    Top = 80
  end
end
