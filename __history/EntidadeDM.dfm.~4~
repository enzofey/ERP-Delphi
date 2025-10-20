object CadEntidadeDM: TCadEntidadeDM
  Height = 480
  Width = 640
  object Conexão: TFDConnection
    Params.Strings = (
      'Database=00001P'
      'User_Name=postgres'
      'Password=evf'
      'DriverID=PG')
    LoginPrompt = False
    Left = 32
    Top = 24
  end
  object dsCadEntidade: TDataSource
    DataSet = ConsultarEntidade
    Left = 144
    Top = 144
  end
  object SelectQuery: TFDQuery
    Connection = Conexão
    Left = 32
    Top = 80
  end
  object ConsultarEntidade: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 144
  end
  object PGLink: TFDPhysPgDriverLink
    VendorLib = 'C:\Program Files (x86)\PostgreSQL\psqlODBC\bin\libpq.dll'
    Left = 88
    Top = 24
  end
  object InsertQuery: TFDQuery
    Connection = Conexão
    Left = 104
    Top = 80
  end
  object UpdateQuery: TFDQuery
    Connection = Conexão
    Left = 176
    Top = 80
  end
  object DeleteQuery: TFDQuery
    Connection = Conexão
    Left = 256
    Top = 80
  end
  object AcessoQuery: TFDQuery
    Connection = Conexão
    SQL.Strings = (
      '')
    Left = 40
    Top = 200
  end
  object dsAcesso: TDataSource
    DataSet = AcessoQuery
    Left = 120
    Top = 200
  end
end
