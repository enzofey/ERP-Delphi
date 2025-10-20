object CadCSTICMSDM: TCadCSTICMSDM
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
      'server=192.168.1.23'
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
    Left = 184
    Top = 80
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object qryConsultarCSTICMS: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 56
    Top = 136
  end
  object dsCSTICMS: TDataSource
    DataSet = qryConsultarCSTICMS
    Left = 152
    Top = 136
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 264
    Top = 80
  end
end
