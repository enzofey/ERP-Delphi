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
  object qryInsert: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 88
  end
  object qryLogin: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 408
  end
  object qrySenha: TFDQuery
    Connection = Conexão
    Left = 24
    Top = 408
  end
  object qryConsultarUsuario: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 152
  end
  object dsUsuario: TDataSource
    DataSet = qryConsultarUsuario
    Left = 128
    Top = 152
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object qryUpdate: TFDQuery
    Connection = Conexão
    Left = 112
    Top = 88
  end
  object qryDelete: TFDQuery
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
