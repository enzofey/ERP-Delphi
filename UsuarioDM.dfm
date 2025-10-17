object CadUsuarioDM: TCadUsuarioDM
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
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 88
  end
  object LoginQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 408
  end
  object SenhaQuery: TFDQuery
    Connection = Conexão
    Left = 24
    Top = 408
  end
  object ConsultarUsuario: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 152
  end
  object dsUsuario: TDataSource
    DataSet = ConsultarUsuario
    Left = 128
    Top = 152
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 88
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 192
    Top = 88
  end
  object qryGrid: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 216
  end
  object dsGrid: TDataSource
    DataSet = qryGrid
    Left = 128
    Top = 216
  end
end
